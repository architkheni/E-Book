// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
// import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../detail_page_container_page/detail_page_container_page.dart';

// ignore_for_file: must_be_immutable
class BookReadScreen extends StatefulWidget {
  BookReadScreen({Key? key}) : super(key: key);

  @override
  State<BookReadScreen> createState() => _BookReadScreenState();
}

bool ShowBox = false;
int _currentSliderValue = 1;
String fontFamily = "Roboto";
int ShowBorder = 0;

class _BookReadScreenState extends State<BookReadScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  @override
  void initState() {
    ShowBox = false;
    ShowBorder = 0;
    super.initState();
  }

  @override
  void dispose() {
    ShowBox = false;
    ShowBorder = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    PageController controller = PageController();
    int _curr = 0;

    final List<Widget> entries = <Widget>[
      Center(
          child: Pages(
        text: "Page One",
        color: Colors.teal,
        FontSize: _currentSliderValue,
        fontFamily: fontFamily,
      )),
      Center(
          child: Pages(
        text: "Page Two",
        color: Colors.red.shade100,
        FontSize: _currentSliderValue,
        fontFamily: fontFamily,
      )),
      Center(
          child: Pages(
        text: "Page Three",
        color: Colors.grey,
        FontSize: _currentSliderValue,
        fontFamily: fontFamily,
      )),
      Center(
          child: Pages(
        text: "Page Four",
        color: Colors.yellow.shade100,
        FontSize: _currentSliderValue,
        fontFamily: fontFamily,
      ))
    ];

    return SafeArea(
        child: Scaffold(
      backgroundColor: appTheme.gray90003,
      appBar: CustomAppBar(
          height: 70,
          leadingWidth: 37,
          leading: AppbarImage(
              onTap: () {
                Navigator.pop(context);
              },
              height: 24,
              width: 24,
              imagePath: ImageConstant.DownArrow,
              margin: getMargin(left: 13, top: 16, bottom: 16)),
          actions: [
            AppbarImage(
                height: 17,
                width: 21,
                imagePath: ImageConstant.TextImage,
                margin: getMargin(left: 16, top: 19, right: 16, bottom: 4),
                onTap: () {
                  if (ShowBox == false) {
                    ShowBox = true;
                  } else {
                    ShowBox = false;
                  }
                  setState(() {});
                }),
            AppbarImage(
                height: 24,
                width: 24,
                imagePath: ImageConstant.option,
                margin: getMargin(left: 9, top: 16, right: 32),
                onTap: () {})
          ]),
      body: Stack(
        children: [
          Container(
            height: _height,
            width: _width,
            child: PageView(
              allowImplicitScrolling: true,
              children: entries,
              scrollDirection: Axis.horizontal,
              controller: controller,
              onPageChanged: (num) {
                setState(() {
                  _curr = num;
                  print("++++++++++++++++");
                  print(_curr);
                });
              },
            ),
          ),
          ShowBox == true
              ? Container(
                  color: Color.fromARGB(210, 32, 32, 32),
                  height: _height,
                  width: _width,
                  child: Column(
                    children: [
                      Container(
                        height: _height / 3.5,
                        width: _width,
                        color: Color.fromARGB(255, 32, 32, 32),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Container(
                                height: _height / 13,
                                width: _width,
                                // color: Colors.blue[200],
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: CustomImageView(
                                        height: 15,
                                        width: 15,
                                        imagePath: ImageConstant.TextImage,
                                      ),
                                    ),
                                    Container(
                                      width: _width - 60,
                                      child: Slider(
                                        value: _currentSliderValue.toDouble(),
                                        max: 10,
                                        activeColor: appTheme.teal400,
                                        inactiveColor: appTheme.whiteA700,
                                        // thumbColor: Colors.transparent,
                                        label: _currentSliderValue
                                            .round()
                                            .toString(),
                                        onChanged: (double value) {
                                          setState(() {
                                            _currentSliderValue = value.toInt();
                                            print(_currentSliderValue);
                                          });
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: CustomImageView(
                                        height: 23,
                                        width: 23,
                                        imagePath: ImageConstant.TextImage,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              child: Container(
                                height: _height / 13,
                                width: _width,
                                // color: Colors.blue[800],
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            fontFamily = "Roboto";
                                            ShowBorder = 1;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(7.0),
                                          child: Container(
                                            height: _height,
                                            width: _width,
                                            decoration: ShowBorder == 1  
                                                ? BoxDecoration(
                                                    border: Border.all(
                                                      color: appTheme.teal400,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                13)),
                                                  )
                                                : BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                13)),
                                                  ),
                                            child: Center(
                                              child: Text("Aa",
                                                  maxLines: 5,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: ShowBorder == 1  ?appTheme.whiteA700: appTheme.black900,
                                                      fontSize: 22,
                                                      fontFamily: 'Roboto',
                                                      fontWeight:
                                                          FontWeight.w900)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            fontFamily = "Outfit";
                                            ShowBorder = 2;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(7.0),
                                          child: Container(
                                            height: _height,
                                            width: _width,
                                            decoration: ShowBorder == 2
                                                ? BoxDecoration(
                                                    border: Border.all(
                                                      color: appTheme.teal400,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                13)),
                                                  )
                                                : BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                13)),
                                                  ),
                                            child: Center(
                                              child: Text("Aa",
                                                  maxLines: 5,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: ShowBorder == 2  ?appTheme.whiteA700: appTheme.black900,
                                                      fontSize: 22,
                                                      fontFamily: 'Outfit',
                                                      fontWeight:
                                                          FontWeight.w900)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, top: 20),
                              child: CustomElevatedButton(
                                onTap: () {
                                  setState(() {
                                    ShowBox = false;
                                  });
                                },
                                width: double.maxFinite,
                                height: getVerticalSize(48),
                                text: "Continue",
                                // margin: getMargin(top: 74),
                                buttonStyle: CustomButtonStyles.fillTeal400,
                                buttonTextStyle:
                                    CustomTextStyles.titleSmallPrimary_1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox(),
        ],
      ),
    ));
  }
}

class Pages extends StatelessWidget {
  final text;
  final color;
  int FontSize;
  String fontFamily;

  Pages(
      {this.text,
      this.color,
      required this.FontSize,
      required this.fontFamily});
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var bold = 22 + FontSize.toInt();
    var NormalFont = 17 + FontSize.toInt();
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        // color: color,
        child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
              Text(
                  "What is in it for me? Learn how to become an effecive unofficial project manager",
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: appTheme.whiteA700,
                      fontSize: bold.toDouble(),
                      fontFamily: fontFamily,
                      fontWeight: FontWeight.w900)),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                    "Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.",
                    maxLines: 15,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: appTheme.whiteA700,
                        fontSize: NormalFont.toDouble(),
                        fontFamily: fontFamily,
                        fontWeight: FontWeight.w400)),
              ),
            ])),
      ),
    );
  }
}
