import 'dart:convert';

class CategoryModel {
  int? categoryId;
  String? name;
  String? status;
  int? totalBook;

  CategoryModel({this.categoryId, this.name, this.status, this.totalBook});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    name = json['name'];
    status = json['status'];
    totalBook = json['total_book'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['name'] = name;
    data['status'] = status;
    data['total_book'] = totalBook;
    return data;
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
