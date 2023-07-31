import 'package:book/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgAkariconshomealt1,
      activeIcon: ImageConstant.imgAkariconshomealt1,
      title: "Home",
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgSearchGray400,
      activeIcon: ImageConstant.imgSearchGray400,
      title: "Search",
      type: BottomBarEnum.Search,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgAkariconssearch,
      activeIcon: ImageConstant.imgAkariconssearch,
      title: "Library",
      type: BottomBarEnum.Library,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgAkariconssearchOnprimary,
      activeIcon: ImageConstant.imgAkariconssearchOnprimary,
      title: "Profile",
      type: BottomBarEnum.Profile,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: getHorizontalSize(
                    97,
                  ),
                  child: Divider(
                    height: getVerticalSize(
                      1,
                    ),
                    thickness: getVerticalSize(
                      1,
                    ),
                    color: theme.colorScheme.primary,
                  ),
                ),
                Container(
                  padding: getPadding(
                    top: 9,
                    bottom: 9,
                  ),
                  decoration: AppDecoration.black,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageView(
                        svgPath: bottomMenuList[index].icon,
                        height: getSize(
                          24,
                        ),
                        width: getSize(
                          24,
                        ),
                        color: appTheme.gray400,
                        margin: getMargin(
                          left: 36,
                          top: 10,
                          right: 36,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 30,
                          top: 9,
                          right: 29,
                          bottom: 9,
                        ),
                        child: Text(
                          bottomMenuList[index].title ?? "",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: CustomTextStyles.bodySmallGray400.copyWith(
                            color: appTheme.gray400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: getHorizontalSize(
                    97,
                  ),
                  child: Divider(
                    height: getVerticalSize(
                      1,
                    ),
                    thickness: getVerticalSize(
                      1,
                    ),
                    color: theme.colorScheme.primary,
                  ),
                ),
                Container(
                  padding: getPadding(
                    top: 9,
                    bottom: 9,
                  ),
                  decoration: AppDecoration
                      .gradientnamegray90001nameonPrimaryContaineropacity1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageView(
                        svgPath: bottomMenuList[index].activeIcon,
                        height: getSize(
                          24,
                        ),
                        width: getSize(
                          24,
                        ),
                        color: appTheme.teal400,
                        margin: getMargin(
                          left: 36,
                          top: 10,
                          right: 36,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 32,
                          top: 9,
                          right: 31,
                          bottom: 9,
                        ),
                        child: Text(
                          bottomMenuList[index].title ?? "",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: CustomTextStyles.labelLargeTeal400.copyWith(
                            color: appTheme.teal400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  Search,
  Library,
  Profile,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
