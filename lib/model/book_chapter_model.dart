class BookChapterModel {
  int? id;
  int? bookId;
  String? title;
  String? description;
  List<dynamic>? readBy;
  String? createdAt;
  String? updatedAt;

  BookChapterModel({
    this.id,
    this.bookId,
    this.title,
    this.description,
    this.readBy,
    this.createdAt,
    this.updatedAt,
  });

  BookChapterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookId = json['book_id'];
    title = json['title'];
    description = json['description'];
    readBy = json['read_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['book_id'] = bookId;
    data['title'] = title;
    data['description'] = description;
    data['read_by'] = readBy as List<dynamic>;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
