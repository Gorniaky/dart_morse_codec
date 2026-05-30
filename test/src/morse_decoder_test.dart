import "package:morse_codec/morse_codec.dart";
import "package:test/test.dart";

void main() {
  group("Morse decoder", () {
    const MorseDecoder converter = .new();

    test("SOS", () {
      const text = "... --- ...";
      const expected = "SOS";

      expect(String.fromCharCodes(converter.convert(text.runes)), expected);
    });

    test("Hello World!", () {
      const text = ".... . .-.. .-.. --- / .-- --- .-. .-.. -.. -.-.--";
      const expected = "HELLO WORLD!";

      expect(String.fromCharCodes(converter.convert(text.runes)), expected);
    });

    test("Alphabet", () {
      const text =
          "/  ...... .- -... -.-. -.. . ..-. --. .... .. .--- -.- .-.. -- -. --- .--. --.- .-. ... - ..- ...- .-- -..- -.-- --.. / / ----- .---- ..--- ...-- ....- ..... -.... --... ---.. ----. / / / -.-.-- .-..-. ...-..- .-... .----. -.--. -.--.- .-.-. --..-- -....- .-.-.- -..-. ---... -.-.-. -...- ..--.. .--.-. ..--.- / / / /";
      const expected =
          " �ABCDEFGHIJKLMNOPQRSTUVWXYZ  0123456789   !\"\$&'()+,-./:;=?@_    ";

      expect(String.fromCharCodes(converter.convert(text.runes)), expected);
    });

    test("Empty", () {
      const text = "";
      const expected = "";

      expect(String.fromCharCodes(converter.convert(text.runes)), expected);
    });
  });
}
