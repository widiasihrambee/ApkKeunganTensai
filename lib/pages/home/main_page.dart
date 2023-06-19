import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_application/providers/auth_provider.dart';
import 'package:flutter_application/providers/get_masuk_providers.dart';
import 'package:flutter_application/providers/uang_masuk_provider.dart';
import 'package:flutter_application/services/get_masuk_service.dart';
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
import '../detail_keluar_page.dart';
import '../detail_masuk_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 final currencyFormattter = NumberFormat.currency(locale:'ID', decimalDigits: 0, symbol: 'Rp');
 
  @override
  Widget build(BuildContext context) {
    GetMasukProvider getMasukProvider = Provider.of<GetMasukProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    GetKeluarProvider getKeluarProvider =
        Provider.of<GetKeluarProvider>(context);

    return Scaffold(
      floatingActionButton: SpeedDial(
        icon: Icons.mode_rounded,
        backgroundColor: Color.fromARGB(229, 255, 98, 0),
        overlayColor: Color.fromARGB(229, 255, 98, 0),
        overlayOpacity: 0.4,
        children: [
          SpeedDialChild(
            backgroundColor: Color.fromARGB(229, 255, 98, 0),
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
            backgroundColor: Color.fromARGB(229, 255, 98, 0),
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
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(top: 6.5, bottom: 6.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                  setState(() {
                    
                  });
                },
                icon: Icon(
                  Icons.home,
                  size: 30,
               
                     
                ),
              ),
              SizedBox(width: 20),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                  setState(() {
                    
                  });
                },
                icon: Icon(
                  Icons.person,
                  size: 30,
                  
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
                    color: Color.fromARGB(229, 255, 98, 0),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 21, right: 21, top: 25),
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
                                      fontSize: 14)),
                            ),
                            // Spacer(),
                            // IconButton(
                            //   onPressed: () {
                            //     Navigator.pushNamed(context, '/profile');
                            //   },
                            //   icon: Icon(Icons.person, color: Colors.white),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
                        child: const Text(
                          'Addmission Fee',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
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
                          title: Text(getMasukProvider.uangMasuk[index].name),
                          subtitle: Text( 
                              // currencyFormattter.format(int.parse(
                              getMasukProvider.uangMasuk[index].price),
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
                          tileColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Color.fromARGB(229, 255, 98, 0),
                                  width: 1),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        margin: EdgeInsets.only(bottom: 10),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(color: Colors.orange.shade500),
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
                        child: const Text(
                          'Expenses Fee',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
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
                              getKeluarProvider.uangKeluar[index].namaBarang),
                          subtitle: Text(
                            
                            //  currencyFormattter.format(int.parse(
                              getKeluarProvider.uangKeluar[index].harga,),  
                          
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
                          tileColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Color.fromARGB(229, 255, 98, 0),
                                  width: 1),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        margin: EdgeInsets.only(bottom: 10),
                      );
                    },
                  );
                } else {
                  return Center(
                    child:
                        CircularProgressIndicator(color: Colors.orange.shade500),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );

    // SizedBox(
    //   height: 20,
    // ),
    // Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: <Widget>[
    //     Container(
    //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    //       decoration: BoxDecoration(
    //         color: Colors.green,
    //         borderRadius: BorderRadius.circular(5),
    //       ),
    //       child: TextButton(
    //         style: ButtonStyle(
    //             foregroundColor:
    //                 MaterialStateProperty.all<Color>(Colors.white)),
    //         onPressed: () {
    //           Navigator.pushNamed(context, '/Umasuk');
    //         },
    //         child: Column(
    //           children: [
    //             Text('Add Admission Fee '),
    //             Icon(Icons.add, size: 10, color: Colors.white),
    //           ],
    //         ),
    //       ),
    //     ),
    //     SizedBox(width: 10),
    //     Container(
    //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    //       decoration: BoxDecoration(
    //         color: Colors.redAccent,
    //         borderRadius: BorderRadius.circular(5),
    //       ),
    //       child: TextButton(
    //         style: ButtonStyle(
    //             foregroundColor:
    //                 MaterialStateProperty.all<Color>(Colors.white)),
    //         onPressed: () {
    //           Navigator.pushNamed(context, '/Ukeluar');
    //         },
    //         child: Column(
    //           children: [
    //             Text('Add Expenses Fee'),
    //             Icon(Icons.add, size: 10, color: Colors.white),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ],
    // ),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.only(right: 400, left: 30),
    //           child: Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Row(
    //                   children: [
    //                     Container(
    //                       child: const Text(
    //                         'Addmission Fee',
    //                         style: TextStyle(
    //                             fontSize: 17,
    //                             fontWeight: FontWeight.bold,
    //                             color: Colors.black),
    //                       ),
    //                     )
    //                   ],
    //                 )
    //               ]),
    //         ),

    //         //getlistgetuangmasuk
    //         const SizedBox(height: 10),
    //         FutureBuilder(
    //           future: getMasukProvider.getUangMasuk(authProvider.user.token),
    //           builder: ((context, snapshot) {
    //             if (snapshot.hasData) {
    //               return ListView.builder(
    //                   scrollDirection: Axis.vertical,
    //                   shrinkWrap: true,
    //                   itemCount: getMasukProvider.uangMasuk.length,
    //                   itemBuilder: (context, index) {
    //                     return Card(
    //                       elevation: 4,
    //                       child: ListTile(
    //                         title: Text(getMasukProvider.uangMasuk[index].name),
    //                         subtitle: Text("Rp." +
    //                             getMasukProvider.uangMasuk[index].price),
    //                         trailing: Column(
    //                           children: [
    //                             Text(getMasukProvider.uangMasuk[index].date)
    //                           ],
    //                         ),
    //                         leading: Container(
    //                           child: GestureDetector(
    //                             child:
    //                                 Icon(Icons.download, color: Colors.green),
    //                             onTap: () async {
    //                               Navigator.push(
    //                                   context,
    //                                   MaterialPageRoute(
    //                                       builder: (context) =>
    //                                           DetailUangMasukPage(
    //                                               uangMasuk: getMasukProvider
    //                                                   .uangMasuk[index])));
    //                             },
    //                           ),
    //                           decoration: BoxDecoration(
    //                             color: Colors.white,
    //                             borderRadius: BorderRadius.circular(10),
    //                           ),
    //                         ),
    //                       ),
    //                     );
    //                   });
    //             } else if (snapshot.hasError) {
    //               return Text('${snapshot.error}');
    //             }
    //             return const CircularProgressIndicator();
    //           }),
    //         ),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.only(right: 400, left: 30),
    //           child: Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Row(
    //                   children: [
    //                     Container(
    //                       child: const Text(
    //                         'Expenses Fee',
    //                         style: TextStyle(
    //                             fontSize: 17,
    //                             fontWeight: FontWeight.bold,
    //                             color: Colors.black),
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ]),
    //         ),
    //         //getlistgetuangkeluar
    //         const SizedBox(height: 10),
    //         FutureBuilder(
    //           future: getKeluarProvider.getUangKeluar(authProvider.user.token),
    //           builder: ((context, snapshot) {
    //             if (snapshot.hasData) {
    //               return ListView.builder(
    //                   scrollDirection: Axis.vertical,
    //                   shrinkWrap: true,
    //                   itemCount: getKeluarProvider.uangKeluar.length,
    //                   itemBuilder: (context, index) {
    //                     return Card(
    //                       elevation: 4,
    //                       child: ListTile(
    //                         title: Text(
    //                             getKeluarProvider.uangKeluar[index].namaBarang),
    //                         subtitle: Text("Rp." +
    //                             getKeluarProvider.uangKeluar[index].harga),
    //                         trailing: Column(
    //                           children: [
    //                             Text(
    //                                 getKeluarProvider.uangKeluar[index].tanggal)
    //                           ],
    //                         ),
    //                         leading: Container(
    //                           child: GestureDetector(
    //                             child: Icon(Icons.upload, color: Colors.red),
    //                             onTap: () async {
    //                               Navigator.push(
    //                                   context,
    //                                   MaterialPageRoute(
    //                                       builder: (context) =>
    //                                           DetailUangKeluarPage(
    //                                               uangKeluar: getKeluarProvider
    //                                                   .uangKeluar[index])));
    //                             },
    //                           ),
    //                           decoration: BoxDecoration(
    //                             color: Colors.white,
    //                             borderRadius: BorderRadius.circular(10),
    //                           ),
    //                         ),
    //                       ),
    //                     );
    //                   });
    //             } else if (snapshot.hasError) {
    //               return Text('${snapshot.error}');
    //             }
    //             return const CircularProgressIndicator();
    //           }),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
