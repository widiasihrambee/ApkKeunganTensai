import 'package:flutter/material.dart';
import 'package:flutter_application/pages/home/main_page.dart';
import 'package:flutter_application/pages/sign_in_page.dart';
import 'package:flutter_application/pages/sign_up_page.dart';
import 'package:flutter_application/pages/splash_page.dart';
import 'package:flutter_application/pages/success_page.dart';
import 'package:flutter_application/providers/auth_provider.dart';
import 'package:flutter_application/providers/uang_masuk_provider.dart';
import 'package:provider/provider.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/success': (context) => SuccessPage(),
        },
      ),
    );
  }
}
