// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:book/core/utils/color_constant.dart';
import 'package:book/provider/explore_provider.dart';
import 'package:book/provider/home_provider.dart';
import 'package:book/provider/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  BottombarPage({Key? key, required this.buttomIndex, this.isGuest})
      : super(key: key);

  @override
  State<BottombarPage> createState() => _BottombarPageState();
}

class _BottombarPageState extends State<BottombarPage> {
  bool keyboardOpen = false;
  var profileURL = '';
  int selectedIndex = 0;
  var isGuestUserEnabled;
  var getTimeSplash;

  List widgetOptions = [
    const HomeScreenPage(),
    const ExplorePage(),
    const MyLibraryScreen(),
    const ProfileScreen(),
  ];

  // ignore: cancel_subscriptions, unused_field
  late StreamSubscription _connectionChangeStream;

  bool isOffline = false;
  @override
  initState() {
    super.initState();
    context.read<HomePovider>().getDashboardDetails();
    context.read<ExploreProvider>().getAllCategories();
    context.read<WishlistProvider>().getWishListBook();
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
        ? const Text('Not Connected')
        : WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              bottomNavigationBar: SizedBox(
                height: 70,
                child: BottomAppBar(
                  // color: Color(0xFFFFFFFF),
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color(0xFF0D0D0D)
                      : const Color(0xFFFFFFFF),
                  padding: EdgeInsets.zero,
                  shape: const CircularNotchedRectangle(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              // setUI();
                              selectedIndex = 0;
                            });
                          },
                          child: Container(
                            color: selectedIndex != 0
                                ? Colors.transparent
                                : ColorConstant.primaryColor.withOpacity(0.10),
                            width: 60,
                            child: Column(
                              children: [
                                const Spacer(),
                                Container(
                                  child: selectedIndex != 0
                                      ? Image.asset(
                                          ImageConstant.home,
                                          height: 25,
                                          width: 25,
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? ColorConstant.whiteA700
                                              : Colors.black,
                                        )
                                      : Image.asset(
                                          ImageConstant.slectedHome,
                                          height: 25,
                                          width: 25,
                                        ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Home',
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: selectedIndex != 0
                                      ? CustomTextStyles.titleSmallGray500
                                          .copyWith(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? ColorConstant.whiteA700
                                              : Colors.black,
                                        )
                                      : CustomTextStyles.labelLargeTeal500Bold,
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          },
                          child: Container(
                            width: 60,
                            color: selectedIndex != 1
                                ? Colors.transparent
                                : ColorConstant.primaryColor.withOpacity(0.10),
                            child: Column(
                              children: [
                                const Spacer(),
                                Container(
                                  child: selectedIndex != 1
                                      ? Image.asset(
                                          ImageConstant.search,
                                          height: 24,
                                          width: 24,
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? ColorConstant.whiteA700
                                              : Colors.black,
                                        )
                                      : Image.asset(
                                          ImageConstant.slectedSearch,
                                          height: 24,
                                          width: 24,
                                        ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Search',
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: selectedIndex != 1
                                      ? CustomTextStyles.titleSmallGray500
                                          .copyWith(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? ColorConstant.whiteA700
                                              : Colors.black,
                                        )
                                      : CustomTextStyles.labelLargeTeal500Bold,
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 2;
                            });
                          },
                          child: Container(
                            width: 60,
                            // color: Colors.white,
                            color: selectedIndex != 2
                                ? Colors.transparent
                                : ColorConstant.primaryColor.withOpacity(0.10),
                            child: Column(
                              children: [
                                const Spacer(),
                                Container(
                                  child: selectedIndex != 2
                                      ? Image.asset(
                                          ImageConstant.library,
                                          height: 24,
                                          width: 24,
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? ColorConstant.whiteA700
                                              : Colors.black,
                                        )
                                      : Image.asset(
                                          ImageConstant.selectedLibrary,
                                          // color: Color(0XFFED1C25),
                                          height: 24,
                                          width: 24,
                                        ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Library',
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: selectedIndex != 2
                                      ? CustomTextStyles.titleSmallGray500
                                          .copyWith(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? ColorConstant.whiteA700
                                              : Colors.black,
                                        )
                                      : CustomTextStyles.labelLargeTeal500Bold,
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 3;
                            });
                          },
                          child: Container(
                            // color: Colors.white,
                            color: selectedIndex != 3
                                ? Colors.transparent
                                : ColorConstant.primaryColor.withOpacity(0.10),
                            child: Column(
                              children: [
                                const Spacer(),
                                Container(
                                  child: selectedIndex != 3
                                      ? Image.asset(
                                          ImageConstant.profileIcon,
                                          height: 26,
                                          width: 26,
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? ColorConstant.whiteA700
                                              : Colors.black,
                                        )
                                      : Image.asset(
                                          ImageConstant.selectedProfile,
                                          height: 26,
                                          width: 26,
                                        ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Profile',
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: selectedIndex != 3
                                      ? CustomTextStyles.titleSmallGray500
                                          .copyWith(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? ColorConstant.whiteA700
                                              : Colors.black,
                                        )
                                      : CustomTextStyles.labelLargeTeal500Bold,
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: widgetOptions[selectedIndex],
            ),
          );
  }
}
