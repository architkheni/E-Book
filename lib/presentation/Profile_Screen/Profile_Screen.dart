// ignore_for_file: file_names

import 'package:book/ColorTheme/ColorTheme.dart';
import 'package:book/core/utils/color_constant.dart';
import 'package:book/core/utils/size_utils.dart';
import 'package:book/provider/auth_provider.dart';
import 'package:book/provider/profile_provider.dart';
import 'package:book/router/app_routes.dart';
import 'package:book/theme/custom_button_style.dart';
import 'package:book/widgets/app_bar/appbar_subtitle.dart';
import 'package:book/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/utils/image_constant.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/custom_image_view.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

final List<String> entries = <String>[
  'Your Membership',
  'Preferred Categories',
  'Content Language',
  'Dark Mode',
  'Contact Us',
  'Share',
];

final List<String> imageList = <String>[
  ImageConstant.yourMembership,
  ImageConstant.presonalisation,
  ImageConstant.contentlanguage,
  ImageConstant.appTheme,
  ImageConstant.contactUs,
  ImageConstant.share,
];
bool light = true;
// final List<int> colorCodes = <int>[600, 500, 100];

class _ProfileScreenState extends State<ProfileScreen> {
  String version = '';

  @override
  void initState() {
    super.initState();
    getVersion();
    context.read<ProfileProvider>().init();
  }

  void getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isLight = Theme.of(context).brightness == Brightness.light;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SizedBox(
          width: width,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 25),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: appTheme.teal400,
                            width: 2,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.only(bottom: 3),
                      child: AppbarSubtitle(
                        text: 'Profile',
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      context.push(AppRoutesPath.editProfile);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25, bottom: 25),
                      child: SizedBox(
                        // color: Colors.green[100],
                        width: width,
                        height: 80,
                        child: Row(
                          children: [
                            Consumer<ProfileProvider>(
                              builder: (context, provider, child) {
                                return SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: provider.uploadImage.isEmpty
                                      ? Stack(
                                          children: [
                                            CircleAvatar(
                                              radius: 80,
                                              backgroundColor: isLight
                                                  ? ColorConstant.kF3F3F3
                                                  : ColorConstant.k626666,
                                              child: Icon(
                                                Icons.person,
                                                size: 40,
                                                color: isLight
                                                    ? ColorConstant.black
                                                    : ColorConstant.whiteA700,
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: ColorConstant
                                                      .primaryColor,
                                                  shape: BoxShape.circle,
                                                ),
                                                padding:
                                                    const EdgeInsets.all(6),
                                                child: Icon(
                                                  Icons.edit,
                                                  color: isLight
                                                      ? ColorConstant.whiteA700
                                                      : ColorConstant.black,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Stack(
                                          children: [
                                            Positioned.fill(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: CustomImageView(
                                                  url: provider.uploadImage,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: ColorConstant
                                                      .primaryColor,
                                                  shape: BoxShape.circle,
                                                ),
                                                padding:
                                                    const EdgeInsets.all(6),
                                                child: Icon(
                                                  Icons.edit,
                                                  color: isLight
                                                      ? ColorConstant.whiteA700
                                                      : ColorConstant.black,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ), /*  CustomImageView(
                                  imagePath: ImageConstant.profile,
                                ), */
                                );
                              },
                            ),
                            const Spacer(),
                            SizedBox(
                              height: 80,
                              width: width - 130,
                              // color: Colors.yellow[400],
                              child: Column(
                                children: [
                                  const Spacer(),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Consumer<ProfileProvider>(
                                      builder: (context, provider, child) {
                                        return provider.username.isNotEmpty
                                            ? Text(
                                                provider.username,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: CustomTextStyles
                                                    .titleMediumWhiteA700
                                                    .copyWith(
                                                  color: isLight
                                                      ? ColorConstant.black
                                                      : null,
                                                ),
                                              )
                                            : const SizedBox.shrink();
                                      },
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Consumer<ProfileProvider>(
                                      builder: (context, provider, child) {
                                        return Text(
                                          provider.email,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: CustomTextStyles
                                              .titleSmallWhiteA400
                                              .copyWith(
                                            fontWeight: FontWeight.w100,
                                            color: isLight
                                                ? ColorConstant.black
                                                : null,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 0.5,
                      width: width,
                      color: appTheme.blueGray400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ListView.builder(
                      itemCount: entries.length,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            onTap: () {
                              switch (index) {
                                case 0:
                                  context.push(AppRoutesPath.payment);
                                  break;
                                case 1:
                                  context.push(
                                    AppRoutesPath.category,
                                    extra: true,
                                  );
                                  break;
                                case 2:
                                  context.push(
                                    AppRoutesPath.language,
                                    extra: {
                                      'start': false,
                                      'goIsProfile': true,
                                    },
                                  );

                                  break;
                                case 3:
                                  break;
                                case 4:
                                  context.push(AppRoutesPath.contactUs);
                                  break;
                                case 5:
                                  Share.share('Share your book');
                                  break;
                                default:
                              }
                            },
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: isLight
                                    ? ColorConstant.kF3F3F3
                                    : ColorConstant.k272828,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: CustomImageView(
                                  height: 25,
                                  width: 25,
                                  color: ColorConstant.primaryColor,
                                  imagePath: imageList[index],
                                ),
                              ),
                            ),
                            title: Text(
                              entries[index],
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style:
                                  CustomTextStyles.titleSmallWhiteA400.copyWith(
                                fontWeight: FontWeight.w500,
                                color: isLight ? ColorConstant.black : null,
                              ),
                            ),
                            trailing: index == 0
                                ? Consumer<ProfileProvider>(
                                    builder: (context, provider, child) {
                                      return Text(
                                        provider.packageName ?? '',
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: CustomTextStyles
                                            .titleSmallWhiteA400
                                            .copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: isLight
                                              ? ColorConstant.black
                                              : null,
                                        ),
                                      );
                                    },
                                  )
                                : index == 3
                                    ? Consumer<ThemeProvider>(
                                        builder:
                                            (context, themeProvider, child) {
                                          return Switch(
                                            value: themeProvider.isdarkMode,
                                            activeColor:
                                                ColorConstant.primaryColor,
                                            onChanged: (bool value) {
                                              final provider =
                                                  Provider.of<ThemeProvider>(
                                                context,
                                                listen: false,
                                              );
                                              provider.toggleTheme(value);
                                            },
                                          );
                                        },
                                      )
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        child: CustomImageView(
                                          svgPath: ImageConstant.imgArrowright,
                                          height: 16,
                                          width: 16,
                                          color: isLight
                                              ? ColorConstant.black
                                              : null,
                                        ),
                                      ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: CustomElevatedButton(
                      onTap: () async {
                        context.read<AuthProvider>().logout(context);
                      },
                      width: double.maxFinite,
                      height: getVerticalSize(48),
                      text: 'Log out',
                      buttonStyle: CustomButtonStyles.fillTeal400,
                      buttonTextStyle:
                          CustomTextStyles.titleSmallPrimary_1.copyWith(
                        color: isLight
                            ? ColorConstant.whiteA700
                            : ColorConstant.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'version: v.$version',
                    style: const TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
