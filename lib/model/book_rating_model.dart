class BookRatingModel {
  int? userId;
  int? ratingId;
  int? rating;
  String? review;
  String? createdAt;
  String? userName;
  String? profileImage;

  BookRatingModel(
      {this.userId,
      this.ratingId,
      this.rating,
      this.review,
      this.createdAt,
      this.userName,
      this.profileImage});

  BookRatingModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    ratingId = json['rating_id'];
    rating = json['rating'];
    review = json['review'];
    createdAt = json['created_at'];
    userName = json['user_name'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['rating_id'] = this.ratingId;
    data['rating'] = this.rating;
    data['review'] = this.review;
    data['created_at'] = this.createdAt;
    data['user_name'] = this.userName;
    data['profile_image'] = this.profileImage;
    return data;
  }
}
