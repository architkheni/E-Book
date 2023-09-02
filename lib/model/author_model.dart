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

  AuthorModel(
      {this.authorId,
      this.name,
      this.education,
      this.description,
      this.designation,
      this.mobileNo,
      this.emailId,
      this.address,
      this.image,
      this.status});

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author_id'] = this.authorId;
    data['name'] = this.name;
    data['education'] = this.education;
    data['description'] = this.description;
    data['designation'] = this.designation;
    data['mobile_no'] = this.mobileNo;
    data['email_id'] = this.emailId;
    data['address'] = this.address;
    data['image'] = this.image;
    data['status'] = this.status;
    return data;
  }
}
