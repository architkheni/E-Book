// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';

import 'package:book/core/app_export.dart';
import 'package:book/core/storage/app_storage.dart';
import 'package:book/core/utils/color_constant.dart';
import 'package:book/model/user_model.dart';
import 'package:book/provider/profile_provider.dart';
import 'package:book/router/app_routes.dart';
import 'package:book/widgets/app_bar/appbar_image.dart';
import 'package:book/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_text_form_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  File? file;
  String uploadImage = '';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isLight = Theme.of(context).brightness == Brightness.light;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: CustomAppBar(
          height: 60,
          leadingWidth: 35,
          leading: AppbarImage(
            height: 20,
            width: 15,
            svgPath: ImageConstant.imgArrowleftBlueGray50,
            margin: getMargin(left: 16, top: 17, bottom: 18),
            color: isLight ? ColorConstant.black : null,
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
                text: 'Profile Details',
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: SizedBox(
            height: height,
            width: width,
            // color: Colors.red,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: GestureDetector(
                      onTap: pickImage,
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            // color: Colors.red[300],
                            child: file == null
                                ? uploadImage.isEmpty
                                    ? CircleAvatar(
                                        backgroundColor: isLight
                                            ? ColorConstant.kF3F3F3
                                            : ColorConstant.k626666,
                                        child: Icon(
                                          Icons.person,
                                          size: 50,
                                          color: isLight
                                              ? ColorConstant.black
                                              : ColorConstant.whiteA700,
                                        ),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: CustomImageView(
                                          url: uploadImage,
                                          fit: BoxFit.fill,
                                        ),
                                      )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.file(
                                      file!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: ColorConstant.primaryColor,
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(6),
                              child: Icon(
                                Icons.upload_rounded,
                                color: isLight
                                    ? ColorConstant.whiteA700
                                    : ColorConstant.black,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Change Profile Picture',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.titleMediumWhiteA400,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 30),
                    child: Container(
                      height: 0.5,
                      color: appTheme.gray700,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Your Name',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.titleMediumWhiteA500.copyWith(
                        color: isLight ? ColorConstant.black : null,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 30),
                    child: CustomTextFormField(
                      controller: nameController,
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
                      hintText: 'Enter name',
                      hintStyle: CustomTextStyles.bodyMediumGray200,
                      textInputType: TextInputType.name,
                      filled: true,
                      fillColor: isLight
                          ? ColorConstant.kF3F3F3
                          : appTheme.grayTextfiled,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Enter username',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.titleMediumWhiteA500.copyWith(
                        color: isLight ? ColorConstant.black : null,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 30),
                    child: CustomTextFormField(
                      controller: usernameController,
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
                      hintText: 'Enter username',
                      hintStyle: CustomTextStyles.bodyMediumGray200,
                      textInputType: TextInputType.name,
                      filled: true,
                      fillColor: isLight
                          ? ColorConstant.kF3F3F3
                          : appTheme.grayTextfiled,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.titleMediumWhiteA500.copyWith(
                        color: isLight ? ColorConstant.black : null,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 30),
                    child: CustomTextFormField(
                      controller: emailController,
                      margin: getMargin(
                        top: 1,
                      ),
                      contentPadding: getPadding(
                        left: 16,
                        top: 15,
                        right: 16,
                        bottom: 15,
                      ),
                      enabled: false,
                      textStyle: CustomTextStyles.bodyMediumGray200.copyWith(
                        color: isLight ? ColorConstant.black : null,
                      ),
                      hintText: 'Enter email',
                      hintStyle: CustomTextStyles.bodyMediumGray200,
                      textInputType: TextInputType.emailAddress,
                      filled: true,
                      fillColor: isLight
                          ? ColorConstant.kF3F3F3
                          : appTheme.grayTextfiled,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Your contact number',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.titleMediumWhiteA500.copyWith(
                        color: isLight ? ColorConstant.black : null,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 30),
                    child: CustomTextFormField(
                      controller: contactNumberController,
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
                      hintText: 'Enter contact number',
                      hintStyle: CustomTextStyles.bodyMediumGray200,
                      textInputType: TextInputType.phone,
                      filled: true,
                      fillColor: isLight
                          ? ColorConstant.kF3F3F3
                          : appTheme.grayTextfiled,
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTap: () {
                        context.push(AppRoutesPath.changePassword);
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: double.maxFinite,
                        height: getVerticalSize(48),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorConstant.primaryColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'Change Password',
                            style:
                                CustomTextStyles.titleSmallPrimary_1.copyWith(
                              color: ColorConstant.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomElevatedButton(
                    onTap: () {
                      var name = validateName(nameController.text);
                      if (name == 'Name must be more than 2 charater') {
                        SnackBar snackBar = SnackBar(
                          content:
                              const Text('Name must be more than 2 charater'),
                          backgroundColor: appTheme.teal400,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        if (usernameController.text == '') {
                          SnackBar snackBar = SnackBar(
                            content: const Text('Enter User Name'),
                            backgroundColor: appTheme.teal400,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          var number =
                              validateMobile(contactNumberController.text);
                          if (number == 'Mobile Number must be of 7 digit') {
                            SnackBar snackBar = SnackBar(
                              content: const Text(
                                'Mobile Number must be of 7 digit',
                              ),
                              backgroundColor: appTheme.teal400,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            context.read<ProfileProvider>().saveUserDetails(
                                  context,
                                  name: nameController.text.trim(),
                                  username: usernameController.text.trim(),
                                  contactNumber:
                                      contactNumberController.text.trim(),
                                  path: file == null ? null : file!.path,
                                );
                          }
                        }
                      }
                    },
                    width: double.maxFinite,
                    height: getVerticalSize(48),
                    text: 'Save Details',
                    buttonStyle: CustomButtonStyles.fillTeal400,
                    buttonTextStyle:
                        CustomTextStyles.titleSmallPrimary_1.copyWith(
                      color: isLight ? ColorConstant.whiteA700 : null,
                    ),
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

  void getData() async {
    String user = await AppStorage().getUser();
    UserModel userModel = UserModel.fromJson(jsonDecode(user));
    nameController.text = userModel.name ?? '';
    usernameController.text = userModel.username ?? '';
    emailController.text = userModel.email ?? '';
    contactNumberController.text = userModel.contactNumber ?? '';
    uploadImage = userModel.image ?? '';
    setState(() {});
  }

  validateName(String value) {
    if (value.length < 3) {
      return 'Name must be more than 2 charater';
    } else {
      return null;
    }
  }

  validateMobile(String value) {
    if (value.length < 7) {
      return 'Mobile Number must be of 7 digit';
    } else {
      return null;
    }
  }

  void pickImage() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      CroppedFile? cropFile = await ImageCropper.platform.cropImage(
        sourcePath: image.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      );
      if (cropFile != null) {
        file = File(cropFile.path);
        setState(() {});
      }
    }
  }
}
