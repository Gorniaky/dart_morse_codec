import "dart:io";

import "package:morse_codec/morse_codec.dart";

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
