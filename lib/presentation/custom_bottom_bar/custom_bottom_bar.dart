import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; 
import '../../connection_status/connection_status_singleton.dart';
import '../../core/utils/image_constant.dart';
import '../Library_Screen/Library_Screen.dart';
import '../Profile_Screen/Profile_Screen.dart';
import '../Search_screen/Search_Screen.dart';
import '../home/home_screen_page.dart';
 
class BottombarPage extends StatefulWidget {
  final int? buttomIndex;
  bool? isGuest = false;

  BottombarPage({required this.buttomIndex, this.isGuest});

  @override
  State<BottombarPage> createState() => _BottombarPageState();
}

class _BottombarPageState extends State<BottombarPage> {
  bool keyboardOpen = false;
  var ProfileURL = "";
  int selectedIndex = 0;
  var IsGuestUserEnabled;
  var GetTimeSplash;

  List widgetOptions = [
    HomeScreenPage(),
    SearchScreen(),
    LibraryScreen(),
    ProfileScreen(), 

    // ViewDetailsScreen(),
    // ViewCommentScreen(),
    // // BuyScreen(),
    // RoomMembersScreen(),
    // RoomsScreen()
  ];
  String? userId;
  getDataStroe() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString(
      "x"
    );
    print('THIS METHODCHECL DATA-$userId');
    setState(() {});
  }

  late StreamSubscription _connectionChangeStream;

  bool isOffline = false;
  @override
  initState() {
    super.initState();
    getDataStroe();
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
        ? Text("NOt Connected")
        : WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              floatingActionButton: Stack(
                children: const [],
              ),
              bottomNavigationBar: BottomAppBar(
                // color: Color(0xFFFFFFFF),
                color: Theme.of(context).brightness == Brightness.light
                    ? Color(0xFFFFFFFF)
                    : Color(0xFF0D0D0D),
                shape: const CircularNotchedRectangle(),
                child: Padding(
                  padding: EdgeInsets.only(top: 17, bottom: 0),
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
                          // color: Colors.white,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Color(0xFFFFFFFF)
                                  : Color(0xFF0D0D0D),
                          height: 65,
                          width: 40,
                          child: Column(
                            children: [
                              Container(
                                child: selectedIndex != 0
                                    ? Image.asset(
                                        "${ImageConstant.Home}",
                                        height: 30,
                                        width: 30,
                                      )
                                    : Container(
                                        height: 30,
                                        width: 30,
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              "${ImageConstant.SlectedHome}",
                                              color: Color(0XFFED1C25),
                                            ),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromARGB(
                                                  255, 250, 166, 170),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                      ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print('userId1-$userId');
                          if (userId != null) {
                            setState(() {
                              selectedIndex = 1;
                            });
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      SearchScreen(),
                                ));
                          }
                        },
                        child: Container(
                          height: 65,
                          width: 40,
                          // color: Colors.white,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Color(0xFFFFFFFF)
                                  : Color(0xFF0D0D0D),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 3.0),
                                child: Container(
                                  child: selectedIndex != 1
                                      ? Image.asset(
                                          "${ImageConstant.Search}",
                                          height: 30,
                                          width: 25,
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: .0, top: 0),
                                          child: Container(
                                            height: 30,
                                            width: 25,
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                  "${ImageConstant.SlectedSearch}",
                                                  color: Color(0XFFED1C25),
                                                  height: 30,
                                                ),
                                              ],
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(40),
                                                  topRight: Radius.circular(40),
                                                  bottomLeft:
                                                      Radius.circular(40),
                                                  bottomRight:
                                                      Radius.circular(40)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                      255, 250, 166, 170),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print('userId2-$userId');
                          if (userId != null) {
                            setState(() {
                              selectedIndex = 2;
                            });
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      LibraryScreen(),
                                ));
                          }
                        },
                        child: Container(
                          height: 65,
                          width: 40,
                          // color: Colors.white,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Color(0xFFFFFFFF)
                                  : Color(0xFF0D0D0D),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Container(
                                  child: selectedIndex != 2
                                      ? Image.asset(
                                          "${ImageConstant.Library}",
                                          height: 24,
                                          width: 24,
                                        )
                                      : Container(
                                          height: 30,
                                          width: 30,
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "${ImageConstant.SelectedLibrary}",
                                                color: Color(0XFFED1C25),
                                                height: 24,
                                                width: 24,
                                              ),
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                            // color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                                bottomLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 250, 166, 170),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0, 3),
                                              )
                                            ],
                                          ),
                                        ),
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print('userId3-$userId');
                          if (userId != null) {
                            setState(() {
                              selectedIndex = 3;
                            });
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProfileScreen(),
                                ));
                          }
                        },
                        child: Container(
                          height: 65,
                          width: 40,
                          // color: Colors.white,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Color(0xFFFFFFFF)
                                  : Color(0xFF0D0D0D),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Container(
                                  child: selectedIndex != 3
                                      ? Image.asset(
                                          "${ImageConstant.ProfileIcon}",
                                          height: 26,
                                          width: 26,
                                        )
                                      : Container(
                                          height: 30,
                                          width: 30,
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "${ImageConstant.SelectedProfile}",
                                                color: Color(0XFFED1C25),
                                                height: 26,
                                                width: 26,
                                              ),
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                                bottomLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 250, 166, 170),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0, 3),
                                              ),
                                            ],
                                          ),
                                        ),
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                      // / ------------------------------------------------------------------
                  /*     GestureDetector(
                        onTap: () {
                          print('userId4-$userId');
                          if (userId != null) {
                            setState(() {
                              selectedIndex = 4;
                            });
                          } else {
                            print('else4');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      RegisterCreateAccountScreen(),
                                ));
                          }
                        },
                        child: Container(
                          height: 65,
                          width: 40,
                          // color: Colors.white,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Color(0xFFFFFFFF)
                                  : Color(0xFF0D0D0D),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Container(
                                  // height: 35,
                                  child: selectedIndex != 4
                                      ? Image.asset(
                                          "${ImageConstant.bottomprofile}",
                                          height: 26,
                                          width: 26,
                                        )
                                      : Container(
                                          // color: Colors.indigo,
                                          height: 30,
                                          width: 30,
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "${ImageConstant.bottomprofile}",
                                                color: Color(0XFFED1C25),
                                                // fit: BoxFit.cover,
                                                // fit: BoxFit.scaleDown,
                                                height: 26,
                                                width: 26,
                                              ),
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                            // color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                                bottomLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 250, 166, 170),
                                                //  Colors.grey.withOpacity(0.5),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                        ),
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                   */  ],
                  ),
                ),
              ),
              body: widgetOptions[selectedIndex],
            ),
          );
  }
}
