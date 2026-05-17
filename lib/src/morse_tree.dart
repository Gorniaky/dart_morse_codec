part of "../morse_codec.dart";

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart scripts/generate_morse_tree.dart

// coverage:ignore-file
// ignore_for_file: type=lint
// dart format off

// ignore: unused_element
final class _MorseNode {
  const _MorseNode({this.code, this.dah, this.dit});

  final int? code;
  final _MorseNode? dah;
  final _MorseNode? dit;
}

const _MorseNode _morseTree = .new(
  code: 32, //  
  dah: .new(
    code: 84, // T
    dah: .new(
      code: 77, // M
      dah: .new(
        code: 79, // O
        dah: .new(
          dah: .new(code: 48),
          dit: .new(code: 57),
        ),
        dit: .new(
          code: 211, // Ó
          dit: .new(
            code: 56, // 8
            dit: .new(code: 58),
          ),
        ),
      ),
      dit: .new(
        code: 71, // G
        dah: .new(
          code: 81, // Q
          dah: .new(code: 209),
        ),
        dit: .new(
          code: 90, // Z
          dah: .new(dah: .new(code: 44)),
          dit: .new(code: 55),
        ),
      ),
    ),
    dit: .new(
      code: 78, // N
      dah: .new(
        code: 75, // K
        dah: .new(
          code: 89, // Y
          dit: .new(
            code: 40, // (
            dah: .new(code: 41),
          ),
        ),
        dit: .new(
          code: 67, // C
          dah: .new(
            dah: .new(code: 33),
            dit: .new(code: 59),
          ),
          dit: .new(code: 199),
        ),
      ),
      dit: .new(
        code: 68, // D
        dah: .new(
          code: 88, // X
          dit: .new(code: 47),
        ),
        dit: .new(
          code: 66, // B
          dah: .new(code: 61),
          dit: .new(
            code: 54, // 6
            dah: .new(code: 45),
          ),
        ),
      ),
    ),
  ),
  dit: .new(
    code: 69, // E
    dah: .new(
      code: 65, // A
      dah: .new(
        code: 87, // W
        dah: .new(
          code: 74, // J
          dah: .new(
            code: 49, // 1
            dit: .new(code: 39),
          ),
        ),
        dit: .new(
          code: 80, // P
          dah: .new(
            code: 193, // Á
            dit: .new(code: 64),
          ),
        ),
      ),
      dit: .new(
        code: 82, // R
        dah: .new(
          code: 196, // Ä
          dah: .new(code: 194),
          dit: .new(
            code: 43, // +
            dah: .new(code: 46),
          ),
        ),
        dit: .new(
          code: 76, // L
          dah: .new(
            code: 201, // É
            dit: .new(code: 34),
          ),
          dit: .new(code: 38),
        ),
      ),
    ),
    dit: .new(
      code: 73, // I
      dah: .new(
        code: 85, // U
        dah: .new(
          code: 207, // Ï
          dah: .new(code: 50),
          dit: .new(
            code: 205, // Í
            dah: .new(code: 95),
            dit: .new(code: 63),
          ),
        ),
        dit: .new(
          code: 70, // F
          dit: .new(code: 200),
        ),
      ),
      dit: .new(
        code: 83, // S
        dah: .new(
          code: 86, // V
          dah: .new(code: 51),
          dit: .new(dit: .new(dah: .new(code: 36))),
        ),
        dit: .new(
          code: 72, // H
          dah: .new(code: 52),
          dit: .new(code: 53),
        ),
      ),
    ),
  ),
);
