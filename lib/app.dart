import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zenbank/screens/Auth/login.dart';
import 'package:zenbank/screens/Auth/signup.dart';
import 'package:zenbank/screens/Home/home_screen.dart';
import 'package:zenbank/screens/Loan/request_loan.dart';
import 'package:zenbank/screens/Splash/splash_screen.dart';
import 'package:zenbank/utils/color_constants.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: kAccentColor,
        backgroundColor: kBackgroundColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/loan': (context) => RequestLoanScreen(),
      },
    );
  }
}
