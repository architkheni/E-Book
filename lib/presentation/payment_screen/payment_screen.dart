import 'package:flutter/material.dart';

import '../../core/utils/image_constant.dart';
import '../../widgets/custom_image_view.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => PaymentScreenState();
}

class PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
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
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: CustomImageView(
                          svgPath: ImageConstant.imgArrowleft,
                          height: 35,
                        )),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: CustomImageView(
                        imagePath: ImageConstant.payment,
                        height: 35,
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.center,
                    child: CustomImageView(
                      imagePath: ImageConstant.membership,
                      height: _height / 1.3,
                    )),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
