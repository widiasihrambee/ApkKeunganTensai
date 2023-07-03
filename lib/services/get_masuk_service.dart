import 'dart:convert';
import 'dart:io';
import 'dart:developer' as developer;
import 'package:flutter_application/models/admission_fee_model.dart';
import 'package:http/http.dart' as http;

import '../models/get_masuk_model.dart';

class MasukService {
  String baseUrl = 'https://keuangan-tensai.wikukarno.id/api';

  Future<List<MasukModel>> getUangMasuk(String token) async {
    var url = '$baseUrl/uang-masuk';
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
      List<MasukModel> uangMasuk = [];
    

      for (var item in data) {
        uangMasuk.add(MasukModel.fromJson(item));
        
      }

      return uangMasuk;

    } else {
      throw Exception('Gagal Mengambil Data Uang Masuk!');
    }
  }
}


























// class GetMasukService {
//   String baseUrl = 'https://chatbot.articerdas.id/api/uang-masuk';

//   Future getMasuk() async{
//     try {
//       final response = await http.get(Uri.parse(baseUrl));

//       if (response.statusCode == 200) {
//         Iterable it = jsonDecode(response.body);
//         List<AdmissionFeeModel> admissionFeeModel =  it.map((e) => AdmissionFeeModel.fromJson(e)).toList();
//         return jsonDecode(response.body);
//       }
//     } catch (e) {
//       print(e.toString());
      
//     }
//   }
// }