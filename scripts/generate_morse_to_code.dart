import "dart:io";

import "package:morse_codec/morse_codec.dart";

/// A utility script that generates the reverse Morse-to-code mapping.
///
/// This script reads the [codeToMorseMap] and creates a reverse mapping
/// which is then saved to `lib/src/morse_to_code.dart`. This ensures that
/// both maps stay in sync without manual updates.
///
/// To run this script:
/// ```bash
/// dart scripts/generate_morse_to_code.dart
/// ```
void main() async {
  final morseToCodeMap = <String, int>{};

  for (final entry in codeToMorseMap.entries) {
    morseToCodeMap.putIfAbsent(
      String.fromCharCodes(entry.value),
      () => entry.key,
    );
  }

  final buffer = StringBuffer()
    ..writeAll([
      'part of "../morse_codec.dart";',
      "",
      "const _morseToCodeMap = <String, int>{",
      for (final entry in morseToCodeMap.entries)
        '\t"${entry.key}": ${entry.value}, // ${String.fromCharCode(entry.value)}',
      "};",
      "",
    ], "\n");

  final File file = .new("lib/src/morse_to_code.dart");

  await file.writeAsString(buffer.toString());
}
