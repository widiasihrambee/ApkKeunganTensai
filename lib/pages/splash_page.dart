import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application/theme.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState

    Timer(
      Duration(seconds: 5),
      () => Navigator.pushNamed(context, '/sign-in'),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [        
          Image.asset(
            'assets/logo.png',
            width: 250,
            height: 250,
          ) ,
          SizedBox(
            height: 5,            
          ),
          loading()
          ],
          
        ),
      ),
    
    );
    
  }
     Widget loading() {
        return LoadingAnimationWidget.stretchedDots(
        color: Color.fromARGB(229, 255, 98, 0),
         size: 50);
       }
     
}
