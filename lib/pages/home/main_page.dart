import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_application/providers/auth_provider.dart';
import 'package:flutter_application/providers/get_masuk_providers.dart';
import 'package:flutter_application/providers/uang_masuk_provider.dart';
import 'package:flutter_application/services/get_masuk_service.dart';
import 'package:flutter_application/theme.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
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
import '../../theme.dart';
import '../../theme.dart';
import '../detail_keluar_page.dart';
import '../detail_masuk_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final money =
      NumberFormat.currency(locale: 'ID', decimalDigits: 0, symbol: 'Rp.');
  int index_color = 0;

  @override
  Widget build(BuildContext context) {
    GetMasukProvider getMasukProvider = Provider.of<GetMasukProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    GetKeluarProvider getKeluarProvider =
        Provider.of<GetKeluarProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      floatingActionButton: SpeedDial(
        icon: Icons.mode_rounded,
        backgroundColor: Colors.orange.shade900,
        overlayColor: Colors.orange.shade900,
        overlayOpacity: 0.4,
        children: [
          SpeedDialChild(
            backgroundColor: Colors.orange.shade900,
            child: Icon(
              Icons.add_rounded,
              color: Colors.white,
            ),
            label: 'Addmission Fee',
            onTap: () {
              Navigator.pushNamed(context, '/Umasuk');
            },
          ),
          SpeedDialChild(
            backgroundColor: Colors.orange.shade900,
            child: Icon(
              Icons.add_card_outlined,
              color: Colors.white,
            ),
            label: 'Expenses Fee',
            onTap: () => Navigator.pushNamed(context, '/Ukeluar'),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade300,
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                  setState(() {
                    index_color = 0;
                  });
                },
                icon: Icon(
                  Icons.home,
                  size: 30,
                  color: index_color == 0
                      ? Colors.orange.shade900
                      : Colors.orange.shade900,
                ),
              ),
              SizedBox(width: 20),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                  setState(() {
                    index_color = 0;
                  });
                },
                icon: Icon(
                  Icons.person,
                  size: 30,
                  color: index_color == 0
                      ? Colors.orange.shade900
                      : Colors.orange.shade900,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade900,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 21, right: 21, top: 55),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage('assets/user.png'),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 5),
                              child: Text("Hi, " "" + authProvider.user.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // const SizedBox(
            //   height: 30,
            // ),
            // Center(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       TextButton(onPressed: (){
            //         Navigator.pushNamed(context, '/home');
            //        },
            //        child: Text("Addmission Fee",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
            //        style: ButtonStyle(
                    
            //         foregroundColor: MaterialStateProperty.all(Colors.black),
            //         backgroundColor: MaterialStateProperty.all(Colors.white),
            //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //           RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(5),
            //             side: BorderSide(color: Colors.grey.shade200),
            //           ),
            //         ),
            //        ),
            //        ),
            //        SizedBox(width: 5,height: 20,),
            //        TextButton(onPressed: (){
            //         Navigator.pushNamed(context, '/homekeluar');
            //        },
            //        child: Text("Expensis Fee",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
            //        style: ButtonStyle(
            //         foregroundColor: MaterialStateProperty.all(Colors.black),
            //         backgroundColor: MaterialStateProperty.all(Colors.white),
            //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //           RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(5),
            //             side: BorderSide(color: Colors.grey.shade200),
            //           ),
            //         ),
            //        ),
            //        ),
            //     ],
            //   ),
            // ),
            const SizedBox(
              height: 30,
            ),
          
            Padding(
              padding: const EdgeInsets.only(
                right: 50,
                left: 50,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text(
                          'Addmission Fee',
                          style: GoogleFonts.bebasNeue(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            //getlistUangMasuk
            FutureBuilder(
              future: getMasukProvider.getUangMasuk(authProvider.user.token),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: getMasukProvider.uangMasuk.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: ListTile(
                          title: Text(
                            getMasukProvider.uangMasuk[index].name,
                            style: TextStyle(
                                fontWeight: FontWeight.w100,
                                color: Colors.black),
                          ),
                          subtitle: Text(money.format(int.parse(
                              getMasukProvider.uangMasuk[index].price))),
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailUangMasukPage(
                                          uangMasuk: getMasukProvider
                                              .uangMasuk[index])));
                            },
                            icon: Icon(
                              Icons.download,
                              color: Colors.green,
                            ),
                          ),
                          tileColor: Colors.grey.shade200,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        margin: EdgeInsets.only(bottom: 10),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                        color: Colors.orange.shade900),
                  );
                }
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 50,
                left: 50,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text(
                          'Expenses Fee',
                          style: GoogleFonts.bebasNeue(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            //getlist UangKeluar
            FutureBuilder(
              future: getKeluarProvider.getUangKeluar(authProvider.user.token),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: getKeluarProvider.uangKeluar.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: ListTile(
                          title: Text(
                            getKeluarProvider.uangKeluar[index].namaBarang,
                            style: TextStyle(
                                fontWeight: FontWeight.w100,
                                color: Colors.black),
                          ),
                          subtitle: Text(money.format(int.parse(
                            getKeluarProvider.uangKeluar[index].harga,
                          ))),
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailUangKeluarPage(
                                              uangKeluar: getKeluarProvider
                                                  .uangKeluar[index])));
                            },
                            icon: Icon(
                              Icons.upload,
                              color: Colors.red,
                            ),
                          ),
                          tileColor: Colors.grey.shade200,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        margin: EdgeInsets.only(bottom: 10),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                        color: Colors.orange.shade900),
                  );
                }
              },
            ),
          ],
        )
      ),
    );
  }
}
