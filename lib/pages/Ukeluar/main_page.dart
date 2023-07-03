import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application/providers/auth_provider.dart';
import 'package:flutter_application/providers/get_keluar_providers.dart';
import 'package:flutter_application/providers/uang_keluar_providers.dart';
import 'package:flutter_application/theme.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application/pages/success_page.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../home/main_page.dart';
import 'package:intl/intl.dart';

class MainKeluarPage extends StatefulWidget {
  @override
  State<MainKeluarPage> createState() => _MainKeluarPageState();
}

class _MainKeluarPageState extends State<MainKeluarPage> {
  final List<String> items = [
    'Belanja Umum',
  ];
  String kategoriBarangController;

  TextEditingController namaBarangController = TextEditingController(text: '');

  // TextEditingController kategoriBarangController =
  //     TextEditingController(text: '');

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
          top: 50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Add New Expenses Fee',
              style: GoogleFonts.bebasNeue(
                fontSize: 20,
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
        margin: EdgeInsets.only(top: 30),
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
              height: 10,
            ),
            Container(
              height: 45,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.assignment_outlined,
                      color: Colors.orange.shade900,
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
            height: 10,
          ),
          Container(
            height: 45,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.white,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                underline: SizedBox(),
                isExpanded: true,
                hint: Center(
                  child: Row(
                    children: [
                      // Icon(Icons.list, color: Colors.grey),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "Select Category",
                          style: TextStyle(fontSize: 16, fontWeight: medium),
                        ),
                      ),
                    ],
                  ),
                ),
                items: items
                    .map((kategoriBarangController) => DropdownMenuItem<String>(
                          value: kategoriBarangController,
                          child: Text(
                            kategoriBarangController,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: kategoriBarangController,
                onChanged: (value) {
                  setState(() {
                    kategoriBarangController = value as String;
                  });
                },
              ),
            ),
          ),
        ]),
      );
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
              height: 10,
            ),
            Container(
              height: 45,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.attach_money,
                      color: Colors.orange.shade900,
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
              height: 10,
            ),
            Container(
              height: 45,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.description,
                      color: Colors.orange.shade900,
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
              height: 10,
            ),
            Container(
              height: 45,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.date_range,
                      color: Colors.orange.shade900,
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
                              lastDate: DateTime(2025)
                              );
                              
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
      showDialog(
    context: context, 
    builder: (context){
      return Center(child: CircularProgressIndicator(color: Color.fromARGB(229, 255, 98, 0),));},
    );
      if (await uangKeluarProvider.uangKeluar(
        authProvider.user.token,
        kategoriBarangController,
        namaBarangController.text,
        hargaBarangController.text,
        metodePembayaranController.text,
        tanggalPembelianController.text,
      )) 
      
      { Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Expenses Fee Created',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        );
        Navigator.pushNamedAndRemoveUntil(
            context, '/succes_out_page', (route) => false);
         }else{
         Alert(
          context: context,
          title: "Expenses Fee Invalid Data!",
          desc: "Try Again!",
          image: Image.asset('assets/data.png',width: 60, height: 60),
        ).show();
      }
    }

    Widget saveButton() {
      bool isLoading = true;
      return Container(
        height: 45,
        width: double.infinity,
        margin: EdgeInsets.only(top: 40),
        child: TextButton(
          onPressed: () {
            handleSubmit();
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.orange.shade900,
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

    return SafeArea(
      child: Scaffold(
        floatingActionButton: SpeedDial(
          icon: Icons.mode_rounded,
          backgroundColor: Colors.orange.shade900,
          overlayColor: Colors.orange.shade900,
          overlayOpacity: 0.4,
          children: [
            SpeedDialChild(
              backgroundColor: Colors.orange.shade900,
              child: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: 'Home',
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            SpeedDialChild(
              backgroundColor: Colors.orange.shade900,
              child: Icon(
                Icons.add_rounded,
                color: Colors.white,
              ),
              label: 'Addmission Fee',
              onTap: () => Navigator.pushNamed(context, '/Umasuk'),
            ),
          ],
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade300,
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
              //batalButton(),
            ],
          ),
        ),
      ),
    );
  }
}

//child: TextButton(onPressed: () {
        //   setState(() {
        //     isLoading = true;
        //   });
        //   Future.delayed(Duration(seconds: 3),(){
        //     setState(() {
        //       isLoading = false;

        //     });

        //   });

        // },
        // child: isLoading? Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Text('loading...', style: TextStyle(fontSize: 20),),
        //     SizedBox(width: 10,),
        //     CircularProgressIndicator(color: Colors.orange,),

        // ],
        // ):Text('Save',style: primaryTextStyle.copyWith(
        //       fontSize: 16,
        //       color: Colors.orange,
        //       fontWeight: medium,
        //     ),)
        
        // ),
      ////  import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:matcher/matcher.dart';
// import 'package:intl/intl.dart';

// class CurrencyFormat extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
//     // TODO: implement formatEditUpdate
//    if (newValue.selection.baseOffset == 0) {
//     return newValue;
//    }
//    double d = 100286020524.17;
//    final hargaBarangController = NumberFormat.currency(locale:'ID', decimalDigits: 0, symbol: 'Rp');
//    print(hargaBarangController.format(d)); // IDR100.286.020.524,17

//    String newText = hargaBarangController.format(d);

//    return newValue.copyWith(
//     text: newText,
//     selection: TextSelection.collapsed(offset: newText.length)
//    );
//   }
  
// }