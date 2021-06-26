import 'package:encrypt/encrypt.dart' as encrypt;

class MyEncryptionDecryption {
  static final key = encrypt.Key.fromLength(32); //32 is the number of bytes
  static final iv = encrypt.IV.fromLength(16);
  static final encrypter = encrypt.Encrypter(encrypt.AES(key));
  // This is for AES Encryption
  static encryptAES(text) {
    final encrypted = encrypter.encrypt(text, iv: iv);
    print(encrypted.bytes);
    print(encrypted.base16);
    print(encrypted.base64);
    return encrypted;
  }

  static decryptAES(text) {
    return encrypter.decrypt(text, iv: iv);
  }
}
