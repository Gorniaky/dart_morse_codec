part of "../morse_codec.dart";

/// A node in the Morse code decoding tree.
///
/// Each node represents a position in a Morse sequence. Navigating through
/// the tree using dots and dashes allows for efficient decoding.
final class _MorseNode {
  /// The character code associated with this node, if it represents a complete
  /// Morse sequence.
  int? code;

  /// The child node reached by a dash (`-`).
  _MorseNode? dah;

  /// The child node reached by a dot (`.`).
  _MorseNode? dit;
}

/// A Morse code decoder that uses a tree-based lookup algorithm.
///
/// [_MorseTreeDecoder] implements the [MorseDecoder] interface. It builds an
/// internal prefix tree (trie) from the [codeToMorseMap] to provide efficient
/// O(n) decoding, where m is the length of the Morse sequence for a single
/// character.
///
/// This implementation is particularly efficient for decoding because it
/// avoids string construction and map lookups during the traversal process.
final class _MorseTreeDecoder
    with Converter<Iterable<int>, Iterable<int>>
    implements MorseDecoder {
  static final _MorseNode _root = .new();
  static bool _treeIsLoaded = false;

  /// Loads the decoding tree from the [codeToMorseMap].
  ///
  /// This is called lazily during the first call to [convert].
  static void _loadTree() {
    if (_treeIsLoaded) return;

    final existants = <String>{};

    for (final entry in codeToMorseMap.entries) {
      if (!existants.add(entry.value.join())) continue;

      _MorseNode current = _root;

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

  const _MorseTreeDecoder();

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

  /// Decodes a single Morse sequence into its corresponding character code.
  ///
  /// Traverses the tree based on the provided [morseCodeUnits].
  int? _decodeLetter(List<int> morseCodeUnits) {
    _MorseNode? current = _root;

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
