import 'package:cartify/routes/app_routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, AppRoutes.mainScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Match native splash color
      body: Center(
        child: Image.asset(
          'assets/logo.bg.png',
          height: 250, // 👈 Match native splash logo height
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}



      // Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
      //   return TestConstantsScreen();
      // }));