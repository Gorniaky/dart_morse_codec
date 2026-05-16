import "package:morse_codec/morse_codec.dart";

void main() {
  {
    const rawSOS = "SOS";

    final encodedChars = const MorseEncoder().convert(rawSOS.codeUnits);

    print(encodedChars); // (46, 46, 46, 32, 45, 45, 45, 32, 46, 46, 46)

    final encodedText = String.fromCharCodes(encodedChars);

    print(encodedText); // ... --- ...

    final decodedChars = const MorseDecoder().convert(encodedChars);

    print(decodedChars); // (83, 79, 83)

    final decodedText = String.fromCharCodes(decodedChars);

    print(decodedText); // SOS
  }

  {
    const rawSOS = "SOS";

    final encodedText = const MorseEncoder().convertText(rawSOS);

    print(encodedText); // ... --- ...

    final decodedText = const MorseDecoder().convertText(encodedText);

    print(decodedText); // SOS
  }
}
