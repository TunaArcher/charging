import 'package:flutter/material.dart';

import '../../../../utils/color.dart';
import '../../../../utils/media.dart';

class DcPlugeScreen extends StatefulWidget {
  const DcPlugeScreen({super.key});

  @override
  State<DcPlugeScreen> createState() => _DcPlugeScreenState();
}

class _DcPlugeScreenState extends State<DcPlugeScreen>
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
  ];
  List image = [
    'assets/icons/image 60925.png',
    'assets/icons/image 60926.png',
    'assets/icons/image 60929.png',
    'assets/icons/image 60930.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GridView.count(
        crossAxisCount: 4,
        padding: EdgeInsets.only(left: width / 30, top: height / 50),
        mainAxisSpacing: 1,
        // physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: (1.1),
        shrinkWrap: true,
        children: List.generate(4, (index) {
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
                        Image.asset(
                          '${image[index]}',
                          scale: 7,
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
