// ignore_for_file: public_member_api_docs, sort_constructors_first, sdk_version_since
import 'dart:convert';
import 'dart:developer';

import 'package:book/core/storage/app_storage.dart';
import 'package:book/core/utils/color_constant.dart';
import 'package:book/core/utils/size_utils.dart';
import 'package:book/model/packages_model.dart';
import 'package:book/model/user_model.dart';
import 'package:book/provider/package_provider.dart';
import 'package:book/provider/profile_provider.dart';
import 'package:book/repository/payment_repository.dart';
import 'package:book/theme/custom_button_style.dart';
import 'package:book/theme/custom_text_style.dart';
import 'package:book/theme/theme_helper.dart';
import 'package:book/widgets/app_bar/appbar_image.dart';
import 'package:book/widgets/app_bar/appbar_subtitle.dart';
import 'package:book/widgets/app_bar/custom_app_bar.dart';
import 'package:book/widgets/custom_elevated_button.dart';
import 'package:book/widgets/custom_text_form_field.dart';
import 'package:dartz/dartz.dart' as dz;
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../core/utils/image_constant.dart';

void showPaymentModemSheet({
  required String price,
  required BuildContext context,
  required PackageType packageType,
  required int packageId,
}) {
  bool isLight = Theme.of(context).brightness == Brightness.light;
  showModalBottomSheet(
    context: context,
    backgroundColor: isLight ? ColorConstant.whiteA700 : ColorConstant.k181919,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
    ),
    builder: (_) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          CustomElevatedButton(
            onTap: () {
              Navigator.pop(context);
              payment(
                price: price,
                context: context,
                packageType: packageType,
                packageId: packageId,
              );
            },
            width: double.maxFinite,
            height: getVerticalSize(
              48,
            ),
            text: 'Payment',
            margin: getMargin(
              top: 10,
              left: 20,
              right: 20,
              bottom: 10,
            ),
            buttonStyle: CustomButtonStyles.fillTeal400,
            buttonTextStyle: CustomTextStyles.titleSmallPrimary_1.copyWith(
              color: isLight ? ColorConstant.whiteA700 : null,
            ),
          ),
          CustomElevatedButton(
            onTap: () {
              Navigator.pop(context);
              showPromoCodeDialog(
                price: price,
                context: context,
                packageType: packageType,
                packageId: packageId,
              );
            },
            width: double.maxFinite,
            height: getVerticalSize(
              48,
            ),
            text: 'Use promocode',
            margin: getMargin(
              top: 0,
              left: 20,
              right: 20,
              bottom: 10,
            ),
            buttonStyle: CustomButtonStyles.fillTeal400,
            buttonTextStyle: CustomTextStyles.titleSmallPrimary_1.copyWith(
              color: isLight ? ColorConstant.whiteA700 : null,
            ),
          ),
          const SizedBox(height: 10),
        ],
      );
    },
  );
}

void showPromoCodeDialog({
  required String price,
  required BuildContext context,
  required PackageType packageType,
  required int packageId,
}) async {
  bool isLight = Theme.of(context).brightness == Brightness.light;
  showDialog(
    context: context,
    builder: (_) {
      TextEditingController controller = TextEditingController();
      return Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 16,
                right: 16,
              ),
              child: CustomTextFormField(
                controller: controller,
                margin: getMargin(
                  top: 1,
                ),
                contentPadding: getPadding(
                  left: 16,
                  top: 15,
                  right: 16,
                  bottom: 15,
                ),
                textStyle: CustomTextStyles.bodyMediumGray200.copyWith(
                  color: isLight ? ColorConstant.black : null,
                ),
                hintText: 'Enter promocode',
                hintStyle: CustomTextStyles.bodyMediumGray200,
                textInputType: TextInputType.name,
                filled: true,
                fillColor:
                    isLight ? ColorConstant.kF3F3F3 : appTheme.grayTextfiled,
              ),
            ),
            CustomElevatedButton(
              onTap: () async {
                String text = controller.text;
                if (text.trim().isNotEmpty) {
                  dz.Either<String, Map<String, dynamic>> result =
                      await PaymentRepository.instance
                          .applyPromocode(code: text);
                  result.fold((l) {
                    Navigator.pop(context);
                  }, (r) {
                    int minValue = r['min_cart_value'];
                    int value = r['value'];
                    int intPrice = int.parse(price);
                    if (intPrice > minValue) {
                      int totalPrice = intPrice - value;
                      Navigator.pop(context);
                      showTotalPaymentDialog(
                        context: context,
                        packageType: packageType,
                        packageId: packageId,
                        promocode: text,
                        totalPrice: intPrice,
                        discountPrice: value,
                        paymentPrice: totalPrice,
                      );
                    } else {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('Payment minimum value should be $minValue'),
                          backgroundColor: appTheme.teal400,
                        ),
                      );
                    }
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Enter valid code'),
                      backgroundColor: appTheme.teal400,
                    ),
                  );
                }
              },
              width: double.maxFinite,
              height: getVerticalSize(
                48,
              ),
              text: 'Apply Promocode',
              margin: getMargin(
                top: 0,
                left: 16,
                right: 16,
                bottom: 10,
              ),
              buttonStyle: CustomButtonStyles.fillTeal400,
              buttonTextStyle: CustomTextStyles.titleSmallPrimary_1.copyWith(
                color: isLight ? ColorConstant.whiteA700 : null,
              ),
            ),
          ],
        ),
      );
    },
  );
}

