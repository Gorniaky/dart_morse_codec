part of "../morse_codec.dart";

final class MorseNode {
  int? code;

  /// `-`
  MorseNode? dah;

  /// `.`
  MorseNode? dit;

  MorseNode({this.code, this.dah, this.dit});
}

final class MorseTreeDecoder
    with Converter<Iterable<int>, Iterable<int>>
    implements MorseDecoder {
  static final MorseNode _root = .new();
  static bool _treeIsLoaded = false;

  static void _loadTree() {
    if (_treeIsLoaded) return;

    final existants = <String>{};

    for (final entry in codeToMorseMap.entries) {
      if (!existants.add(entry.value.join())) continue;

      MorseNode current = _root;

      for (final code in entry.value) {
        switch (code) {
          case dahCharCode:
            current = current.dah ??= .new();
            break;

          case ditCharCode:
            current = current.dit ??= .new();
            break;
        }
      }

      current.code = entry.key;
    }

    _treeIsLoaded = true;
  }

  const MorseTreeDecoder();

  @override
  Iterable<int> convert(Iterable<int> input) sync* {
    _loadTree();

    final letter = <int>[];

    for (final morseCode in input) {
      switch (morseCode) {
        case spaceCharCode:
          yield _decodeLetter(letter) ?? unknownCharCode;
          letter.clear();
          break;

        case slashCharCode:
          letter.add(spaceCharCode);
          break;

        default:
          letter.add(morseCode);
          break;
      }
    }

    if (letter.isEmpty) return;

    yield _decodeLetter(letter) ?? unknownCharCode;
  }

  @override
  String convertText(String text) {
    return .fromCharCodes(convert(text.codeUnits));
  }

  int? _decodeLetter(List<int> morseCodeUnits) {
    MorseNode? current = _root;

    for (final codeUnit in morseCodeUnits) {
      switch (codeUnit) {
        case dahCharCode:
          current = current!.dah;
          break;

        case ditCharCode:
          current = current!.dit;
          break;
      }

      if (current == null) break;
    }

    return current?.code;
  }
}
