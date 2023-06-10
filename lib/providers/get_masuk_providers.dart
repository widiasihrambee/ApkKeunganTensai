import 'package:flutter/material.dart';
import 'package:flutter_application/models/admission_fee_model.dart';
import 'package:flutter_application/services/uang_masuk_service.dart';

import '../models/get_masuk_model.dart';
import '../services/get_masuk_service.dart';

class GetMasukProvider with ChangeNotifier {
List<MasukModel>_uangMasuk = [];
List<MasukModel> get uangMasuk =>_uangMasuk;

set uangMasuk(List<MasukModel> newUangMasuk) {
  _uangMasuk = newUangMasuk;
  notifyListeners();
}
Future <bool>getUangMasuk(String token) async {
  try {
    List<MasukModel> uangMasuk =
    await MasukService().getUangMasuk(token);
    _uangMasuk = uangMasuk;
   
    return  true;   
  } catch (e) {
    print(e);
    return false;
  } 
}
}

