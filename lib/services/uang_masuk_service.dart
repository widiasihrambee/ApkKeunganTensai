import 'dart:convert';
import 'dart:io';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_application/models/admission_fee_model.dart';
import 'package:flutter_application/providers/auth_provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UangMasukService {
  String baseUrl = 'https://keuangan-tensai.wikukarno.id/api';
  //https://api-keuangan.wikukarno.id';

  Future uangMasuk(String token, name, description, price, date) async {
    var url = '$baseUrl/uang-masuk/store';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var body = jsonEncode({
      'nama_masuk': name,
      'deskripsi': description,
      'harga_masuk': price,
      'tanggal_masuk': date,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal Membuat Uang Masuk!');
    }
  }
}
