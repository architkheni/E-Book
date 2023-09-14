import 'package:book/core/utils/color_constant.dart';
import 'package:book/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/utils/image_constant.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/custom_image_view.dart';
import '../categories_screen/categories_screen.dart';
import '../langugaes_screen/langugaes_screen.dart';
import '../payment_screen/payment_screen.dart';
import 'Contact_Us.dart';
import 'editProfile.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

final List<String> entries = <String>[
  "Your Membership",
  "Presonalisation",
  "Content Language",
  "App Theme",
  "Contact Us",
  "Share"
];

final List<String> imageList = <String>[
  ImageConstant.yourMembership,
  ImageConstant.presonalisation,
  ImageConstant.contentlanguage,
  ImageConstant.appTheme,
  ImageConstant.contactUs,
  ImageConstant.share
];
bool light = true;
// final List<int> colorCodes = <int>[600, 500, 100];

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileProvider>().init();
  }

  @override
  Widget build(BuildContext context) {
    // final themeProviderr = Provider.of<ThemeProvider>(context);

    double _width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: _width,
        color: Color(0xFF181A1A),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 25),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: CustomImageView(
                    imagePath: ImageConstant.profileImage,
                    height: 35,
                  )),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfile()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 25),
                  child: Container(
                    // color: Colors.green[100],
                    width: _width,
                    height: 80,
                    child: Row(
                      children: [
                        Container(
                            width: 80,
                            height: 80,
                            // color: Colors.red[300],
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage(ImageConstant.profile),
                            ) /*  CustomImageView(
                            imagePath: ImageConstant.profile,
                          ), */
                            ),
                        Spacer(),
                        Container(
                          height: 80,
                          width: _width - 130,
                          // color: Colors.yellow[400],
                          child: Column(
                            children: [
                              Spacer(),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Consumer<ProfileProvider>(
                                    builder: (context, provider, child) {
                                  return Text(
                                    provider.username,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        CustomTextStyles.titleMediumWhiteA700,
                                  );
                                }),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Consumer<ProfileProvider>(
                                    builder: (context, provider, child) {
                                  return Text(
                                    provider.email,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.titleSmallWhiteA400,
                                  );
                                }),
                              ),
                              Spacer()
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 0.5,
                  width: _width,
                  color: appTheme.blueGray400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ListView.builder(
                  itemCount: entries.length,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: () {
                          //  Navigator.push(
                          //               context,
                          //               MaterialPageRoute(
                          //                   builder: (context) =>
                          //                       HomeRecommendedForYouSeeAllScreen()),
                          //             );

                          switch (index) {
                            case 0:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PaymentScreen()),
                              );
                              break;
                            case 1:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoriesScreen()),
                              );
                              break;
                            case 2:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LangugaesScreen(
                                          start: false,
                                        )),
                              );

                              break;
                            case 3:
                              break;
                            case 4:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ContactUsScreen()),
                              );
                              break;
                            case 5:
                              // TODO: share profile
                              Share.share("Share your book");
                              break;
                            default:
                          }
                        },
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          height: 50,
                          width: 50,
                          child: CustomImageView(
                            imagePath: imageList[index],
                          ),
                        ),
                        title: Text(
                          "${entries[index]}",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: CustomTextStyles.titleSmallWhiteA400,
                        ),
                        trailing: index == 0
                            ? Text(
                                "Package Name",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.titleSmallWhiteA400,
                              )
                            : index == 3
                                ? Switch(
                                    value: light,
                                    // themeProviderr.isdarkMode,
                                    activeColor: ColorConstant.primaryColor,

                                    onChanged: (bool value) {
                                      setState(() {
                                        light = value;
                                        // final provider =
                                        //     Provider.of<ThemeProvider>(
                                        //         context,
                                        //         listen: false);
                                        // provider.toggleTheme(value);
                                        // saveTheme(value);
                                      });
                                    },
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: CustomImageView(
                                      svgPath: ImageConstant.imgArrowright,
                                      height: 16,
                                      width: 16,
                                    ),
                                  ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
