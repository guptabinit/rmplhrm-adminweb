import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/components/custom_button.dart';
import 'package:rmpl_hrm_admin/components/custom_textfield.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/constants/dimensions.dart';
import 'package:rmpl_hrm_admin/main.dart';
import 'package:rmpl_hrm_admin/root/root.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';
import 'package:rmpl_hrm_admin/utils/utils.dart';

import '../../resources/auth_methods.dart';

@Deprecated('Use LoginPage instead of LoginScreen')
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      );

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  void loginAdmin() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethods().loginAdmin(
      email: emailController.text,
      password: passController.text,
    );

    setState(() {
      _isLoading = false;
    });
    if (res == 'success') {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          // MainNavScreen.route(),
          RootPage.route(),
        );
      }
    } else {
      showCustomToast(
        message: res,
        bgColor: redColor,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/images/LOGO.png',
                width: 170,
              ),
            ),
          ),
          Container(
            // height: mq.height * 0.6,
            width: double.infinity,
            padding: mq.width > webScreenSize
                ? EdgeInsets.symmetric(horizontal: mq.width * 0.3, vertical: 20)
                : const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: const BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28), topRight: Radius.circular(28)),
              // borderRadius: BorderRadius.all(Radius.circular(28)
              // )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                12.heightBox,
                const Center(
                  child: Text(
                    'ADMIN LOGIN',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: darkColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                20.heightBox,
                const Text(
                  'Enter admin email address',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      color: darkColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                8.heightBox,
                CustomTextFormField(
                  text: 'admin@rmpl.com',
                  controller: emailController,
                  inputType: TextInputType.emailAddress,
                ),
                20.heightBox,
                const Text(
                  'Enter your password',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      color: darkColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                8.heightBox,
                CustomTextFormField(
                  text: '************',
                  controller: passController,
                  isPassword: true,
                ),
                20.heightBox,
                CustomButton(
                  onPress: () => loginAdmin(),
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          color: whiteColor,
                        )
                      : const Text(
                          "Login",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                ),
                8.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Need some help?',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Contact Developers',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
