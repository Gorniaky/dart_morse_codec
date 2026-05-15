part of "../morse_codec.dart";

/// Converts text to Morse code representation.
///
/// [MorseEncoder] is a [Converter] that transforms character codes (typically
/// from strings) into Morse code representation. It implements the standard
/// [Converter<Iterable<int>, Iterable<int>>] interface for compatibility with
/// Dart's encoding ecosystem.
///
/// ## Morse Code Format
///
/// The encoder produces Morse code where:
/// - `.` (dot/dit, code 46) represents short signals
/// - `-` (dash/dah, code 45) represents long signals
/// - ` ` (space, code 32) separates individual characters
/// - Unknown characters map to code 133
///
/// ## Character Support
///
/// Supports encoding of:
/// - **Letters**: A-Z (case-insensitive - converted to uppercase internally)
/// - **Digits**: 0-9
/// - **Punctuation**: Common symbols (`.`, `,`, `!`, `?`, `'`, `"`, etc.)
/// - **Special characters**: `@`, `$`, `&`, mathematical operators
/// - **Input space**: Converted to word separator (`/`) in output
///
/// Characters not in the encoding map become the unknown character (code 133).
///
/// ## Performance
///
/// - **Time Complexity**: O(n) where n is the number of input characters
/// - **Space Complexity**: O(n) for output
/// - **Lazy Evaluation**: Uses generator function for memory efficiency
/// - **Character Lookup**: O(1) map-based lookup per character
///
/// ## Example
///
/// ```dart
/// // Encode single character
/// final a = String.fromCharCodes(const MorseEncoder().convert('A'.codeUnits));
/// print(a);  // .-
///
/// // Encode word
/// final hello = String.fromCharCodes(const MorseEncoder().convert('HELLO'.codeUnits));
/// print(hello);  // .... . .-.. .-.. ---
///
/// // Encode phrase with word separator
/// final greeting = String.fromCharCodes(const MorseEncoder().convert('HELLO WORLD'.codeUnits));
/// print(greeting);  // .... . .-.. .-.. --- / .-- --- .-. .-.. -..
/// ```
///
/// ## Related
/// - [MorseDecoder]: Decodes Morse code back to text
final class MorseEncoder extends Converter<Iterable<int>, Iterable<int>> {
  const MorseEncoder();

  @override
  Iterable<int> convert(Iterable<int> input) sync* {
    final iterator = input.iterator;

    if (!iterator.moveNext()) return;

    yield* codeToMorseMap[iterator.current] ?? _unknownCharCodeList;

    while (iterator.moveNext()) {
      yield spaceCharCode;
      yield* codeToMorseMap[iterator.current] ?? _unknownCharCodeList;
    }
  }

  String convertText(String text) {
    return .fromCharCodes(convert(text.codeUnits));
  }
}
