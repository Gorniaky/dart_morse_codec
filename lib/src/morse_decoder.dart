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
final class MorseDecoder extends Converter<Iterable<int>, Iterable<int>> {
  /// Create a [MorseDecoder]
  const MorseDecoder();

  @override
  Iterable<int> convert(Iterable<int> input) sync* {
    _MorseNode? current = _morseTree;

    for (final morseCode in input) {
      switch (morseCode) {
        case spaceCharCode:
          yield current?.code ?? unknownCharCode;
          current = _morseTree;
          break;

        default:
          if (current == null) continue;

          switch (morseCode) {
            case dahCharCode:
              current = current.dah;
              break;

            case ditCharCode:
              current = current.dit;
              break;
          }

          break;
      }
    }

    yield current?.code ?? unknownCharCode;
  }

  /// Converts [input] as text and returns the result of the conversion as text.
  String convertText(String text) {
    return .fromCharCodes(convert(text.codeUnits));
  }
}
