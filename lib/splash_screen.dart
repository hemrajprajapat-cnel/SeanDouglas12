import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var status = prefs.getBool('isLoggedIn');
      if (status == true) {
        Navigator.pushNamed(context, 'home');
      } else {
        Navigator.pushNamed(context, 'login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF063278),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: 300.0,
                  width: 300.0,
                ),
              ],
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF27bed4)),
            ),
          ],
        ),
      ),
    );
  }
}
