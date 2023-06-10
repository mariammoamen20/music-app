import 'package:app/modules/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../shared/components.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToLayout();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'assets/images/splash.jpg',
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
  navigateToLayout()async{
    await Future.delayed(const Duration(milliseconds: 3000,),(){});
    navigateToAndFinish(context,  HomeScreen());
  }
}
