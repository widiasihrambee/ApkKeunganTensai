import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    GetMasukProvider getMasukProvider = Provider.of<GetMasukProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    GetKeluarProvider getKeluarProvider =
        Provider.of<GetKeluarProvider>(context);
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.white,
          ),
          title: Text(
            'Profile',
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
          ),
          backgroundColor: Color.fromARGB(229, 255, 98, 0),
        ),
        body: Column(
          children: [
            SizedBox(height: 40),
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
                              backgroundColor: Colors.grey,
                              backgroundImage: AssetImage('assets/user.png'),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'Hi, ' + authProvider.user.name,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    SafeArea(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 40.0),
                            child: ListTile(
                              title: Text(
                                'Update Profile',
                                style: GoogleFonts.poppins(),
                              ),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.orange,
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
                                'Update Pasword',
                                style: GoogleFonts.poppins(),
                              ),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.orange,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              trailing: Wrap(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.lock,
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
                                    color: Colors.orange,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              trailing: Wrap(
                                children: [],
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 40.0),
                            child: ListTile(
                              title: Text(
                                'Privacy Policy',
                                style: GoogleFonts.poppins(),
                              ),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.orange,
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
                                    color: Colors.orange,
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
                                    color: Colors.orange,
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
                                      color: Colors.yellow,
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
            )
          ],
        ));
  }
}
