import 'dart:developer';

import 'package:book/core/storage/app_storage.dart';
import 'package:book/model/packages_model.dart';
import 'package:book/repository/package_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class PackageProvider extends ChangeNotifier {
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
    }, (r) {
      packagesResponse = r;
      setLoading(false);
    });
  }
}
