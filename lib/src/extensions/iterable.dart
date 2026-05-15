part of "../../morse_codec.dart";

/// Extension methods for [Iterable<int>] to facilitate conversion back to strings.
extension IntIterableExtension on Iterable<int> {
  /// Converts this iterable of character codes back to a [String].
  ///
  /// This is a convenience method that wraps [String.fromCharCodes].
  ///
  /// ## Example
  /// ```dart
  /// final codes = [72, 69, 76, 76, 79];
  /// print(codes.toText()); // HELLO
  /// ```
  String toText() {
    return String.fromCharCodes(this);
  }
}
