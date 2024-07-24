import 'dart:convert';

import 'package:incentivesgit/core/app_export.dart';

import '../../../../core/utils/cache_service.dart';
import '../../service/myorder_services.dart';
import '../../viewDetails/model/voucher_details.dart';
import '../models/myorders.model.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class MyOrderController extends GetxController {
  RxList<MyOrdersModel>? myOdersList = <MyOrdersModel>[].obs;
  Rx<VoucherDetailsModel>? voucherDetails = VoucherDetailsModel().obs;

  final CacheService _cacheService = CacheService();
  String? id;
  // final Id = Rx<String?>(null);
  final compantId = Rx<String?>(null);
  final orderId = Rx<String?>(null);

  viewVoucher() async {
    String? userId = await _cacheService.getUserId();
    String? compantId = await _cacheService.getCompanyId();

    String? id = encryptUserid(userId.toString(), key);
    String? OrdercompantId = encryptCompanyId(compantId.toString(), key);
    String? oredrId = encryptOrderid(orderId.value.toString(), key);

    getVoucherDetails(id, OrdercompantId, oredrId);
  }

  String key = "df22bb7f8ef8f7b6d0ad6d58de758182";

  onChangeOrderId(String? id) {
    orderId.value = id;
  }

  @override
  void onInit() {
    super.onInit();
    getMyOderList();
  }

  String encryptUserid(String userId, String key) {
    int cipherKeyLen = 16;
    String cipherName = "AES/CBC/PKCS5PADDING";

    if (key.length < cipherKeyLen) {
      key = key.padRight(cipherKeyLen, '0');
    } else if (key.length > cipherKeyLen) {
      key = key.substring(0, cipherKeyLen);
    }

    String ivKey = "1234567891011121";
    final iv = encrypt.IV.fromUtf8(ivKey);

    final encrypter = encrypt.Encrypter(
        encrypt.AES(encrypt.Key.fromUtf8(key), mode: encrypt.AESMode.cbc));

    final encrypted = encrypter.encrypt(userId, iv: iv);
    final encryptedBytes = encrypted.bytes;
    final encryptedBase64 = base64.encode(encryptedBytes);

    final ivBase64 = base64.encode(utf8.encode(ivKey));

    return '$encryptedBase64:$ivBase64';
  }

  String encryptCompanyId(String companyId, String key) {
    int cipherKeyLen = 16;
    String cipherName = "AES/CBC/PKCS5PADDING";

    if (key.length < cipherKeyLen) {
      key = key.padRight(cipherKeyLen, '0');
    } else if (key.length > cipherKeyLen) {
      key = key.substring(0, cipherKeyLen);
    }

    String ivKey = "1234567891011121";
    final iv = encrypt.IV.fromUtf8(ivKey);

    final encrypter = encrypt.Encrypter(
        encrypt.AES(encrypt.Key.fromUtf8(key), mode: encrypt.AESMode.cbc));

    final encrypted = encrypter.encrypt(companyId, iv: iv);
    final encryptedBytes = encrypted.bytes;
    final encryptedBase64 = base64.encode(encryptedBytes);

    final ivBase64 = base64.encode(utf8.encode(ivKey));

    return '$encryptedBase64:$ivBase64';
  }

  String encryptOrderid(String orderId, String key) {
    int cipherKeyLen = 16;
    String cipherName = "AES/CBC/PKCS5PADDING";

    if (key.length < cipherKeyLen) {
      key = key.padRight(cipherKeyLen, '0');
    } else if (key.length > cipherKeyLen) {
      key = key.substring(0, cipherKeyLen);
    }

    String ivKey = "1234567891011121";
    final iv = encrypt.IV.fromUtf8(ivKey);

    final encrypter = encrypt.Encrypter(
        encrypt.AES(encrypt.Key.fromUtf8(key), mode: encrypt.AESMode.cbc));

    final encrypted = encrypter.encrypt(orderId, iv: iv);
    final encryptedBytes = encrypted.bytes;
    final encryptedBase64 = base64.encode(encryptedBytes);

    final ivBase64 = base64.encode(utf8.encode(ivKey));

    return '$encryptedBase64:$ivBase64';
  }

  getMyOderList() async {
    try {
      List<MyOrdersModel>? result = await MyorderService().myorder();
      if (result != null) {
        myOdersList!.value = result;
      }
    } catch (e) {
      print("e");
    }
  }

  getVoucherDetails(String? userId, String? companyId, String? orderId) async {
    VoucherDetailsModel? result =
        await MyorderService().voucharDetailsView(userId, companyId, orderId);
    if (result != null) {
      voucherDetails!.value = result;
    }
  }
}
