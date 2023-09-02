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

  UserModel(
      {this.id,
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
      this.apiToken});

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['name'] = this.name;
    data['email'] = this.email;
    data['contact_number'] = this.contactNumber;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['activation_token'] = this.activationToken;
    data['user_type'] = this.userType;
    data['registration_id'] = this.registrationId;
    data['device_id'] = this.deviceId;
    data['image'] = this.image;
    data['status'] = this.status;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['api_token'] = this.apiToken;
    return data;
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
