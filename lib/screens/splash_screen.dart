import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:rmpl_hrm_admin/main.dart';
import 'package:rmpl_hrm_admin/screens/authentication/login_screen.dart';
import 'package:rmpl_hrm_admin/screens/main_nav.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';

import '../constants/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const SplashScreen(),
      );

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          Navigator.of(context).pushAndRemoveUntil(
            LoginScreen.route(),
            (_) => false,
          );
        } else {
          Navigator.of(context).pushAndRemoveUntil(
            MainNavScreen.route(),
            (_) => false,
          );
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 2,
          ),
          Center(
            child: Image.asset(
              'assets/images/LOGO.png',
              width: 170,
            ),
          ),
          28.heightBox,
          const Text(
            'RMPL',
            style: TextStyle(
              fontFamily: 'Inter',
              color: whiteColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 4,
              fontSize: 40,
              // height: 2
            ),
          ),
          4.heightBox,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: mq.width * 0.45),
            child: Container(
              width: double.infinity,
              height: 4,
              decoration: BoxDecoration(
                  color: lightGreyColor,
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
          16.heightBox,
          const Text(
            'Recorded Music Private Limited',
            style: TextStyle(
              fontFamily: 'Inter',
              color: whiteColor,
              fontWeight: FontWeight.w500,
              // letterSpacing: 4,
              fontSize: 20,
              // height: 2
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          const Text(
            'ADMIN PANEL',
            style: TextStyle(
              fontFamily: 'Inter',
              color: whiteColor,
              fontWeight: FontWeight.w700,
              // letterSpacing: 4,
              fontSize: 24,
              // height: 2
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          const SizedBox(
            height: 40,
            child: LoadingIndicator(
              indicatorType: Indicator.lineScale,
              colors: [whiteColor],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          const Text(
            'Powered by Quickgick',
            style: TextStyle(
              fontFamily: 'Inter',
              color: whiteColor,
              fontWeight: FontWeight.w500,
              fontSize: 14,
              // height: 2
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
