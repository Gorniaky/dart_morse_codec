part of "../morse_codec.dart";

/// A Morse code decoder that uses a tree-based lookup algorithm.
///
/// [_MorseTreeDecoder] implements the [MorseDecoder] interface. It builds an
/// internal prefix tree (trie) from the [codeToMorseMap] to provide efficient
/// O(n) decoding, where n is the length of the Morse sequence for a single
/// character.
final class _MorseTreeDecoder
    with Converter<Iterable<int>, Iterable<int>>
    implements MorseDecoder {
  const _MorseTreeDecoder();

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

  @override
  String convertText(String text) {
    return .fromCharCodes(convert(text.codeUnits));
  }
}
