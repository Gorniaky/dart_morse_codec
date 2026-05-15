part of "../morse_codec.dart";

/// Converts Morse code representation back to character codes.
///
/// [MorseDecoder] is a [Converter] that transforms Morse code (represented as
/// character codes) back into the original character codes. It implements the
/// standard [Converter<Iterable<int>, Iterable<int>>] interface and provides
/// both code-based and string-based decoding methods.
///
/// ## Morse Code Format
///
/// The decoder expects Morse code in the following format:
/// - `.` (dot/dit, code 46) represents short signals
/// - `-` (dash/dah, code 45) represents long signals
/// - ` ` (space, code 32) separates individual Morse characters
/// - `/` (code 47) separates words (becomes space in output)
///
/// ## Algorithm
///
/// Uses a map-based lookup approach with O(1) average-case character retrieval.
/// Characters are accumulated until a space is encountered, then decoded via
/// map lookup. Unknown Morse patterns map to code 133.
final class MorseDecoder extends Converter<Iterable<int>, Iterable<int>> {
  const factory MorseDecoder.tree() = _MorseTreeDecoder;

  const MorseDecoder();

  @override
  Iterable<int> convert(Iterable<int> input) sync* {
    final letter = <int>[];

    for (final char in input) {
      switch (char) {
        case spaceCharCode:
          yield _morseToCodeMap[String.fromCharCodes(letter)] ??
              unknownCharCode;
          letter.clear();
          break;
        default:
          letter.add(char);
          break;
      }
    }

    if (letter.isEmpty) return;

    yield _morseToCodeMap[String.fromCharCodes(letter)] ?? unknownCharCode;
  }

  String convertText(String text) {
    return .fromCharCodes(convert(text.codeUnits));
  }
}
