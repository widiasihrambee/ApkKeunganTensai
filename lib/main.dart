import 'package:flutter/material.dart';

import 'package:flutter_application/pages/Ukeluar/main_page.dart';
import 'package:flutter_application/pages/Umasuk/main_page.dart';

import 'package:flutter_application/pages/detail_keluar_page.dart';
import 'package:flutter_application/pages/detail_masuk_page.dart';
import 'package:flutter_application/pages/home/main_page.dart';
import 'package:flutter_application/pages/profil_page.dart';
import 'package:flutter_application/pages/auth/sign_in_page.dart';
import 'package:flutter_application/pages/auth/sign_up_page.dart';
import 'package:flutter_application/pages/splash_page.dart';
import 'package:flutter_application/pages/success_page.dart';
import 'package:flutter_application/providers/auth_provider.dart';
import 'package:flutter_application/providers/get_keluar_providers.dart';
import 'package:flutter_application/providers/get_masuk_providers.dart';
import 'package:flutter_application/providers/uang_keluar_providers.dart';
import 'package:flutter_application/providers/uang_masuk_provider.dart';
import 'package:provider/provider.dart';

import 'pages/succes_out_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => UangMasukProvider()),
        ChangeNotifierProvider(create: (context) => UangKeluarProvider()),
        ChangeNotifierProvider(create: (context) => GetMasukProvider()),
        ChangeNotifierProvider(create: (context) => GetKeluarProvider()),

       
        

       
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => HomePage(),
          '/Umasuk': (context) => MainMasukPage(),
          '/Ukeluar': (context) => MainKeluarPage(),
          '/success': (context) => SuccessPage(),
          '/succes_out_page': (context) => SuccessOutPage(),
          '/detailmasukpage': (context) => DetailUangMasukPage(),
          '/detailkeluarpage': (context) => DetailUangKeluarPage(),
          '/profile':(context) => Profile(),
          //  '/coba':(context) => Login(),
          
        
        },
      ),
    );
  }
}
