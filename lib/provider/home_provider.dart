import 'dart:developer';

import 'package:book/core/storage/app_storage.dart';
import 'package:book/presentation/home/model/dashboard_model.dart';
import 'package:book/repository/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class HomePovider extends ChangeNotifier {
  bool isLoading = true;
  AppStorage appStorage = AppStorage();
  DashboardModel dashboardModel = DashboardModel();

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void getDashboardDetails() async {
    String token = await appStorage.getToken();
    Either<String, DashboardModel> result =
        await HomeRepository.instance.getDashboardDetail(token: token);
    result.fold((l) {
      setLoading(false);
      log(l);
    }, (r) {
      dashboardModel = r;
      setLoading(false);
    });
  }
}
