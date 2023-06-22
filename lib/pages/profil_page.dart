import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../providers/get_keluar_providers.dart';
import '../providers/get_masuk_providers.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
          children: [
            SizedBox(height: 30),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(children: [
                    Row(
                      children: [
                        Column(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,                              
                              backgroundImage: AssetImage('assets/user.png'),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'Hi, ' + authProvider.user.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Container(
                      width: double.infinity,
                      height: 500,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(50),
                          )),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 40.0),
                            child: ListTile(
                              title: Text(
                                authProvider.user.name,
                                style: GoogleFonts.poppins(),
                              ),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.orange.shade900,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              trailing: Wrap(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.person,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 40.0),
                            child: ListTile(
                              title: Text(
                                'About',
                                style: GoogleFonts.poppins(),
                              ),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.orange.shade900,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              trailing: Wrap(
                                children: [],
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 40.0),
                            child: ListTile(
                              title: Text(
                                'Privacy Policy',
                                style: GoogleFonts.poppins(),
                              ),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.orange.shade900,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              trailing: Wrap(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.info_sharp,
                                      size: 20,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 40.0),
                            child: ListTile(
                              title: Text(
                                'Terms Conditions',
                                style: GoogleFonts.poppins(),
                              ),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.orange.shade900,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              trailing: Wrap(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.document_scanner_outlined,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 40.0),
                            child: ListTile(
                              title: Text(
                                'Rating Apps',
                                style: GoogleFonts.poppins(),
                              ),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.orange.shade900,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              trailing: Wrap(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.star,
                                      size: 20,
                                      color: Colors.grey.shade800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
