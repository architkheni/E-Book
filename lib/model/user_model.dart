import 'dart:convert';

class UserModel {
  int? id;
  String? username;
  String? name;
  String? email;
  String? contactNumber;
  String? emailVerifiedAt;
  String? activationToken;
  String? userType;
  String? registrationId;
  String? deviceId;
  String? image;
  String? status;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? apiToken;

  UserModel({
    this.id,
    this.username,
    this.name,
    this.email,
    this.contactNumber,
    this.emailVerifiedAt,
    this.activationToken,
    this.userType,
    this.registrationId,
    this.deviceId,
    this.image,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.apiToken,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
    email = json['email'];
    contactNumber = json['contact_number'];
    emailVerifiedAt = json['email_verified_at'];
    activationToken = json['activation_token'];
    userType = json['user_type'];
    registrationId = json['registration_id'];
    deviceId = json['device_id'];
    image = json['image'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    apiToken = json['api_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['name'] = name;
    data['email'] = email;
    data['contact_number'] = contactNumber;
    data['email_verified_at'] = emailVerifiedAt;
    data['activation_token'] = activationToken;
    data['user_type'] = userType;
    data['registration_id'] = registrationId;
    data['device_id'] = deviceId;
    data['image'] = image;
    data['status'] = status;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['api_token'] = apiToken;
    return data;
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
