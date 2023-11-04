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

  String getTitle(Map<String, dynamic> json) {
    if (json['type'] != null) return json['type'];
    return json['title'];
  }

  int getId(Map<String, dynamic> json) {
    if (json['book_id'] != null) return json['book_id'];
    return json['id'];
  }

  String getDescription(Map<String, dynamic> json) {
    if (json['introduction'] != null) return json['introduction'];
    if (json['summary'] != null) return json['summary'];
    return json['description'];
  }

  BookChapterModel.fromJson(Map<String, dynamic> json) {
    id = getId(json);
    bookId = json['book_id'];
    title = getTitle(json);
    description = getDescription(json);
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
