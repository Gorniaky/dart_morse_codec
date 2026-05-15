part of "../../morse_codec.dart";

extension IntIterableExtension on Iterable<int> {
  /// Convert code units to text
  String toText() {
    return .fromCharCodes(this);
  }
}
