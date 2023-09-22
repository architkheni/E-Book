import 'dart:convert';

import 'package:book/model/media_model.dart';

class BookModel {
  int? bookId;
  String? categoryName;
  String? subcategoryName;
  String? authorName;
  String? name;
  String? title;
  String? topicCover;
  String? description;
  String? format;
  String? edition;
  String? keywords;
  String? language;
  String? publisher;
  String? dateOfPublication;
  String? frontCover;
  String? filePath;
  String? fileSamplePath;
  int? price;
  int? discount;
  int? discountedPrice;
  int? isWishlist;
  String? image;
  String? type;
  String? mainTitle;
  String? countryPublisher;
  String? yearPublished;
  String? decadePublished;
  String? author2;
  String? author3;
  String? author4;
  int? freeBook;
  String? summary;
  String? profession;
  String? targetAudience;
  String? gender;
  String? isbn10;
  String? isbn13;
  String? classification;
  String? originalContentType;
  String? originalMaterialType;
  String? originalPrintLength;
  String? originalAudiobookLength;
  String? introduction;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  List<MediaModel>? media;

  BookModel({
    this.bookId,
    this.categoryName,
    this.subcategoryName,
    this.authorName,
    this.name,
    this.title,
    this.topicCover,
    this.description,
    this.format,
    this.edition,
    this.keywords,
    this.language,
    this.publisher,
    this.dateOfPublication,
    this.frontCover,
    this.filePath,
    this.fileSamplePath,
    this.price,
    this.discount,
    this.discountedPrice,
    this.isWishlist,
    this.image,
    this.type,
    this.mainTitle,
    this.countryPublisher,
    this.yearPublished,
    this.decadePublished,
    this.author2,
    this.author3,
    this.author4,
    this.freeBook,
    this.summary,
    this.profession,
    this.targetAudience,
    this.gender,
    this.isbn10,
    this.isbn13,
    this.classification,
    this.originalContentType,
    this.originalMaterialType,
    this.originalPrintLength,
    this.originalAudiobookLength,
    this.introduction,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.media,
  });

  BookModel.fromJson(Map<String, dynamic> json) {
    bookId = json['book_id'];
    categoryName = json['category_name'];
    subcategoryName = json['subcategory_name'];
    authorName = json['author_name'];
    name = json['name'];
    title = json['title'];
    topicCover = json['topic_cover'];
    description = json['description'];
    format = json['format'];
    edition = json['edition'];
    keywords = json['keywords'];
    language = json['language'];
    publisher = json['publisher'];
    dateOfPublication = json['date_of_publication'];
    frontCover = json['front_cover'];
    filePath = json['file_path'];
    fileSamplePath = json['file_sample_path'];
    price = json['price'];
    discount = json['discount'];
    discountedPrice = json['discounted_price'];
    isWishlist = json['is_wishlist'];
    image = json['image'];
    type = json['type'];
    mainTitle = json['main_title'];
    countryPublisher = json['country_publisher'];
    yearPublished = json['year_published'];
    decadePublished = json['decade_published'];
    author2 = json['author2'];
    author3 = json['author3'];
    author4 = json['author4'];
    freeBook = json['free_book'];
    summary = json['summary'];
    profession = json['profession'];
    targetAudience = json['target_audience'];
    gender = json['gender'];
    isbn10 = json['isbn10'];
    isbn13 = json['isbn13'];
    classification = json['classification'];
    originalContentType = json['original_content_type'];
    originalMaterialType = json['original_material_type'];
    originalPrintLength = json['original_print_length'];
    originalAudiobookLength = json['original_audiobook_length'];
    introduction = json['introduction'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['media'] != null) {
      media = <MediaModel>[];
      json['media'].forEach((v) {
        media!.add(MediaModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['book_id'] = bookId;
    data['category_name'] = categoryName;
    data['subcategory_name'] = subcategoryName;
    data['author_name'] = authorName;
    data['name'] = name;
    data['title'] = title;
    data['topic_cover'] = topicCover;
    data['description'] = description;
    data['format'] = format;
    data['edition'] = edition;
    data['keywords'] = keywords;
    data['language'] = language;
    data['publisher'] = publisher;
    data['date_of_publication'] = dateOfPublication;
    data['front_cover'] = frontCover;
    data['file_path'] = filePath;
    data['file_sample_path'] = fileSamplePath;
    data['price'] = price;
    data['discount'] = discount;
    data['discounted_price'] = discountedPrice;
    data['is_wishlist'] = isWishlist;
    data['image'] = image;
    data['type'] = type;
    data['main_title'] = mainTitle;
    data['country_publisher'] = countryPublisher;
    data['year_published'] = yearPublished;
    data['decade_published'] = decadePublished;
    data['author2'] = author2;
    data['author3'] = author3;
    data['author4'] = author4;
    data['free_book'] = freeBook;
    data['summary'] = summary;
    data['profession'] = profession;
    data['target_audience'] = targetAudience;
    data['gender'] = gender;
    data['isbn10'] = isbn10;
    data['isbn13'] = isbn13;
    data['classification'] = classification;
    data['original_content_type'] = originalContentType;
    data['original_material_type'] = originalMaterialType;
    data['original_print_length'] = originalPrintLength;
    data['original_audiobook_length'] = originalAudiobookLength;
    data['introduction'] = introduction;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (media != null) {
      data['media'] = media!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
