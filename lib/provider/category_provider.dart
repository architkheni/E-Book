import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  var categoryId;
  var categoryName;

  void changeData(var id, var name) async {
    await Future.delayed(const Duration(milliseconds: 200));
    categoryId = id;
    categoryName = name;
    notifyListeners();
  }
}
