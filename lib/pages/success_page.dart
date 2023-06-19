import 'package:flutter/material.dart';
import 'package:flutter_application/theme.dart';

import 'package:lottie/lottie.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Checkout Success',
        ),
        elevation: 0,
      );
    }

    Widget content() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   'assets/success.png',
            //   width: 300,
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            SizedBox(
              width: 200,
              height: 200,
              child: LottieBuilder.asset('assets/ceklis.json'),
            ),
            Text(
              'Admission Fee Created',
              style: TextStyle(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Your Admission Fee was successfully created',
              style: secondaryTextStyle,
              textAlign: TextAlign.center,
            ),
            Container(
              width: 196,
              height: 44,
              margin: EdgeInsets.only(
                top: defaultMargin,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(229, 255, 98, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Back to Home',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: header(),
      body: content(),
    );
  }
}
