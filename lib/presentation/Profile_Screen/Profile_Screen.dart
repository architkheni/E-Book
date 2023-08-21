import 'package:book/core/utils/color_constant.dart';
import 'package:flutter/material.dart';

import '../../ColorTheme/ColorTheme.dart';
import '../../core/utils/image_constant.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/custom_image_view.dart';
import '../categories_screen/categories_screen.dart';
import '../home_recommended_for_you_see_all_screen/home_recommended_for_you_see_all_screen.dart';
import '../langugaes_screen/langugaes_screen.dart';
import 'Contact_Us.dart';
import 'editProfile.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

final List<String> entries = <String>[
  "Presonalisation",
  "Content Language",
  "App Language",
  "App Theme",
  "Contact Us",
  "Share"
];

final List<String> image_List = <String>[
  ImageConstant.Presonalisation,
  ImageConstant.contentlanguage,
  ImageConstant.Applanguage,
  ImageConstant.AppTheme,
  ImageConstant.ContactUs,
  ImageConstant.Share
];
bool light = true;
// final List<int> colorCodes = <int>[600, 500, 100];

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // final themeProviderr = Provider.of<ThemeProvider>(context);

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
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
                child: Text(
                  "Profile",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: CustomTextStyles.ProfileTitle,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 1.5,
                  width: 70,
                  color: appTheme.teal400,
                ),
              ),
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
                                child: Text(
                                  "John Doe",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles.titleMediumWhiteA700,
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "JohnDoe@gmail.com",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles.titleSmallWhiteA400,
                                ),
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
                child: Container(
                  // color: Colors.deepPurple[100],
                  height: _height / 1.55,
                  child: ListView.builder(
                      itemCount: entries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
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
                                      builder: (context) => CategoriesScreen()),
                                );
                                break;
                              case 1:
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LangugaesScreen()),
                                );
                                break;
                              case 2:
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LangugaesScreen()),
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
                              default:
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 9),
                            child: Container(
                              height: 55,
                              // color: Colors.amber[colorCodes[index]],
                              child: Center(
                                child: Row(
                                  children: [
                                    Container(
                                      // color: Colors.green[300],
                                      height: 50,
                                      width: 50,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: CustomImageView(
                                          imagePath: image_List[index],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "${entries[index]}",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: CustomTextStyles
                                            .titleSmallWhiteA400,
                                      ),
                                    ),
                                    Spacer(),
                                    index == 3
                                        ? Switch(
                                            // This bool value toggles the switch.
                                            value: light,
                                            // themeProviderr.isdarkMode,
                                            activeColor: ColorConstant.primary_color,

                                            onChanged: (bool value) {
                                              // This is called when the user toggles the switch.
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
                                            padding: const EdgeInsets.only(
                                                right: 15),
                                            child: CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgArrowright,
                                              height: 16,
                                              width: 16,
                                            ),
                                          )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
