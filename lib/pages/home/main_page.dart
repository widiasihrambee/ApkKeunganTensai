import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_application/providers/auth_provider.dart';
import 'package:flutter_application/providers/get_masuk_providers.dart';
import 'package:flutter_application/providers/uang_masuk_provider.dart';
import 'package:flutter_application/services/get_masuk_service.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../models/admission_fee_model.dart';
import '../../models/get_masuk_model.dart';
import '../../models/user_model.dart';
import '../../providers/get_keluar_providers.dart';
import '../../services/auth_service.dart';
import '../../services/auth_service.dart';
import '../detail_keluar_page.dart';
import '../detail_masuk_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    GetMasukProvider getMasukProvider = Provider.of<GetMasukProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    GetKeluarProvider getKeluarProvider =
        Provider.of<GetKeluarProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Finance Tensai',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(229, 255, 98, 0),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 21, right: 21),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage('assets/user.png'),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Text("Hi, " "" + authProvider.user.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14)),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        icon: Icon(Icons.person, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/Umasuk');
                    },
                    child: Column(
                      children: [
                        Text('Add Admission Fee '),
                        Icon(Icons.add, size: 10, color: Colors.white),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/Ukeluar');
                    },
                    child: Column(
                      children: [
                        Text('Add Expenses Fee'),
                        Icon(Icons.add, size: 10, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 400, left: 30),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: const Text(
                            'Addmission Fee',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        )
                      ],
                    )
                  ]),
            ),

            //getlistgetuangmasuk
            const SizedBox(height: 10),
            FutureBuilder(
              future: getMasukProvider.getUangMasuk(authProvider.user.token),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: getMasukProvider.uangMasuk.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 4,
                          child: ListTile(
                            title: Text(getMasukProvider.uangMasuk[index].name),
                            subtitle: Text("Rp." +
                                getMasukProvider.uangMasuk[index].price),
                            trailing: Column(
                              children: [
                                Text(getMasukProvider.uangMasuk[index].date)
                              ],
                            ),
                            leading: Container(
                              child: GestureDetector(
                                child:
                                    Icon(Icons.download, color: Colors.green),
                                onTap: () async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailUangMasukPage(
                                                  uangMasuk: getMasukProvider
                                                      .uangMasuk[index])));
                                },
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              }),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 400, left: 30),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: const Text(
                            'Expenses Fee',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ]),
            ),
            //getlistgetuangkeluar
            const SizedBox(height: 10),
            FutureBuilder(
              future: getKeluarProvider.getUangKeluar(authProvider.user.token),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: getKeluarProvider.uangKeluar.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 4,
                          child: ListTile(
                            title: Text(
                                getKeluarProvider.uangKeluar[index].namaBarang),
                            subtitle: Text("Rp." +
                                getKeluarProvider.uangKeluar[index].harga),
                            trailing: Column(
                              children: [
                                Text(
                                    getKeluarProvider.uangKeluar[index].tanggal)
                              ],
                            ),
                            leading: Container(
                              child: GestureDetector(
                                child: Icon(Icons.upload, color: Colors.red),
                                onTap: () async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailUangKeluarPage(
                                                  uangKeluar: getKeluarProvider
                                                      .uangKeluar[index])));
                                },
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
