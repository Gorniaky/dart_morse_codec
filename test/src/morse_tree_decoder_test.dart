import "package:morse_codec/morse_codec.dart";
import "package:test/test.dart";

void main() {
  group("Morse tree decoder", () {
    test("SOS", () {
      const text = "... --- ...";
      const expected = "SOS";

      expect(
        String.fromCharCodes(const MorseDecoder.tree().convert(text.codeUnits)),
        expected,
      );
    });

    test("Hello World!", () {
      const text = ".... . .-.. .-.. --- / .-- --- .-. .-.. -.. -.-.--";
      const expected = "HELLO WORLD!";

      expect(
        String.fromCharCodes(const MorseDecoder.tree().convert(text.codeUnits)),
        expected,
      );
    });
  });
}
