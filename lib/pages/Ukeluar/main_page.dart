import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application/providers/auth_provider.dart';
import 'package:flutter_application/providers/uang_keluar_providers.dart';
import 'package:flutter_application/theme.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application/pages/success_page.dart';

import '../home/main_page.dart';

class MainKeluarPage extends StatefulWidget {
  @override
  State<MainKeluarPage> createState() => _MainKeluarPageState();
}

class _MainKeluarPageState extends State<MainKeluarPage> {
  TextEditingController namaBarangController = TextEditingController(text: '');

  TextEditingController kategoriBarangController =
      TextEditingController(text: '');

  TextEditingController hargaBarangController = TextEditingController(text: '');

  TextEditingController metodePembayaranController =
      TextEditingController(text: '');

  TextEditingController tanggalPembelianController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    UangKeluarProvider uangKeluarProvider =
        Provider.of<UangKeluarProvider>(context);

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Add New Expenses Fee',
              style: TextStyle(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Text(
              'Add New Expenses Fee to Continue',
              style: subtitleTextStyle,
            ),
          ],
        ),
      );
    }

    Widget namaBarangInput() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Product Name',
              style: TextStyle(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Color.fromARGB(229, 255, 98, 0),
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.assignment_outlined,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: namaBarangController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Enter Product Name',
                          hintStyle: subtitleTextStyle,
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget kategoriBarangInput() {
      //List listName;["Belanja Umum"];
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Category Id',
            style: TextStyle(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 40,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Color.fromARGB(229, 255, 98, 0),
              ),
            ),

            // child: DropdownButtonFormField<String>(
            //     decoration: InputDecoration(

            //       hintText: 'Enter Category Id',
            //       border: UnderlineInputBorder(
            //         borderRadius: BorderRadius.circular(10),

            //       ),

            //     ),
            //     items: [
            //       DropdownMenuItem(
            //         child: Text('BelanjaUmum'),
            //         value: 'one',
            //       ),
            //     ],

            //     isExpanded: true,
            //     iconSize: 15,
            //     onChanged: (String value) {
            //       value = 'one';
            //       setState(() {

            //         // Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()));
            //       });

            child: Row(
              children: [
                Icon(
                  Icons.assignment_outlined,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    controller: kategoriBarangController,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Enter Category Id',
                      hintStyle: subtitleTextStyle,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      );

      //             )

      //       ],
      //     ],
      //   ),
      // );
    }

    Widget hargaBarangInput() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price',
              style: TextStyle(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Color.fromARGB(229, 255, 98, 0),
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.attach_money,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: hargaBarangController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Enter Expenses Fee',
                          hintStyle: subtitleTextStyle,
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget metodePembayaranInput() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment',
              style: TextStyle(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Color.fromARGB(229, 255, 98, 0),
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.description,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: metodePembayaranController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Enter Payment',
                          hintStyle: subtitleTextStyle,
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget tanggalPembelianInput() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date',
              style: TextStyle(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Color.fromARGB(229, 255, 98, 0),
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.date_range,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: tanggalPembelianController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Enter Date',
                          hintStyle: subtitleTextStyle,
                          border: InputBorder.none,
                        ),
                        onTap: () async {
                          DateTime pickdate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2025));
                          if (pickdate != null) {
                            setState(() {
                              tanggalPembelianController.text =
                                  DateFormat('yyyy-MM-dd').format(pickdate);
                            });
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    handleSubmit() async {
      if (await uangKeluarProvider.uangKeluar(
        authProvider.user.token,
        kategoriBarangController.text,
        namaBarangController.text,
        hargaBarangController.text,
        metodePembayaranController.text,
        tanggalPembelianController.text,
      )) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Expenses Fee Created',
              textAlign: TextAlign.center,
            ),
          ),
        );
        Navigator.pushNamedAndRemoveUntil(
            context, '/succes_out_page', (route) => false);
      }
    }

    Widget saveButton() {
      return Container(
        height: 40,
        width: double.infinity,
        margin: EdgeInsets.only(top: 20),
        child: TextButton(
          onPressed: () {
            handleSubmit();
          },
          style: TextButton.styleFrom(
            backgroundColor: Color.fromARGB(229, 255, 98, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Save',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget batalButton() {
      return Container(
        height: 40,
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 20,
        ),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Back',
            style: primaryTextStyle.copyWith(
              color: Color.fromARGB(229, 255, 98, 0),
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Column(
            children: [
              header(),
              namaBarangInput(),
              kategoriBarangInput(),
              hargaBarangInput(),
              metodePembayaranInput(),
              tanggalPembelianInput(),
              saveButton(),
              batalButton(),
            ],
          ),
        ),
      ),
    );
  }
}
