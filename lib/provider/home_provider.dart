import 'package:book/presentation/home/model/dashboard_model.dart';
import 'package:book/repository/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class HomePovider extends ChangeNotifier {
  bool isLoading = true;
  DashboardModel dashboardModel = DashboardModel();

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void getDashboardDetails() async {
    Either<String, DashboardModel> result =
        await HomeRepository.instance.getDashboardDetail();
    result.fold((l) {
      setLoading(false);
    }, (r) {
      dashboardModel = r;
      setLoading(false);
    });
  }
}
