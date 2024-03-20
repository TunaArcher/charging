import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/color.dart';
import '../../../../../utils/media.dart';
import '../../../../../utils/string.dart';
import '../../../controllers/profile_controller.dart';
import '../saved_screen.dart';

class UserListSetting extends StatefulWidget {
  const UserListSetting({super.key});

  @override
  State<UserListSetting> createState() => _UserListSettingState();
}

class _UserListSettingState extends State<UserListSetting> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: height / 40),
          child: Container(
            height: height / 4,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: a),
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
                  onTap: () => controller.logout(),
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
        )
      ],
    );
  }
}
