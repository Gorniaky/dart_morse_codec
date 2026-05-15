/// Morse Codec - Efficient text to Morse code encoding and decoding.
///
/// This library provides converters for encoding text to Morse code representation
/// and decoding Morse code back to text. It implements the standard [Converter]
/// interface from `dart:convert` for seamless integration with Dart's encoding ecosystem.
///
/// ## Morse Code Format
///
/// - Dot (dit): `.` (character code 46)
/// - Dash (dah): `-` (character code 45)
/// - Character separator: ` ` (space, code 32)
/// - Word separator: `/` (code 47)
///
/// ## Character Support
///
/// The package supports:
/// - **Letters**: A-Z (case-insensitive)
/// - **Digits**: 0-9
/// - **Punctuation**: Common symbols like `.`, `,`, `!`, `?`, etc.
/// - **Special characters**: `@`, `$`, `&`, and more
///
/// Unknown characters are mapped to code 133 (unknown character marker).
///
/// ## Performance
///
/// - Time Complexity: O(n) for both encoding and decoding
/// - Space Complexity: O(n) for output with minimal overhead
/// - Memory Efficient: Uses lazy evaluation with generator functions
/// - No External Dependencies: Zero dependency bloat
///
/// See the documentation for more examples and advanced usage patterns.
library;

import "dart:convert";

part "src/code_to_morse.dart";
part "src/extensions/iterable.dart";
part "src/morse_decoder.dart";
part "src/morse_encoder.dart";
part "src/morse_to_code.dart";
part "src/morse_tree_decoder.dart";
part "src/morse_codec.dart";

/// Character code for space (` `).
///
/// Used as the separator between individual Morse characters and also as
/// a component of Morse sequences.
///
/// Value: 32
const spaceCharCode = 32;

/// Character code for dash/dah (`-`).
///
/// Represents the longer signal in Morse code. In Morse sequences, dashes
/// are combined with dots to form characters.
///
/// Value: 45
const dahCharCode = 45;

/// Character code for dot/dit (`.`).
///
/// Represents the shorter signal in Morse code. In Morse sequences, dots
/// are combined with dashes to form characters.
///
/// Value: 46
const ditCharCode = 46;

/// Character code for forward slash (`/`).
///
/// Used as the word separator in Morse code. When encoding, spaces in the
/// input text are converted to this character. When decoding, this character
/// indicates a word boundary.
///
/// Value: 47
const slashCharCode = 47;

/// Character code for unknown/invalid character marker.
///
/// When a character cannot be encoded to Morse code (not in the character map),
/// or when a Morse sequence cannot be decoded (not a valid Morse code),
/// this code is used to represent the unmapped character.
///
/// Value: 65533 ( character in extended ASCII)
const unknownCharCode = 65533;

/// Internal constant for the unknown character code as a list.
///
/// Used internally for efficient yielding of unknown character markers
/// in generator functions.
const _unknownCharCodeList = [unknownCharCode];
