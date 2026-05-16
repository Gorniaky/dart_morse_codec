import "dart:io";

import "package:morse_codec/morse_codec.dart";

final class _MorseNode {
  int? code;
  _MorseNode? dah;
  _MorseNode? dit;
}

void main() async {
  final _MorseNode root = .new();

  final existants = <String>{};

  for (final entry in codeToMorseMap.entries) {
    if (!existants.add(entry.value.join())) continue;

    _MorseNode current = root;

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

  final StringBuffer buffer = .new()
    ..writeAll([
      'part of "../morse_codec.dart";',
      "",
      "// GENERATED CODE - DO NOT MODIFY BY HAND",
      "// dart scripts/generate_morse_tree.dart",
      "",
      "// ignore: unused_element",
      "final class _MorseNode {",
      "  const _MorseNode({this.code, this.dah, this.dit});",
      "",
      "  final int? code;",
      "  final _MorseNode? dah;",
      "  final _MorseNode? dit;",
      "}",
      "",
      "const _MorseNode _morseTree = ${_generateNode(root, 0)};",
      "",
    ], "\n");

  final file = File("lib/src/morse_tree.dart");

  await file.writeAsString(buffer.toString());
}

String _generateNode(_MorseNode? node, int indent) {
  if (node == null) return "null";

  final space = "  " * indent;

  return """
.new(
$space  code: ${node.code}, // ${String.fromCharCode(node.code ?? 32)}
$space  dah: ${_generateNode(node.dah, indent + 1)},
$space  dit: ${_generateNode(node.dit, indent + 1)},
$space)""";
}
