import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:get/get.dart';

import '../../../../utils/color.dart';
import '../../../../utils/customwidget.dart';
import '../../../../utils/media.dart';
import '../../../../utils/string.dart';

import 'saved_screen.dart';
import 'package:charging/features/authentication/screens/signinsignup/signtab.dart';
import 'package:charging/features/profile/screens/profile/healp_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController Name = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController no = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkPrimeryColor,
      body: Padding(
        padding: EdgeInsets.only(top: height / 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// -- Profile
              _buildProfile(),

              /// -- List Menu
              _buildListMenu(context),

              /// -- Helper Menu
              _buildHelperMenu(context),
            ],
          ),
        ),
      ),
    );
  }

  _buildProfile() {
    return Padding(
      padding: EdgeInsets.only(top: height / 40),
      child: Container(
        height: height / 8,
        decoration: BoxDecoration(
          color: a,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () {
            setState(() {
              _EditProfile();
            });
          },
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: width / 30),
                child: CircleAvatar(
                  radius: width / 11,
                  backgroundImage: const NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv4fIuAZe1-UYch4QF0cKuPlpiE1dBdJxagAV-MVrnbg&s'),
                ),
              ),
              SizedBox(width: width / 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width / 2,
                    child: Text(
                      CustomStrings.username,
                      style: TextStyle(
                        fontFamily: 'Gilroy Medium',
                        fontSize: 20,
                        color: lightColor,
                      ),
                    ),
                  ),
                  SizedBox(height: height / 100),
                  Text(
                    CustomStrings.useremail,
                    style: TextStyle(
                      fontFamily: 'Gilroy Medium',
                      fontSize: 15,
                      color: greydark,
                    ),
                  ),
                ],
              ),
              SizedBox(width: width / 30),
              Icon(
                Icons.navigate_next_sharp,
                size: width / 10,
                color: lightColor,
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildListMenu(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: height / 40),
      child: Container(
        height: height / 4,
        width: double.infinity,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), color: a),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /// -- Favorites
            InkWell(
              onTap: () => Get.to(() => const SavedScreen()),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width / 20),
                    child: Image.asset(
                      'assets/icons/Star, rating, favorites, like, half.png',
                      height: height / 30,
                    ),
                  ),
                  SizedBox(width: width / 25),
                  SizedBox(
                    width: width / 1.65,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Favorites',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Gilroy Medium',
                            color: lightColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: width / 37),
                  InkWell(
                    onTap: () {
                      // setState(() {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const saved()),
                      //   );
                      // });
                    },
                    child: Icon(
                      Icons.navigate_next,
                      size: width / 10,
                      color: lightColor,
                    ),
                  ),
                  SizedBox(width: width / 30),
                ],
              ),
            ),

            /// -- RFID Cards
            InkWell(
              onTap: () {
                AlertDialog alert = AlertDialog(
                  title: Text('Development'),
                );
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );
              },
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width / 20),
                    child: Image.asset(
                      'assets/icons/Receipt, bill, invoice.png',
                      height: height / 30,
                    ),
                  ),
                  SizedBox(width: width / 25),
                  SizedBox(
                    width: width / 1.7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'RFID Cards',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Gilroy Medium',
                            color: lightColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: width / 25.3),
                  InkWell(
                    onTap: () {
                      // TODO:: HANDLE
                    },
                    child: Icon(
                      Icons.navigate_next,
                      size: width / 10,
                      color: lightColor,
                    ),
                  ),
                  SizedBox(width: width / 30),
                ],
              ),
            ),

            /// -- Logout
            InkWell(
              onTap: () => Get.offAll(() => SignTab()),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width / 20),
                    child: Image.asset(
                      'assets/icons/Log, out, sign.png',
                      height: height / 30,
                    ),
                  ),
                  SizedBox(width: width / 25),
                  SizedBox(
                    width: width / 1.7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          CustomStrings.Logout,
                          style: TextStyle(
                            fontSize: 20,
                            color: lightColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: width / 25.3),
                  InkWell(
                    onTap: () {
                      setState(() {});
                    },
                    child: Icon(
                      Icons.navigate_next,
                      size: width / 10,
                      color: lightColor,
                    ),
                  ),
                  SizedBox(width: width / 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildHelperMenu(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: height / 40, bottom: height / 40),
      child: Container(
        height: height / 8,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), color: a),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /// -- Help
            InkWell(
              onTap: () => Get.to(() => const HealpScreen()),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width / 20),
                    child: Image.asset(
                      'assets/icons/Warning, circe.png',
                      height: height / 30,
                    ),
                  ),
                  SizedBox(width: width / 25),
                  SizedBox(
                    width: width / 1.7,
                    child: Text(
                      CustomStrings.help,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Gilroy Medium',
                        color: lightColor,
                      ),
                    ),
                  ),
                  SizedBox(width: width / 25.3),
                  Icon(Icons.navigate_next_rounded,
                      size: width / 10, color: lightColor),
                  SizedBox(width: width / 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _EditProfile() {
    return showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              // ignore: sized_box_for_whitespace
              child: Container(
                decoration: BoxDecoration(
                  color: darkPrimeryColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                ),
                height: height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(
                            () {
                              Navigator.pop(context);
                            },
                          );
                        },
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: height / 15,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.lightBlueAccent,
                                  Colors.cyanAccent,
                                ],
                              ),
                            ),
                            child: Center(
                                child: Text(
                              'Save',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Gilroy Bold',
                                fontSize: width / 20,
                              ),
                            )),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Center(
                              child: Text(
                                'Edit Profile',
                                style: TextStyle(
                                  color: lightColor,
                                  fontFamily: 'Gilroy Medium',
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Text(
                              "Name",
                              style: TextStyle(
                                fontFamily: "Gilroy Bold",
                                fontSize: 16,
                                color: lightColor,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.02),
                            textfield(
                              tclr: lightColor,
                              controller: Name,
                              feildcolor: a,
                              labelcolor: darkPrimeryColor,
                              suffix: null,
                              text: "Enter your Name",
                            ),
                            SizedBox(height: Get.height * 0.02),
                            Text(
                              "Email Address",
                              style: TextStyle(
                                fontFamily: "Gilroy Bold",
                                fontSize: 16,
                                color: lightColor,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.01),
                            textfield(
                              tclr: lightColor,
                              controller: Email,
                              feildcolor: a,
                              labelcolor: darkPrimeryColor,
                              suffix: null,
                              text: "Enter your Email Address",
                            ),
                            SizedBox(height: Get.height * 0.02),
                            Text(
                              "Mobile ",
                              style: TextStyle(
                                fontFamily: "Gilroy Bold",
                                fontSize: 16,
                                color: lightColor,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.01),
                            Padding(
                              padding: EdgeInsets.only(bottom: height / 10),
                              child: textfield(
                                tclr: darkblueColor,
                                controller: no,
                                feildcolor: a,
                                labelcolor: darkPrimeryColor,
                                suffix: null,
                                text: "Enter Mobile Number",
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
