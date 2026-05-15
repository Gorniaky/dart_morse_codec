part of "../morse_codec.dart";

final class MorseCodec with Codec<Iterable<int>, Iterable<int>> {
  const MorseCodec({this.decoder = const .tree(), this.encoder = const .new()});

  @override
  final MorseDecoder decoder;

  @override
  final MorseEncoder encoder;
}
