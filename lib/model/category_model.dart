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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['status'] = this.status;
    data['total_book'] = this.totalBook;
    return data;
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
