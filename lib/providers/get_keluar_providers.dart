import 'package:flutter/material.dart';
import 'package:flutter_application/models/admission_fee_model.dart';
import 'package:flutter_application/services/uang_masuk_service.dart';

import '../models/get_keluar_model.dart';
import '../models/get_masuk_model.dart';
import '../services/get_keluar_service.dart';
import '../services/get_masuk_service.dart';

class GetKeluarProvider with ChangeNotifier {
List<KeluarModel>_uangKeluar = [];
List<KeluarModel> get uangKeluar =>_uangKeluar;

set uangKeluar(List<KeluarModel> newUangKeluar) {
  _uangKeluar = newUangKeluar;
  notifyListeners();
}
Future <bool>getUangKeluar(String token) async {
  try {
    List<KeluarModel> uangKeluar =
    await UangKeluarService().getUangKeluar(token);
    _uangKeluar = uangKeluar;
   
    return  true;   
  } catch (e) {
    print(e);
    return false;
  } 
}
}

