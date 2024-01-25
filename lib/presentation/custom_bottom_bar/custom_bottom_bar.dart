import 'package:book/core/storage/cache_storage.dart';
import 'package:book/core/utils/color_constant.dart';
import 'package:book/model/book_model.dart';
import 'package:book/provider/continue_reading_book_provider.dart';
import 'package:book/router/app_routes.dart';
import 'package:book/theme/theme_helper.dart';
import 'package:book/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../core/utils/image_constant.dart';
import '../../theme/custom_text_style.dart';

class BottombarPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const BottombarPage({
    Key? key,
    required this.navigationShell,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int selectedIndex = navigationShell.currentIndex;
    return WillPopScope(
      onWillPop: () async {
        if (selectedIndex != 0) {
          navigationShell.goBranch(0);
          return false;
        } else if (CacheStorage.count == 0) {
          return true;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Press back again to exit the app.'),
              backgroundColor: appTheme.teal400,
            ),
          );
          CacheStorage.count--;
          Future.delayed(
            const Duration(seconds: 2),
            () {
              CacheStorage.count = 1;
            },
          );
          return false;
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: SizedBox(
          height: 70,
          child: BottomAppBar(
            elevation: 0,
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
                      context.go(AppRoutesPath.home);
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
                                    color: ColorConstant.primaryColor,
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
                      context.go(AppRoutesPath.explore);
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
                                    color: ColorConstant.primaryColor,
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
                      context.go(AppRoutesPath.library);
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
                                    color: ColorConstant.primaryColor,
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
                                    color: ColorConstant.primaryColor,
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
        body: Column(
          children: [
            Expanded(child: navigationShell),
            Consumer<ContinueReadingProvider>(
              builder: (context, provider, child) {
                BookModel? book = provider.bookModel;
                if (book == null) {
                  return const SizedBox.shrink();
                }
                return GestureDetector(
                  onTap: () {
                    context.push(
                      AppRoutesPath.bookRead,
                      extra: provider.bookModel!.bookId!,
                    );
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? const Color(0xFF0D0D0D)
                          : const Color(0xFFFFFFFF),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width * 5 / 100,
                        ),
                        SizedBox(
                          height: 52.5,
                          width: 35,
                          child: CustomImageView(
                            url: book.frontCover,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Continue reading',
                                style: TextStyle(
                                  color: ColorConstant.grey,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                book.name!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            context
                                .read<ContinueReadingProvider>()
                                .setBook(null);
                          },
                          icon: Icon(
                            Icons.clear,
                            color: ColorConstant.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
