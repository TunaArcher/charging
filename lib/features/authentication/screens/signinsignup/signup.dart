import 'package:flutter/material.dart';

import '../../../../utils/color.dart';
import '../../../../utils/customwidget.dart';
import '../../../../utils/media.dart';
import '../../../../utils/string.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: b,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height / 12),
            Padding(
              padding: EdgeInsets.only(left: width / 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        CustomStrings.hello,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: height / 25,
                          fontFamily: 'Gilroy Medium',
                        ),
                      ),
                      SizedBox(width: width / 80),
                      Text(
                        CustomStrings.there,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: height / 25,
                          fontFamily: 'Gilroy Bold',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height / 80),
                  Text(
                    CustomStrings.information,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: height / 60,
                      fontFamily: 'Gilroy Medium',
                    ),
                  ),
                  SizedBox(height: height / 200),
                  Text(
                    CustomStrings.trips,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: height / 60,
                      fontFamily: 'Gilroy Medium',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height / 30),
            textField(
              hinttext: CustomStrings.fullname,
              labeltxt: CustomStrings.fullname,
            ),
            SizedBox(height: height / 40),
            textField(
              hinttext: CustomStrings.email,
              labeltxt: CustomStrings.email,
            ),
            SizedBox(height: height / 40),
            _buildPasswordTextField(),
            SizedBox(height: height / 40),
            appButton(
              onTap: () {
                // TODO :: HANDLE
              },
              clr: darkblueColor,
              title: CustomStrings.signup2,
            ),
            SizedBox(height: height / 30),
          ],
        ),
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
              color: Colors.white,
              fontSize: height / 55,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
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
