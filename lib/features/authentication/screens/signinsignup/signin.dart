import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../home_menu.dart';
import '../../../../utils/color.dart';
import '../../../../utils/customwidget.dart';
import '../../../../utils/media.dart';
import '../../../../utils/string.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  // bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: b,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height / 12),
            _buildLogo(),
            SizedBox(height: height / 30),
            _buildEmailTextField(),
            SizedBox(height: height / 40),
            _buildPasswordTextField(),
            SizedBox(height: height / 40),
            SizedBox(height: height / 40),
            appButton(
              onTap: () {
                Get.offAll(() => const HomeMenu());
              },
              clr: darkblueColor,
              title: CustomStrings.signin2,
            ),
            SizedBox(height: height / 40),
            Text(
              "Or",
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontFamily: 'Gilroy Medium',
                fontSize: height / 50,
              ),
            ),
            SizedBox(height: height / 40),
            _buildSocialLogin(),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialLogin() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: height / 13,
            width: width / 6,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffF5F7F9),
            ),
            child: Padding(
              padding: EdgeInsets.all(height / 40),
              child: Image.asset("assets/google.png"),
            ),
          ),
          Container(
            height: height / 13,
            width: width / 6,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffF5F7F9),
            ),
            child: Padding(
              padding: EdgeInsets.all(height / 40),
              child: Image.asset("assets/facebook.png"),
            ),
          ),
          Container(
            height: height / 13,
            width: width / 6,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffF5F7F9),
            ),
            child: Padding(
              padding: EdgeInsets.all(height / 40),
              child: Image.asset("assets/apple.png"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: EdgeInsets.only(left: width / 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/splay.png",
            scale: 4,
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 20),
      child: Container(
        height: height / 15,
        color: Colors.transparent,
        child: TextField(
          obscureText: _obscureText,
          style: TextStyle(
            fontSize: height / 50,
            color: Colors.white,
          ),
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: EdgeInsets.all(height / 50),
              child: InkWell(
                  onTap: () {
                    _toggle();
                  },
                  child: _obscureText
                      ? Image.asset(
                          "assets/eye.png",
                          height: height / 100,
                        )
                      : const Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.grey,
                        )),
            ),
            labelText: CustomStrings.password,
            labelStyle: TextStyle(
                color: Colors.white.withOpacity(0.5), fontSize: height / 50),
            hintText: CustomStrings.password,
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: height / 55,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 20),
      child: Container(
        height: height / 15,
        color: Colors.transparent,
        child: TextField(
          style: TextStyle(
            fontSize: height / 50,
            color: Colors.white,
          ),
          decoration: InputDecoration(
            focusColor: Colors.black,
            suffixIcon: Padding(
              padding: EdgeInsets.all(height / 50),
            ),
            labelText: CustomStrings.email,
            labelStyle: TextStyle(
                color: Colors.white.withOpacity(0.5), fontSize: height / 50),
            hintText: CustomStrings.email,
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: height / 55,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.blue,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
