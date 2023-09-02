// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';

import '../../connection_status/connection_status_singleton.dart';
import '../../core/utils/image_constant.dart';
import '../../theme/custom_text_style.dart';
import '../Profile_Screen/Profile_Screen.dart';
import '../explore_page/explore_page.dart';
import '../home/home_screen_page.dart';
import '../my_library_screen/my_library_screen.dart';

class BottombarPage extends StatefulWidget {
  final int? buttomIndex;
  bool? isGuest = false;

  BottombarPage({required this.buttomIndex, this.isGuest});

  @override
  State<BottombarPage> createState() => _BottombarPageState();
}

class _BottombarPageState extends State<BottombarPage> {
  bool keyboardOpen = false;
  var profileURL = "";
  int selectedIndex = 0;
  var isGuestUserEnabled;
  var getTimeSplash;

  List widgetOptions = [
    HomeScreenPage(),
    ExplorePage(),
    MyLibraryScreen(),
    ProfileScreen(),

    // ViewDetailsScreen(),
    // ViewCommentScreen(),
    // // BuyScreen(),
    // RoomMembersScreen(),
    // RoomsScreen()
  ];

  late StreamSubscription _connectionChangeStream;

  bool isOffline = false;
  @override
  initState() {
    super.initState();
    ConnectionStatusSingleton connectionStatus =
        ConnectionStatusSingleton.getInstance();
    _connectionChangeStream =
        connectionStatus.connectionChange.listen(connectionChanged);
    selectedIndex = widget.buttomIndex!;
  }

  void connectionChanged(dynamic hasConnection) {
    setState(() {
      isOffline = !hasConnection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (isOffline)
        ? Text("Not Connected")
        : WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              floatingActionButton: Stack(
                children: const [],
              ),
              bottomNavigationBar: Container(
                height: 70,
                child: BottomAppBar(
                  // color: Color(0xFFFFFFFF),
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Color(0xFFFFFFFF)
                      : Color(0xFF0D0D0D),
                  shape: const CircularNotchedRectangle(),
                  child: Padding(
                    padding: EdgeInsets.only(top: 13, bottom: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              // setUI();
                              selectedIndex = 0;
                            });
                          },
                          child: Container(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Color(0xFFFFFFFF)
                                    : Color(0xFF0D0D0D),
                            height: 65,
                            width: 60,
                            child: Column(
                              children: [
                                Container(
                                  child: selectedIndex != 0
                                      ? Image.asset(
                                          "${ImageConstant.home}",
                                          height: 25,
                                          width: 25,
                                        )
                                      : Image.asset(
                                          "${ImageConstant.slectedHome}",
                                          height: 25,
                                          width: 25,
                                          // color: Color(0XFFED1C25),
                                        ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: Text("Home",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: selectedIndex != 0
                                          ? CustomTextStyles.titleSmallGray500
                                          : CustomTextStyles
                                              .labelLargeTeal500Bold),
                                ),
                                // Spacer(),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          },
                          child: Container(
                            height: 65,
                            width: 60,
                            // color: Colors.white,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Color(0xFFFFFFFF)
                                    : Color(0xFF0D0D0D),
                            child: Column(
                              children: [
                                Container(
                                  child: selectedIndex != 1
                                      ? Image.asset(
                                          "${ImageConstant.search}",
                                          height: 24,
                                          width: 24,
                                        )
                                      : Image.asset(
                                          "${ImageConstant.slectedSearch}",
                                          height: 24,
                                          width: 24,
                                        ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: Text("Search",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: selectedIndex != 1
                                          ? CustomTextStyles.titleSmallGray500
                                          : CustomTextStyles
                                              .labelLargeTeal500Bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 2;
                            });
                          },
                          child: Container(
                            height: 65,
                            width: 60,
                            // color: Colors.white,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Color(0xFFFFFFFF)
                                    : Color(0xFF0D0D0D),
                            child: Column(
                              children: [
                                Container(
                                  child: selectedIndex != 2
                                      ? Image.asset(
                                          "${ImageConstant.library}",
                                          height: 24,
                                          width: 24,
                                        )
                                      : Image.asset(
                                          "${ImageConstant.selectedLibrary}",
                                          // color: Color(0XFFED1C25),
                                          height: 24,
                                          width: 24,
                                        ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: Text("Library",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: selectedIndex != 2
                                          ? CustomTextStyles.titleSmallGray500
                                          : CustomTextStyles
                                              .labelLargeTeal500Bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 3;
                            });
                          },
                          child: Container(
                            height: 65,
                            width: 60,
                            // color: Colors.white,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Color(0xFFFFFFFF)
                                    : Color(0xFF0D0D0D),
                            child: Column(
                              children: [
                                Container(
                                  child: selectedIndex != 3
                                      ? Image.asset(
                                          "${ImageConstant.profileIcon}",
                                          height: 26,
                                          width: 26,
                                        )
                                      : Image.asset(
                                          "${ImageConstant.selectedProfile}",
                                          // color: Color(0XFFED1C25),
                                          height: 26,
                                          width: 26,
                                        ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: Text("Profile",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: selectedIndex != 3
                                          ? CustomTextStyles.titleSmallGray500
                                          : CustomTextStyles
                                              .labelLargeTeal500Bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              body: widgetOptions[selectedIndex],
            ),
          );
  }
}
