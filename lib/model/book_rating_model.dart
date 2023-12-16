class BookRatingModel {
  int? userId;
  int? ratingId;
  int? rating;
  String? review;
  String? createdAt;
  String? userName;
  String? profileImage;

  BookRatingModel({
    this.userId,
    this.ratingId,
    this.rating,
    this.review,
    this.createdAt,
    this.userName,
    this.profileImage,
  });

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['rating_id'] = ratingId;
    data['rating'] = rating;
    data['review'] = review;
    data['created_at'] = createdAt;
    data['user_name'] = userName;
    data['profile_image'] = profileImage;
    return data;
  }
}
