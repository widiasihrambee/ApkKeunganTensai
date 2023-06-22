import 'package:flutter/material.dart';
import 'package:flutter_application/models/get_masuk_model.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../providers/get_masuk_providers.dart';
import 'home/main_page.dart';

class DetailUangMasukPage extends StatefulWidget {
  final uangMasuk;

  DetailUangMasukPage({@required this.uangMasuk});

  @override
  State<DetailUangMasukPage> createState() => _DetailUangMasukPageState();
}

class _DetailUangMasukPageState extends State<DetailUangMasukPage> {
final money = NumberFormat.currency(locale:'ID', decimalDigits: 0, symbol: 'Rp.');
  int index_color = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      floatingActionButton: SpeedDial(
        icon: Icons.mode_rounded,
        backgroundColor:  Colors.orange.shade900,
        overlayColor:  Colors.orange.shade900,
        overlayOpacity: 0.4,
        children: [
          SpeedDialChild(
            backgroundColor:  Colors.orange.shade900,
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
            backgroundColor:  Colors.orange.shade900,
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
                      ?  Colors.orange.shade900
                      :  Colors.orange.shade900,
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
                      ?  Colors.orange.shade900
                      :  Colors.orange.shade900,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: 250,
                  width: 250,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                border:Border.all(color: Colors.white),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30, left: 30),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: ListTile(
                      title: Text(
                        widget.uangMasuk.name,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                     subtitle: Text(money.format(int.parse(widget.uangMasuk.price))),
                      trailing: Column(
                        children: [
                          Text(widget.uangMasuk.date),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text(
                      widget.uangMasuk.description,
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                  // SizedBox(height: 80.0),
                  // Container(
                  //   padding:
                  //       EdgeInsets.symmetric(vertical: 10.0, horizontal: 80.0),
                  //   child: TextButton(
                  //     onPressed: () {},
                  //     child: Text(
                  //       'Edit',
                  //     ),
                  //   ),
                  //   decoration: BoxDecoration(
                  //       color: Color.fromARGB(229, 255, 98, 0),
                  //       borderRadius: BorderRadius.circular(10.0)),
                  // ),
                  // SizedBox(height: 50.0),
                  // Container(
                  //   padding:
                  //       EdgeInsets.symmetric(vertical: 10.0, horizontal: 80.0),
                  //   child: TextButton(
                  //     onPressed: () { Navigator.pushNamed(context, '/home');},
                  //     child: Text(
                  //       'Kembali',
                  //       style: TextStyle(
                  //           fontWeight: FontWeight.bold, color: Colors.black),
                  //     ),
                  //   ),
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(10.0),
                  //     border: Border.all(
                  //       color: Color.fromARGB(229, 255, 98, 0),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
