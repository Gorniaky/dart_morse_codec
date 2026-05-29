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
      "// coverage:ignore-file",
      "// ignore_for_file: type=lint",
      "// dart format off",
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
      "const _MorseNode _morseTree = ${_generateNode(root)}",
      "",
    ], "\n");

  String text = buffer.toString();

  do {
    final newText = text.replaceAll("),)", "))");
    if (newText.length == text.length) break;
    text = newText;
  } while (true);

  final file = File("lib/src/morse_tree.dart");

  await file.writeAsString(text);
}

String _generateNode(_MorseNode? node, [int indent = 0]) {
  final suffix = indent == 0 ? ";" : ",";

  if (node == null) return "null$suffix";

  if ((node.code ?? node.dah ?? node.dit) == null) return "null$suffix";

  if ((node.dah ?? node.dit) == null) return ".new(code: ${node.code})$suffix";

  if ((node.code ?? node.dah) == null) {
    return ".new(dit: ${_generateNode(node.dit, indent + 1)})$suffix";
  }

  if ((node.code ?? node.dit) == null) {
    return ".new(dah: ${_generateNode(node.dah, indent + 1)})$suffix";
  }

  final space = "  " * indent;

  final StringBuffer buffer = .new()
    ..writeAll([
      ".new(",
      if (node.code case final code?) "$space  code: $code,",
      if (node.dah case final dah?)
        "$space  dah: ${_generateNode(dah, indent + 1)}",
      if (node.dit case final dit?)
        "$space  dit: ${_generateNode(dit, indent + 1)}",
      "$space)$suffix",
    ], "\n");

  return buffer.toString();
}
