part of "../morse_codec.dart";

/// A [Codec] that encodes and decodes Morse code.
///
/// This codec combines [MorseEncoder] and [MorseDecoder] into a single unit
/// for convenient translation between text and Morse code. It implements the
/// [Codec<Iterable<int>, Iterable<int>>] interface.
///
/// ## Example
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
  /// By default, it uses [MorseDecoder.tree] and a standard [MorseEncoder].
  const MorseCodec({this.decoder = const .tree(), this.encoder = const .new()});

  @override
  final MorseDecoder decoder;

  @override
  final MorseEncoder encoder;
}
