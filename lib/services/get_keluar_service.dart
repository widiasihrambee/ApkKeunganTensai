import 'dart:convert';
import 'dart:io';
import 'dart:developer' as developer;
import 'package:flutter_application/models/admission_fee_model.dart';
import 'package:http/http.dart' as http;

import '../models/get_keluar_model.dart';
import '../models/get_masuk_model.dart';

class UangKeluarService {
  String baseUrl = 'https://api-keuangan.wikukarno.id/api';

  Future<List<KeluarModel>> getUangKeluar(String token) async {
    var url = '$baseUrl/uang-keluar';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) { 
      //List uangMasuk = json.decode(response.body);

      final json =  response.body;     
      List data = jsonDecode(response.body)['data'];
      List<KeluarModel> uangKeluar = [];
    

      for (var item in data) {
        uangKeluar.add(KeluarModel.fromJson(item));
        
      }

      return uangKeluar;

    } else {
      throw Exception('Gagal Mengambil Data Uang Keluar!');
    }
  }
}
