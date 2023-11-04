import 'dart:developer';

import 'package:book/model/book_model.dart';
import 'package:book/model/category_model.dart';
import 'package:book/model/subcategory_model.dart';
import 'package:book/repository/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class ExploreProvider extends ChangeNotifier {
  List<CategoryModel> categories = [];
  List<SubcategoryModel> subCategories = [];
  List<BookModel> books = [];
  bool isLoading = false;
  bool isSearch = false;

  void getAllCategories() async {
    Either<String, List<CategoryModel>> result =
        await HomeRepository.instance.getAllCategories();
    result.fold((l) {}, (r) {
      categories = r;
      notifyListeners();
    });
  }

  void getSubCategories(int categoryId) async {
    setLoading(true);
    Either<String, List<SubcategoryModel>> resultSubCategories =
        await HomeRepository.instance.getSubCategories(categoryId);
    resultSubCategories.fold((l) {
      log(l);
    }, (r) {
      subCategories = r;
      setLoading(false);
    });
  }

  void getSubcategoriesBooks(int subCategoryId) async {
    setLoading(true);
    Either<String, List<BookModel>> resultSubCategories =
        await HomeRepository.instance.getCategoryBooks(subCategoryId);
    resultSubCategories.fold((l) {
      log(l);
    }, (r) {
      books = r;
      setLoading(false);
    });
  }

  void searchBook(String search) async {
    setLoading(true);
    Either<String, List<BookModel>> resultSubCategories =
        await HomeRepository.instance.searchBook(search);
    resultSubCategories.fold((l) {
      log(l);
    }, (r) {
      books = r;
      setIsSearch(true);
      setLoading(false);
    });
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void setIsSearch(bool value) {
    isSearch = value;
    notifyListeners();
  }
}
