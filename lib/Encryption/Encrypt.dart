import 'package:encrypt/encrypt.dart';

class Encrypt{

  final String _key='qwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqw';

    String encrypt_pass(String pass) {
      final key = Key.fromUtf8(_key);
      final iv = IV.fromLength(16);

      final encrypter = Encrypter(AES(key));

      final encrypted = encrypter.encrypt(pass, iv: iv);
      print(encrypted.base64); // R4PxiU3h8YoIRqVowBXm36ZcCeNeZ4s1OvVBTfFlZRdmohQqOpPQqD1YecJeZMAop/hZ4OxqgC1WtwvX/hP9mw==
      return encrypted.base64;
}

  String DecryptPass(String pass)
  {
    final key = Key.fromUtf8(_key);
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(key));

    final decrypted = encrypter.decrypt64(pass,iv: iv);

    print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
   return decrypted;
  }

}

