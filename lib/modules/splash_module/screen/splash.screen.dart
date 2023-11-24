import 'package:flutter/material.dart';
import 'package:student_app/global/styles/colors.styles.dart';
import 'package:student_app/modules/home_module/screen/home.screen.dart';

import '../../../global/functions/fadePageRoute.function.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
   
        onLoadSplashScreen();
  
  }

  void onLoadSplashScreen() async {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.of(context)
          .pushReplacement(CustomFadePageRoute(route: const HomeScreen()));
      },
    );
    

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFEAFFC6),
      body: Container(
        decoration:const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/splash.png'),fit: BoxFit.cover),
          color: kWhite),
        
        ),
    
    );
  }
}