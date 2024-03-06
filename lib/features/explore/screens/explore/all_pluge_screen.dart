import 'package:flutter/material.dart';

import '../../../../utils/color.dart';
import '../../../../utils/media.dart';

class AllPlugeScreen extends StatefulWidget {
  const AllPlugeScreen({super.key});

  @override
  State<AllPlugeScreen> createState() => _AllPlugeScreenState();
}

class _AllPlugeScreenState extends State<AllPlugeScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;

  List name = [
    'CHAdeMo',
    'GB/T',
    'ccs-Type-1',
    'ccs-Type-2',
    'Type 1',
    'GB/T',
    'Type 1-J1772',
    'Tyep 2',
  ];
  List image = [
    'assets/icons/image 60925.png',
    'assets/icons/image 60926.png',
    'assets/icons/image 60929.png',
    'assets/icons/image 60930.png',
    'assets/icons/image 60921 (1).png',
    'assets/icons/image 60922.png',
    'assets/icons/image 60923.png',
    'assets/icons/image 60924.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GridView.count(
        crossAxisCount: 4,
        padding: EdgeInsets.only(left: width / 30, top: height / 50),
        mainAxisSpacing: 1,
        childAspectRatio: (1.1),
        shrinkWrap: true,
        children: List.generate(image.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Stack(
              children: [
                Container(
                  height: height / 11,
                  width: width / 5,
                  decoration: BoxDecoration(
                    color: stationdark,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(
                        color: _selectedIndex == index
                            ? darkblueColor
                            : lightgreyColor),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height / 20,
                          child: Image.asset(
                            '${image[index]}',
                            scale: 5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: SizedBox(
                            width: width / 5,
                            child: Center(
                              child: Text(
                                '${name[index]}',
                                style: TextStyle(
                                  color: lightColor,
                                  fontSize: 12,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: width / 6, bottom: height / 15),
                  child: Container(
                    height: height / 50,
                    width: width / 22,
                    decoration: BoxDecoration(
                      color: _selectedIndex == index
                          ? darkblueColor
                          : const Color(0xffE3E3E3),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
