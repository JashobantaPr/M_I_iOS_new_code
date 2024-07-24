import 'package:encrypt/encrypt.dart';

class EncryptionService {
  static final key = Key.fromUtf8('df22bb7f8ef8f7b6d0ad6d58de758182');
  static final iv = IV.fromLength(16);
  static final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

  static String encryptText(String text) {
    final encrypted = encrypter.encrypt(text, iv: iv);
    return encrypted.base64;
  }
}
