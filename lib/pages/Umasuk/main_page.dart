import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application/providers/auth_provider.dart';
import 'package:flutter_application/providers/uang_masuk_provider.dart';
import 'package:flutter_application/theme.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class MainMasukPage extends StatefulWidget {
  @override
  State<MainMasukPage> createState() => _MainMasukPageState();
}

class _MainMasukPageState extends State<MainMasukPage> {
  TextEditingController nameController = TextEditingController(text: '');

  TextEditingController descriptionController = TextEditingController(text: '');

  TextEditingController priceController = TextEditingController(text: '');

  TextEditingController dateController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    UangMasukProvider uangMasukProvider =
        Provider.of<UangMasukProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSubmit() async {
      showDialog(
    context: context, 
    builder: (context){
      return Center(child: CircularProgressIndicator(color: Color.fromARGB(229, 255, 98, 0),));},
    );
      if (await uangMasukProvider.uangMasuk(
        authProvider.user.token,
        nameController.text,
        descriptionController.text,
        priceController.text,
        dateController.text,
      ))
           
       { Navigator.of(context).pop(); 
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Admission Fee Created',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        );
        Navigator.pushNamedAndRemoveUntil(
            context, '/success', (route) => false);
              }else{
         Alert(
          context: context,
          title: "Admission Fee Invalid Data!",
          desc: "Try Again!",
          image: Image.asset('assets/data.png',width: 60, height: 60),
        ).show();
      }
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Add New Admission Fee',
              style: GoogleFonts.bebasNeue(
                fontSize: 20,
                
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Add New Admission Fee to Continue',
              style: subtitleTextStyle,
            ),
          ],
        ),
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Admission Fee',
              style: TextStyle(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 8,
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
                  color:Colors.white,
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
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Enter Admission Fee',
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

    Widget priceInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
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
              height: 45,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color:Colors.white,
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.attach_money,
                      color: Colors.orange.shade900,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(                        
                        controller: priceController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Enter Price',
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

    Widget descriptionInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: TextStyle(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 8,
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
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: descriptionController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Enter Description',
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

    // make choose date picker
    Widget dateInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
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
              height: 45,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.white
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.date_range,
                      color: Colors.orange.shade900
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: dateController,
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
                              dateController.text =
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

    Widget saveButton() {
      return Container(
        height: 45,
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 50,
        ),
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
          overlayColor:  Colors.orange.shade900,
          overlayOpacity: 0.4,
          children: [
            SpeedDialChild(
              backgroundColor:  Colors.orange.shade900,
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
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade300,
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Column(
            children: [
              header(),
              nameInput(),
              priceInput(),
              descriptionInput(),
              dateInput(),
              saveButton(),
              // batalButton(),
            ],
          ),
        ),
      ),
    );
  }
}
