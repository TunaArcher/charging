import 'package:flutter/material.dart';

import '../../../../utils/color.dart';
import '../../../../utils/media.dart';
import '../../../../utils/string.dart';

import 'upcoming_screen.dart';
import 'complet_screen.dart';
import 'cancel_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tab = [
      const UpcomingScreen(),
      const CompletScreen(),
      const CancelScreen(),
    ];

    return Scaffold(
      backgroundColor: darkPrimeryColor,
      body: Padding(
        padding: EdgeInsets.only(left: width / 30, right: width / 30),
        child: Column(
          children: [
            /// -- Title Bar
            Padding(padding: EdgeInsets.only(top: height / 20)),
            SizedBox(height: height / 40),

            /// -- Tab
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: a,
                      ),
                      alignment: Alignment.centerLeft,
                      height: height / 14,
                      width: width / 1.1,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TabBar(
                          dividerColor: Colors.transparent,
                          labelStyle:
                              const TextStyle(fontFamily: 'Gilroy_Bold'),
                          indicatorColor: darkblueColor,
                          controller: controller,
                          // padding: EdgeInsets.zero,
                          indicatorPadding: const EdgeInsets.all(-1),
                          labelPadding: EdgeInsets.zero,
                          labelColor: Colors.white,
                          unselectedLabelColor: lightColor,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.blue,
                          ),
                          tabs: const [
                            Tab(
                              child: Text(
                                CustomStrings.upcoming,
                                style: TextStyle(
                                  fontFamily: 'Gilroy normal',
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                CustomStrings.completed,
                                style: TextStyle(
                                  fontFamily: 'Gilroy normal',
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                CustomStrings.cancelled,
                                style: TextStyle(
                                  fontFamily: 'Gilroy normal',
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: tab.map((tab) => tab).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
