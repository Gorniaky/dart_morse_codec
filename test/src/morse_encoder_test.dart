import "package:morse_codec/morse_codec.dart";
import "package:test/test.dart";

void main() {
  group("Morse encoder", () {
    test("SOS", () {
      const text = "SOS";
      const expected = "... --- ...";

      expect(
        String.fromCharCodes(const MorseEncoder().convert(text.runes)),
        expected,
      );
    });

    test("Hello World!", () {
      const text = "Hello World!";
      const expected = ".... . .-.. .-.. --- / .-- --- .-. .-.. -.. -.-.--";

      expect(
        String.fromCharCodes(const MorseEncoder().convert(text.runes)),
        expected,
      );
    });

    test("Invalid Text", () {
      const text = "��Hello� �World!��";
      const expected = ".... . .-.. .-.. --- / .-- --- .-. .-.. -.. -.-.--";

      expect(
        String.fromCharCodes(const MorseEncoder().convert(text.runes)),
        expected,
      );
    });

    test("Alphabet", () {
      const text =
          " ABCDEFGHIJKLMNOPQRSTUVWXYZ  0123456789   !\"\$&'()+,-./:;=?@_    ";
      const expected =
          "/ .- -... -.-. -.. . ..-. --. .... .. .--- -.- .-.. -- -. --- .--. --.- .-. ... - ..- ...- .-- -..- -.-- --.. / / ----- .---- ..--- ...-- ....- ..... -.... --... ---.. ----. / / / -.-.-- .-..-. ...-..- .-... .----. -.--. -.--.- .-.-. --..-- -....- .-.-.- -..-. ---... -.-.-. -...- ..--.. .--.-. ..--.- / / / /";

      expect(
        String.fromCharCodes(const MorseEncoder().convert(text.runes)),
        expected,
      );
    });

    test("Empty", () {
      const text = "";
      const expected = "";

      expect(
        String.fromCharCodes(const MorseEncoder().convert(text.runes)),
        expected,
      );
    });
  });
}
