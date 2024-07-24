import 'dart:convert';
import 'package:encrypt/encrypt.dart' as encrypt;

class EncryptionUtils {
  static String encryptData(String data, String key, String ivKey) {
    final keyBytes = utf8.encode(key.padRight(16, '0').substring(0, 16)); // Pad or truncate the key
    final iv = encrypt.IV.fromBase16(ivKey); // Convert IV from Base16

    final encrypter = encrypt.Encrypter(encrypt.AES(encrypt.Key.fromLength(16))); // Create AES encrypter
    final encrypted = encrypter.encrypt(data, iv: iv); // Encrypt data

    // Base64 encode encrypted data and IV
    final base64Encrypted = encrypted.base64;
    final base64Iv = iv.base64;

    return '$base64Encrypted:$base64Iv';
  }
}
