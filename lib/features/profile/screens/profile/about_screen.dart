import 'package:flutter/material.dart';

import '../../../../utils/color.dart';
import '../../../../utils/media.dart';
import '../../../../utils/string.dart';

class AboutScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkPrimeryColor,
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            setState(() {
              Navigator.pop(context);
            });
          },
          child: Icon(
            Icons.arrow_back,
            color: lightColor,
          ),
        ),
        backgroundColor: darkPrimeryColor,
        elevation: 0,
        title: Text(
          'About App',
          style: TextStyle(color: lightColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: width / 30, right: width / 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: Text(
                  CustomStrings.healp,
                  style: TextStyle(
                    color: greydark,
                    fontFamily: 'Gilroy Medium',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                child: Text(
                  CustomStrings.healp1,
                  style: TextStyle(
                    color: greydark,
                    fontFamily: 'Gilroy Medium',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                child: Text(
                  CustomStrings.healp2,
                  style: TextStyle(
                    color: greydark,
                    fontFamily: 'Gilroy Medium',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                child: Text(
                  CustomStrings.healp3,
                  style: TextStyle(
                    color: greydark,
                    fontFamily: 'Gilroy Medium',
                  ),
                ),
              ),
              const SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}
