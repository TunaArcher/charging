import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

import '../../../../utils/color.dart';
import '../../../../utils/customwidget.dart';
import '../../../../utils/media.dart';
import '../../../../utils/string.dart';

import 'package:charging/features/explore/screens/explore/ac_pluge_screen.dart';
import 'package:charging/features/explore/screens/explore/all_pluge_screen.dart';
import 'package:charging/features/explore/screens/explore/dc_pluge_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with SingleTickerProviderStateMixin {
  String? currentAddress;
  CameraPosition? _kGooglePlex;
  TabController? tabController;
  int index = 0;

  LatLng? lastLatLng;
  final Completer<GoogleMapController> _controller = Completer();
  BitmapDescriptor? pinLocationIcon;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    // getCurrentData();
  }

  List<Widget> tab = [
    const AllPlugeScreen(),
    const AcPlugeScreen(),
    const DcPlugeScreen(),
  ];

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkPrimeryColor,
      bottomNavigationBar: appButton(
        onTap: () {
          // setState(() {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const booking(),
          //     ),
          //   );
          // });
        },
        clr: darkblueColor,
        title: CustomStrings.continues,
      ),
      body: Stack(
        children: [_buildMap(), _buildSearch()],
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: EdgeInsets.only(top: height / 3),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          height: height / 1.7,
          decoration: BoxDecoration(
            color: darkPrimeryColor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: height / 38),
              Row(
                children: [
                  SizedBox(width: width / 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        CustomStrings.heyplabon,
                        style: TextStyle(
                          color: lightgreyColor,
                          fontFamily: 'Gilroy Bold',
                          fontSize: height / 45,
                        ),
                      ),
                      Text(
                        CustomStrings.letsride,
                        style: TextStyle(
                          color: lightColor,
                          fontFamily: 'Gilroy Bold',
                          fontSize: height / 35,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: height / 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 20),
                child: Container(
                  height: height / 16,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: width / 80),
                      Container(
                        height: height / 16,
                        width: width / 1.6,
                        color: Colors.transparent,
                        child: TextField(
                          style: TextStyle(
                            color: lightColor,
                            fontSize: height / 60,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search_sharp,
                              color: lightgreyColor.withOpacity(0.8),
                            ),
                            hintText: "Where to?",
                            contentPadding: EdgeInsets.only(top: height / 50),
                            hintStyle: TextStyle(
                              color: lightgreyColor.withOpacity(0.8),
                              fontSize: height / 60,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: width / 30),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height / 60),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: width / 20),
                    child: Text(
                      'Please Select chrger type for your EV',
                      style: TextStyle(
                        color: lightColor,
                        fontFamily: 'Gilroy Medium',
                      ),
                    ),
                  )),
              SizedBox(height: height / 60),
              Padding(
                padding: EdgeInsets.only(left: width / 30, right: width / 30),
                child: Container(
                  height: height / 18,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    controller: tabController,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue,
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    labelStyle: const TextStyle(fontFamily: 'Gilroy_Bold'),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: const EdgeInsets.all(3),
                    tabs: const [
                      Tab(
                        child: Text(
                          'ALL',
                          style: TextStyle(
                            fontFamily: 'Gilroy bold',
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'AC',
                          style: TextStyle(
                            color: Color(0xffB0B3B8),
                            fontFamily: 'Gilroy bold',
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'DC',
                          style: TextStyle(
                            color: Color(0xffB0B3B8),
                            fontFamily: 'Gilroy bold',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: tab.map((tab) => tab).toList(),
                ),
              ),
              SizedBox(height: height / 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMap() {
    return Container(
      height: height / 2.2,
      width: width,
      color: Colors.transparent,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex ??
            const CameraPosition(
              target: LatLng(0.0, 0.0),
            ),
        markers: markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        onTap: (latLag) {
          setState(() {
            getCurrentMap(latLag);
            // setCustomMapPin();
          });
        },
      ),
    );
  }

  Future<void> getCurrentMap(LatLng latLng) async {
    _kGooglePlex = CameraPosition(target: latLng, zoom: 18);
    lastLatLng = latLng;
    setState(() {});

    GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: 18.0),
      ),
    );
    setState(() {});
    getAddressFromLatLong(latLng);
    setCustomMapPin();
  }

  Future<void> getAddressFromLatLong(LatLng latLng) async {
    lastLatLng = latLng;
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      String name = place.name.toString();
      String thoroughfare = place.thoroughfare.toString();
      String area = place.subLocality.toString();
      String city = place.locality.toString();
      String state = place.administrativeArea.toString();
      String country = place.country.toString();
      currentAddress =
          "$name${(name.isNotEmpty) ? ", " : ""}$thoroughfare${(thoroughfare.isNotEmpty) ? ", " : ""}$area${(area.isNotEmpty) ? ", " : ""}$city${(city.isNotEmpty) ? ", " : ""}$state${(state.isNotEmpty) ? ", " : ""}$country.";
      setState(() {});
    }
  }

  void setCustomMapPin() async {
    markers = <Marker>{
      Marker(
        draggable: true,
        visible: true,
        markerId: MarkerId(lastLatLng.toString()),
        position: lastLatLng!,
        icon: pinLocationIcon = await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(devicePixelRatio: 10000),
          'assets/icons/pin.png',
        ),
      )
    };
  }
}