void showTotalPaymentDialog({
  required BuildContext context,
  required PackageType packageType,
  required int packageId,
  required String promocode,
  required int totalPrice,
  required int discountPrice,
  required int paymentPrice,
}) {
  bool isLight = Theme.of(context).brightness == Brightness.light;
  showDialog(
    context: context,
    builder: (_) {
      return Dialog(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Row(
                  children: [
                    const Expanded(child: Text('Total Price: ')),
                    Expanded(child: Text('\$${totalPrice.toString()}')),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  children: [
                    const Expanded(child: Text('Discount Price: ')),
                    Expanded(child: Text('\$${discountPrice.toString()}')),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 2, bottom: 10),
                child: Row(
                  children: [
                    const Expanded(child: Text('Payment Price: ')),
                    Expanded(child: Text('\$${paymentPrice.toString()}')),
                  ],
                ),
              ),
              CustomElevatedButton(
                onTap: () async {
                  payment(
                    price: paymentPrice.toString(),
                    context: context,
                    packageType: packageType,
                    packageId: packageId,
                  );
                },
                width: double.maxFinite,
                height: getVerticalSize(
                  48,
                ),
                text: 'Payment',
                buttonStyle: CustomButtonStyles.fillTeal400,
                buttonTextStyle: CustomTextStyles.titleSmallPrimary_1.copyWith(
                  color: isLight ? ColorConstant.whiteA700 : null,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => PaymentScreenState();
}

class PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    await context.read<PackageProvider>().getPackagesDetails();
    setState(() {});
  }

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
        body: Consumer<PackageProvider>(
          builder: (context, provider, child) {
            return Padding(
              padding: getPadding(left: 20, right: 15, top: 10),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(left: 5),
                      child: Text(
                        'Enjoy unlimited audiobooks and summaries',
                        style: TextStyle(
                          color: isLight
                              ? ColorConstant.black
                              : ColorConstant.kEAF4F4,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => PackageDetails(
                        packageData: provider.packagesResponse.data![index],
                        packageId: provider.packageId,
                        packageType: provider.packageType,
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                      itemCount: provider.packagesResponse.data?.length ?? 0,
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

enum PackageType { annual, monthly }

void payment({
  required String price,
  required BuildContext context,
  required PackageType packageType,
  required int packageId,
}) async {
  NavigatorState navigatorState = Navigator.of(context);
  AppStorage appStorage = AppStorage();
  String userString = await appStorage.getUser();
  UserModel userModel = UserModel.fromJson(jsonDecode(userString));
  navigatorState.push(
    MaterialPageRoute(
      builder: (_) => UsePaypal(
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
                'recipient_name': userModel.name ?? 'Enter Your name',
                'line1': 'Travis County',
                'line2': '',
                'city': 'Austin',
                'country_code': 'US',
                'postal_code': '73301',
                'phone': userModel.contactNumber ?? '1234567890',
                'state': 'Texas',
              },
            },
          }
        ],
        note: 'Contact us for any questions',
        onSuccess: (Map params) async {
          log('$params');
          try {
            String transactionId = params['paymentId'];
            String status = params['status'];
            String type = params['data']['payer']['payment_method'];
            context.read<ProfileProvider>().saveTransaction(
                  context,
                  transactionId: transactionId,
                  status: status,
                  type: type,
                  packageId: packageId,
                  packageType: packageType.name,
                );
          } catch (e) {
            log(e.toString());
          }
        },
        onError: (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Some error accured in the payment'),
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

class PackageDetails extends StatelessWidget {
  final PackageData packageData;
  final int? packageId;
  final String? packageType;
  const PackageDetails({
    Key? key,
    required this.packageData,
    this.packageId,
    this.packageType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          packageData.name,
          style: TextStyle(
            color: isLight ? ColorConstant.black : ColorConstant.kEAF4F4,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        Html(
          data: packageData.features,
          style: {
            '*': Style(
              color: isLight ? null : ColorConstant.whiteA700,
            ),
          },
        ),
        // Padding(
        //   padding: getPadding(left: 5),
        //   child: Row(
        //     children: [
        //       Expanded(
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           mainAxisAlignment: MainAxisAlignment.start,
        //           children: [
        //             SizedBox(
        //               height: 50,
        //               child: Text(
        //                 'What you get',
        //                 style: TextStyle(
        //                   color: isLight
        //                       ? ColorConstant.black
        //                       : ColorConstant.kEAF4F4,
        //                   fontSize: 20,
        //                   fontWeight: FontWeight.w700,
        //                 ),
        //               ),
        //             ),
        //             SizedBox(
        //               height: 30,
        //               child: Padding(
        //                 padding: getPadding(left: 8),
        //                 child: Text(
        //                   'Unlimied Summaries',
        //                   style: TextStyle(
        //                     color: isLight
        //                         ? ColorConstant.black
        //                         : ColorConstant.kEAF4F4,
        //                     fontSize: 18,
        //                   ),
        //                 ),
        //               ),
        //             ),
        //             SizedBox(
        //               height: 30,
        //               child: Padding(
        //                 padding: getPadding(left: 8),
        //                 child: Text(
        //                   'Unlimied Audiobooks',
        //                   style: TextStyle(
        //                     color: isLight
        //                         ? ColorConstant.black
        //                         : ColorConstant.kEAF4F4,
        //                     fontSize: 18,
        //                   ),
        //                 ),
        //               ),
        //             ),
        //             SizedBox(
        //               height: 30,
        //               child: Padding(
        //                 padding: getPadding(left: 8),
        //                 child: Text(
        //                   'Personalized content',
        //                   style: TextStyle(
        //                     color: isLight
        //                         ? ColorConstant.black
        //                         : ColorConstant.kEAF4F4,
        //                     fontSize: 18,
        //                   ),
        //                 ),
        //               ),
        //             ),
        //             SizedBox(
        //               height: 30,
        //               child: Padding(
        //                 padding: getPadding(left: 8),
        //                 child: Text(
        //                   '',
        //                   style: TextStyle(
        //                     color: isLight
        //                         ? ColorConstant.black
        //                         : ColorConstant.kEAF4F4,
        //                     fontSize: 18,
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       Container(
        //         height: 180,
        //         width: 90,
        //         decoration: BoxDecoration(
        //           color: ColorConstant.k2D3047,
        //           borderRadius: BorderRadius.circular(10),
        //           border: Border.all(color: ColorConstant.primaryColor),
        //         ),
        //         child: Column(
        //           children: [
        //             Container(
        //               height: 30,
        //               margin: const EdgeInsets.all(8),
        //               decoration: BoxDecoration(
        //                 color: ColorConstant.primaryColor,
        //                 borderRadius: BorderRadius.circular(4),
        //               ),
        //               alignment: Alignment.center,
        //               child: Text(
        //                 'Premium',
        //                 style: TextStyle(
        //                   color: ColorConstant.k2D3047,
        //                   fontSize: 12,
        //                   fontWeight: FontWeight.bold,
        //                 ),
        //               ),
        //             ),
        //             Container(
        //               height: 30,
        //               alignment: Alignment.center,
        //               child: Icon(
        //                 Icons.check,
        //                 color: ColorConstant.whiteA700,
        //                 size: 17,
        //               ),
        //             ),
        //             Container(
        //               height: 30,
        //               alignment: Alignment.center,
        //               child: Icon(
        //                 Icons.check,
        //                 color: ColorConstant.whiteA700,
        //                 size: 17,
        //               ),
        //             ),
        //             Container(
        //               height: 30,
        //               alignment: Alignment.center,
        //               child: Icon(
        //                 Icons.check,
        //                 color: ColorConstant.whiteA700,
        //                 size: 17,
        //               ),
        //             ),
        //             Container(
        //               height: 30,
        //               alignment: Alignment.center,
        //               child: Text(
        //                 '1/Year',
        //                 style: TextStyle(
        //                   fontSize: 12,
        //                   color: ColorConstant.whiteA700,
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),

        const SizedBox(height: 40),
        CustomElevatedButton(
          onTap: (packageData.id == packageId && packageType == 'annual')
              ? () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          const Text('You already subscribed this package'),
                      backgroundColor: appTheme.teal400,
                    ),
                  );
                }
              : () async {
                  //TODO: make annualy payment
                  showPaymentModemSheet(
                    context: context,
                    packageId: packageData.id,
                    packageType: PackageType.annual,
                    price: '${packageData.annualPrice}',
                  );
                },
          width: double.maxFinite,
          height: getVerticalSize(48),
          text: '\$${packageData.annualPrice} / Year',
          buttonStyle: CustomButtonStyles.fillTeal400,
          buttonTextStyle: CustomTextStyles.titleSmallPrimary_1.copyWith(
            color: isLight ? ColorConstant.whiteA700 : null,
          ),
        ),
        const SizedBox(height: 20),
        CustomElevatedButton(
          onTap: (packageData.id == packageId && packageType == 'monthly')
              ? () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          const Text('You already subscribed this package'),
                      backgroundColor: appTheme.teal400,
                    ),
                  );
                }
              : () async {
                  //TODO: make monthaly payment
                  showPaymentModemSheet(
                    context: context,
                    packageId: packageData.id,
                    packageType: PackageType.monthly,
                    price: '${packageData.monthlyPrice}',
                  );
                },
          width: double.maxFinite,
          height: getVerticalSize(48),
          text: '\$${packageData.monthlyPrice} / Month',
          buttonStyle: CustomButtonStyles.fillTeal400,
          buttonTextStyle: CustomTextStyles.titleSmallPrimary_1.copyWith(
            color: isLight ? ColorConstant.whiteA700 : null,
          ),
        ),
      ],
    );
  }
}
