import 'package:flutter/material.dart';
import 'package:flutter_application/models/admission_fee_model.dart';
import 'package:flutter_application/services/uang_masuk_service.dart';

class UangMasukProvider with ChangeNotifier {
  Future<bool> uangMasuk(
    String token,
    String name,
    String description,
    String price,
    String date,
  ) async {
    try {
      if (await UangMasukService().uangMasuk(
        token,
        name,
        description,
        price,
        date,
      )) {
        return true;
      }
    } catch (e) {
      return false;
    }
  }
}
