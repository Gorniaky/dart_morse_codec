part of "../morse_codec.dart";

/// A [Codec] that encodes and decodes Morse code.
///
/// This codec combines [MorseEncoder] and [MorseDecoder] into a single unit
/// for convenient translation between text and Morse code. It implements the
/// [Codec<Iterable<int>, Iterable<int>>] interface.
///
/// ### Example
///
/// ```dart
/// const codec = MorseCodec();
///
/// // Encode text to Morse
/// final encoded = codec.encode('HELLO'.codeUnits);
/// print(String.fromCharCodes(encoded)); // .... . .-.. .-.. ---
///
/// // Decode Morse to text
/// final decoded = codec.decode(encoded);
/// print(String.fromCharCodes(decoded)); // HELLO
/// ```
final class MorseCodec with Codec<Iterable<int>, Iterable<int>> {
  /// You can optionally provide a custom [decoder] or [encoder].
  /// By default, it uses [MorseDecoder] and a standard [MorseEncoder].
  const MorseCodec({this.decoder = const .new(), this.encoder = const .new()});

  @override
  /// Morse decoder
  final MorseDecoder decoder;

  @override
  /// Morse encoder
  final MorseEncoder encoder;

  /// A shortcut for [MorseDecoder.convertText]
  String decodeText(String input) {
    return decoder.convertText(input);
  }

  /// A shortcut for [MorseEncoder.convertText]
  String encodeText(String input) {
    return encoder.convertText(input);
  }
}

/// An instance of the default implementation of the [MorseCodec].
///
/// This instance provides a convenient access to the most common Morse
/// use cases.
///
/// Examples:
/// ```dart
/// var encoded = morse.encode("SOS".codeUnits);
/// var decoded = morse.decode("... --- ...".codeUnits);
/// ```
const MorseCodec morse = .new();
