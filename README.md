# Morse Codec

[![License](https://img.shields.io/badge/license-Apache_2.0-blue.svg)](LICENSE)

A lightweight Dart package for encoding and decoding Morse code. This package provides efficient converters to transform text into Morse code and vice versa, supporting letters, digits, and common punctuation marks.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
  - [Basic Text Encoding](#basic-text-encoding)
  - [Basic Text Decoding](#basic-text-decoding)
  - [Advanced Usage](#advanced-usage)
- [Supported Characters](#supported-characters)
- [Performance](#performance)
- [Contributing](#contributing)
- [License](#license)

## Installation

Run the command line:

```bash
dart pub add morse_codec
```

## Usage

### Basic Text Encoding

Convert text to Morse code:

```dart
import "package:morse_codec/morse_codec.dart";

void main() {
  const text = "Hello World!";
  
  // Convert text to Morse code
  final morseCode = const MorseEncoder().convertText(text);
  
  print(morseCode);
  // Output: .... . .-.. .-.. --- / .-- --- .-. .-.. -.. -.-.--
}
```

**Explanation:**

- `.` represents a dot (dit)
- `-` represents a dash (dah)
- ` ` Space separates individual characters
- `/` separates words

### Basic Text Decoding

Convert Morse code back to text:

```dart
import "package:morse_codec/morse_codec.dart";

void main() {
  const morseCode = ".... . .-.. .-.. ---";
  
  // Convert Morse code to text
  final text = const MorseDecoder().convertText(morseCode);
  
  print(text);
  // Output: HELLO
}
```

### Advanced Usage

#### Working with Character Codes Directly

If you need fine-grained control over the conversion process:

```dart
import "package:morse_codec/morse_codec.dart";

void main() {  
  // Work directly with character codes
  const charCodes = [83, 79, 83]; // "SOS"
  
  final morseCharCodes = const MorseEncoder().convert(charCodes).toList();
  
  print("Raw Morse codes: $morseCharCodes");
  // Converts to: [46, 46, 46, 32, 45, 45, 45, 32, 46, 46, 46]
  // Which displays as: "... --- ..."
}
```

---

## Supported Characters

### Letters (A-Z)

- Case-insensitive encoding (input is converted to uppercase)
- All 26 letters supported

| Letter | Morse | Letter | Morse |
| ------ | ----- | ------ | ----- |
| A | .- | N | -. |
| B | -... | O | --- |
| C | -.-. | P | .--. |
| D | -.. | Q | --.- |
| E | . | R | .-. |
| F | ..-. | S | ... |
| G | --. | T | - |
| H | .... | U | ..- |
| I | .. | V | ...- |
| J | .--- | W | .-- |
| K | -.- | X | -..- |
| L | .-.. | Y | -.-- |
| M | -- | Z | --.. |

### Digits (0-9)

- All 10 digits supported

| Digit | Morse | Digit | Morse |
| ----- | ----- | ----- | ----- |
| 0 | ----- | 5 | ..... |
| 1 | .---- | 6 | -.... |
| 2 | ..--- | 7 | --... |
| 3 | ...-- | 8 | ---.. |
| 4 | ....- | 9 | ----. |

### Punctuation & Symbols

- Exclamation mark: `!` → `-.-.--`
- Question mark: `?` → `..--..`
- Period: `.` → `.-.-.-`
- Comma: `,` → `--..--`
- Apostrophe: `'` → `.----.`
- Exclamation: `!` → `-.-.--`
- Slash: `/` → `-..-.`
- Left parenthesis: `(` → `-.--.`
- Right parenthesis: `)` → `-.--.-`
- Ampersand: `&` → `.-...`
- Colon: `:` → `---...`
- Semicolon: `;` → `-.-.-.`
- Plus: `+` → `.-.-.`
- Minus: `-` → `-....-`
- Equals: `=` → `-...-`
- At symbol: `@` → `.--.-.`
- Dollar sign: `$` → `...-..-`
- Quote: `"` → `.-..-.`
- Space: ` ` → `/`

### Unknown Characters

The encoder and decoder work in different ways, see the following examples:

```dart
import "package:morse_codec/morse_codec.dart";

void main() {  
  // Using an unsupported emoji
  final result = const MorseEncoder().convertText("Hi 😊");

  print("Result: $result");
  // .... .. /
  // Unknown characters will not be encoded

  // Using an unsupported emoji
  final result = const MorseDecoder().convertText(". .......... -");

  print("Result: $result");
  // E�T
  // Invalid Morse codes will be decoded as unknown characters
}
```

## Performance

The `morse_codec` package is designed for high performance:

- **Time Complexity**: O(n) for both encoding and decoding, where n is the number of characters
- **Space Complexity**: O(n) for the output, with minimal overhead
- **Memory Efficient**: Uses lazy evaluation with iterables instead of eager list allocation

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request to the [repository](https://github.com/Gorniaky/dart_morse_codec).

### Development Setup

```bash
# Clone the repository
git clone https://github.com/Gorniaky/dart_morse_codec.git
cd dart_morse_codec

# Install dependencies
dart pub get

# Run tests
dart test

# Run analysis
dart analyze

# Format code
dart format .
```

### Testing

The package includes a comprehensive test suite. Run tests with:

```bash
dart test
```

## License

This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details.

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for version history and release notes.

## Additional Resources

- [Morse Code Wikipedia](https://en.wikipedia.org/wiki/Morse_code)
- [Dart Converter Documentation](https://api.dart.dev/stable/dart-convert/Converter-class.html)
- [Package on Pub.dev](https://pub.dev/packages/morse_codec)
- [GitHub Repository](https://github.com/Gorniaky/dart_morse_codec)

---

<!-- markdownlint-disable MD036 -->
**Built with ❤️ for Dart developers**
<!-- markdownlint-enable MD036 -->
