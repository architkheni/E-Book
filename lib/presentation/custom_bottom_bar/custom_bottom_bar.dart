// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:book/core/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/image_constant.dart';
import '../../theme/custom_text_style.dart';

class BottombarPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  bool? isGuest = false;

  BottombarPage({
    Key? key,
    this.isGuest,
    required this.navigationShell,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int selectedIndex = navigationShell.currentIndex;
    return WillPopScope(
      onWillPop: () async => true,
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
                      navigationShell.goBranch(
                        0,
                        initialLocation: 0 == navigationShell.currentIndex,
                      );
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
                                ? CustomTextStyles.titleSmallGray500.copyWith(
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
                      navigationShell.goBranch(
                        1,
                        initialLocation: 1 == navigationShell.currentIndex,
                      );
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
                                ? CustomTextStyles.titleSmallGray500.copyWith(
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
                      navigationShell.goBranch(
                        2,
                        initialLocation: 2 == navigationShell.currentIndex,
                      );
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
                                ? CustomTextStyles.titleSmallGray500.copyWith(
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
                      navigationShell.goBranch(
                        3,
                        initialLocation: 3 == navigationShell.currentIndex,
                      );
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
                                ? CustomTextStyles.titleSmallGray500.copyWith(
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
        body: navigationShell,
      ),
    );
  }
}
