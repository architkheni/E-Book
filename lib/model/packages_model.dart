import 'dart:convert';

class PackagesResponse {
  List<PackageData>? data;

  PackagesResponse({
    this.data,
  });

  factory PackagesResponse.fromJson(Map<String, dynamic> json) =>
      PackagesResponse(
        data: json['data'] == null
            ? null
            : List<PackageData>.from(
                json['data'].map((x) => PackageData.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
        'data': data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class PackageData {
  int id;
  String name;
  String bookType;
  int monthlyPrice;
  int annualPrice;
  String features;

  PackageData({
    required this.id,
    required this.name,
    required this.bookType,
    required this.monthlyPrice,
    required this.annualPrice,
    required this.features,
  });

  factory PackageData.fromJson(Map<String, dynamic> json) => PackageData(
        id: json['id'],
        name: json['name'],
        bookType: json['book_type'],
        monthlyPrice: json['monthly_price'],
        annualPrice: json['annual_price'],
        features: json['features'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'book_type': bookType,
        'monthly_price': monthlyPrice,
        'annual_price': annualPrice,
        'features': features,
      };

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
