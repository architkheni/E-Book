import 'dart:convert';
import 'dart:developer';

import 'package:book/core/storage/app_storage.dart';
import 'package:book/model/member_ship_model.dart';
import 'package:book/model/packages_model.dart';
import 'package:book/repository/package_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class PackageProvider extends ChangeNotifier {
  int? packageId;
  String? packageType;
  bool isLoading = true;
  AppStorage appStorage = AppStorage();
  PackagesResponse packagesResponse = PackagesResponse();

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getPackagesDetails() async {
    String token = await appStorage.getToken();
    Either<String, PackagesResponse> result =
        await PackageRepositiry.instance.getPackageDetails(token: token);
    result.fold((l) {
      setLoading(false);
      log(l);
    }, (r) async {
      String? package = await appStorage.getPackage();
      if (package != null) {
        packageId = MembershipModel.fromJson(jsonDecode(package)).packageId;
        packageType = MembershipModel.fromJson(jsonDecode(package)).packageType;
      }
      packagesResponse = r;
      setLoading(false);
    });
  }
}
