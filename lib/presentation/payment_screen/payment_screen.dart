import 'dart:convert';
import 'dart:developer';

import 'package:book/core/storage/app_storage.dart';
import 'package:book/core/utils/color_constant.dart';
import 'package:book/core/utils/size_utils.dart';
import 'package:book/model/user_model.dart';
import 'package:book/theme/custom_button_style.dart';
import 'package:book/theme/custom_text_style.dart';
import 'package:book/theme/theme_helper.dart';
import 'package:book/widgets/app_bar/appbar_image.dart';
import 'package:book/widgets/app_bar/appbar_subtitle.dart';
import 'package:book/widgets/app_bar/custom_app_bar.dart';
import 'package:book/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/image_constant.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => PaymentScreenState();
}

class PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: CustomAppBar(
          height: 80,
          leadingWidth: 35,
          leading: AppbarImage(
            height: 20,
            width: 15,
            svgPath: ImageConstant.imgArrowleftBlueGray50,
            color: isLight ? ColorConstant.black : null,
            margin: getMargin(left: 16, top: 17, bottom: 18),
            onTap: () {
              context.pop();
            },
          ),
          title: Padding(
            padding: getPadding(left: 11),
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
                text: 'Upgrade Now',
              ),
            ),
          ),
        ),
        body: Padding(
          padding: getPadding(left: 20, right: 15, top: 10),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(left: 5),
                  child: Text(
                    'Ulimited insights from books, courses documentaries, and podcasts.',
                    style: TextStyle(
                      color:
                          isLight ? ColorConstant.black : ColorConstant.kEAF4F4,
                      fontSize: 22,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Package 1 Detail',
                  style: TextStyle(
                    color:
                        isLight ? ColorConstant.black : ColorConstant.kEAF4F4,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: getPadding(left: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'What you get',
                              style: TextStyle(
                                color: isLight
                                    ? ColorConstant.black
                                    : ColorConstant.kEAF4F4,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding: getPadding(left: 8),
                              child: Text(
                                'Unlimied Hacks',
                                style: TextStyle(
                                  color: isLight
                                      ? ColorConstant.black
                                      : ColorConstant.kEAF4F4,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: getPadding(left: 8),
                              child: Text(
                                'Personalised content',
                                style: TextStyle(
                                  color: isLight
                                      ? ColorConstant.black
                                      : ColorConstant.kEAF4F4,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: getPadding(left: 8),
                              child: Text(
                                'Collecion challenges',
                                style: TextStyle(
                                  color: isLight
                                      ? ColorConstant.black
                                      : ColorConstant.kEAF4F4,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: getPadding(left: 8),
                              child: Text(
                                'Unlimited boards',
                                style: TextStyle(
                                  color: isLight
                                      ? ColorConstant.black
                                      : ColorConstant.kEAF4F4,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: getPadding(left: 8),
                              child: Text(
                                'Streak repair',
                                style: TextStyle(
                                  color: isLight
                                      ? ColorConstant.black
                                      : ColorConstant.kEAF4F4,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        ImageConstant.premium1Year,
                        height: 184,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                CustomElevatedButton(
                  onTap: () async {
                    payment('119.99');
                  },
                  width: double.maxFinite,
                  height: getVerticalSize(48),
                  text: '\$119.99 / Year',
                  buttonStyle: CustomButtonStyles.fillTeal400,
                  buttonTextStyle:
                      CustomTextStyles.titleSmallPrimary_1.copyWith(
                    color: isLight ? ColorConstant.whiteA700 : null,
                  ),
                ),
                const SizedBox(height: 20),
                CustomElevatedButton(
                  onTap: () async {
                    payment('19.99');
                  },
                  width: double.maxFinite,
                  height: getVerticalSize(48),
                  text: '\$19.99 / Month',
                  buttonStyle: CustomButtonStyles.fillTeal400,
                  buttonTextStyle:
                      CustomTextStyles.titleSmallPrimary_1.copyWith(
                    color: isLight ? ColorConstant.whiteA700 : null,
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  'Package 2 Detail',
                  style: TextStyle(
                    color:
                        isLight ? ColorConstant.black : ColorConstant.kEAF4F4,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: getPadding(left: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'What you get',
                              style: TextStyle(
                                color: isLight
                                    ? ColorConstant.black
                                    : ColorConstant.kEAF4F4,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding: getPadding(left: 8),
                              child: Text(
                                'Unlimied Hacks',
                                style: TextStyle(
                                  color: isLight
                                      ? ColorConstant.black
                                      : ColorConstant.kEAF4F4,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: getPadding(left: 8),
                              child: Text(
                                'Personalised content',
                                style: TextStyle(
                                  color: isLight
                                      ? ColorConstant.black
                                      : ColorConstant.kEAF4F4,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: getPadding(left: 8),
                              child: Text(
                                'Collecion challenges',
                                style: TextStyle(
                                  color: isLight
                                      ? ColorConstant.black
                                      : ColorConstant.kEAF4F4,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: getPadding(left: 8),
                              child: Text(
                                'Unlimited boards',
                                style: TextStyle(
                                  color: isLight
                                      ? ColorConstant.black
                                      : ColorConstant.kEAF4F4,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: getPadding(left: 8),
                              child: Text(
                                'Streak repair',
                                style: TextStyle(
                                  color: isLight
                                      ? ColorConstant.black
                                      : ColorConstant.kEAF4F4,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        ImageConstant.premium1Month,
                        height: 184,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void payment(String price) async {
    NavigatorState navigatorState = Navigator.of(context);
    AppStorage appStorage = AppStorage();
    String userString = await appStorage.getUser();
    UserModel userModel = UserModel.fromJson(jsonDecode(userString));
    navigatorState.push(
      MaterialPageRoute(
        builder: (BuildContext context) => UsePaypal(
          sandboxMode: true,
          clientId:
              'AdhqFrRbpA6xim3nYJ-64bolDm1kJF42iAgLuUseMQAoEpfupVetVF0lgB7RGPiPobpqIkcLq5AZ9ohW',
          secretKey:
              'EEokQiuUtDJkFtr61O_BDjcxiwXnFb647sEVcqGZWOEu6i3dd8Qh1yVVdxzRLWbUADLVMawnRMLv8CVs',
          returnURL: 'https://samplesite.com/return',
          cancelURL: 'https://samplesite.com/cancel',
          transactions: [
            {
              'amount': {
                'total': price,
                'currency': 'USD',
                'details': {
                  'subtotal': price,
                  'shipping': '0',
                  'shipping_discount': 0,
                },
              },
              'description': 'The payment transaction description.',
              'item_list': {
                'shipping_address': {
                  'recipient_name': userModel.name,
                  'line1': 'Travis County',
                  'line2': '',
                  'city': 'Austin',
                  'country_code': 'US',
                  'postal_code': '73301',
                  'phone': userModel.contactNumber,
                  'state': 'Texas',
                },
              },
            }
          ],
          note: 'Contact us for any questions',
          onSuccess: (Map params) async {
            log('$params');
          },
          onError: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Error payment'),
                backgroundColor: appTheme.teal400,
              ),
            );
          },
          onCancel: (params) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Cancel payment'),
                backgroundColor: appTheme.teal400,
              ),
            );
          },
        ),
      ),
    );
  }
}
