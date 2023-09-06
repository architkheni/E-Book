import 'package:book/model/category_model.dart';
import 'package:book/repository/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class ExploreProvider extends ChangeNotifier {
  List<CategoryModel> categories = [];
  List<CategoryModel> subCategories = [];

  void getAllCategories() async {
    Either<String, List<CategoryModel>> result = await HomeRepository.instance
        .getAllCategories();
    result.fold((l) {}, (r) {
      categories = r;
      notifyListeners();
    });
    Either<String, List<CategoryModel>> resultSubCategories =
        await HomeRepository.instance
            .getSubCategories();
    resultSubCategories.fold((l) {}, (r) {
      subCategories = r;
      notifyListeners();
    });
  }
}
