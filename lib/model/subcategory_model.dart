class SubcategoryModel {
  int? subcategoryId;
  String? icon;
  int? categoryId;
  String? name;
  String? status;

  SubcategoryModel({
    this.subcategoryId,
    this.icon,
    this.categoryId,
    this.name,
    this.status,
  });

  SubcategoryModel.fromJson(Map<String, dynamic> json) {
    subcategoryId = json['subcategory_id'];
    icon = json['icon'];
    categoryId = json['category_id'];
    name = json['name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subcategory_id'] = subcategoryId;
    data['icon'] = icon;
    data['category_id'] = categoryId;
    data['name'] = name;
    data['status'] = status;
    return data;
  }
}
