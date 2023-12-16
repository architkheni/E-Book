class AuthorModel {
  int? authorId;
  String? name;
  String? education;
  String? description;
  String? designation;
  String? mobileNo;
  String? emailId;
  String? address;
  String? image;
  String? status;

  AuthorModel({
    this.authorId,
    this.name,
    this.education,
    this.description,
    this.designation,
    this.mobileNo,
    this.emailId,
    this.address,
    this.image,
    this.status,
  });

  AuthorModel.fromJson(Map<String, dynamic> json) {
    authorId = json['author_id'];
    name = json['name'];
    education = json['education'];
    description = json['description'];
    designation = json['designation'];
    mobileNo = json['mobile_no'];
    emailId = json['email_id'];
    address = json['address'];
    image = json['image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['author_id'] = authorId;
    data['name'] = name;
    data['education'] = education;
    data['description'] = description;
    data['designation'] = designation;
    data['mobile_no'] = mobileNo;
    data['email_id'] = emailId;
    data['address'] = address;
    data['image'] = image;
    data['status'] = status;
    return data;
  }
}
