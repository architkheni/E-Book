import 'dart:convert';

class MembershipModel {
  int? transactionId;
  int? userId;
  String? datetime;
  int? discount;
  int? totalAmount;
  String? paymentType;
  String? txnId;
  int? packageId;
  String? packageName;
  String? packageType;
  String? promocode;
  String? promocodeApplied;
  String? paymentStatus;
  String? otherTransactionDetail;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  MembershipModel({
    this.transactionId,
    this.userId,
    this.datetime,
    this.discount,
    this.totalAmount,
    this.paymentType,
    this.txnId,
    this.packageId,
    this.packageName,
    this.packageType,
    this.promocode,
    this.promocodeApplied,
    this.paymentStatus,
    this.otherTransactionDetail,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  MembershipModel.fromJson(Map<String, dynamic> json) {
    transactionId = json['transaction_id'];
    userId = json['user_id'];
    datetime = json['datetime'];
    discount = json['discount'];
    totalAmount = json['total_amount'];
    paymentType = json['payment_type'];
    txnId = json['txn_id'];
    packageId = json['package_id'];
    packageName = json['package_name'];
    packageType = json['package_type'];
    promocode = json['promocode'];
    promocodeApplied = json['promocode_applied'];
    paymentStatus = json['payment_status'];
    otherTransactionDetail = json['other_transaction_detail'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transaction_id'] = transactionId;
    data['user_id'] = userId;
    data['datetime'] = datetime;
    data['discount'] = discount;
    data['total_amount'] = totalAmount;
    data['payment_type'] = paymentType;
    data['txn_id'] = txnId;
    data['package_id'] = packageId;
    data['package_name'] = packageName;
    data['package_type'] = packageType;
    data['promocode'] = promocode;
    data['promocode_applied'] = promocodeApplied;
    data['payment_status'] = paymentStatus;
    data['other_transaction_detail'] = otherTransactionDetail;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
