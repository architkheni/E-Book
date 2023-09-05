import 'dart:convert';

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

  BookModel(
      {this.bookId,
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
      this.introduction});

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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['book_id'] = this.bookId;
    data['category_name'] = this.categoryName;
    data['subcategory_name'] = this.subcategoryName;
    data['author_name'] = this.authorName;
    data['name'] = this.name;
    data['title'] = this.title;
    data['topic_cover'] = this.topicCover;
    data['description'] = this.description;
    data['format'] = this.format;
    data['edition'] = this.edition;
    data['keywords'] = this.keywords;
    data['language'] = this.language;
    data['publisher'] = this.publisher;
    data['date_of_publication'] = this.dateOfPublication;
    data['front_cover'] = this.frontCover;
    data['file_path'] = this.filePath;
    data['file_sample_path'] = this.fileSamplePath;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['discounted_price'] = this.discountedPrice;
    data['is_wishlist'] = this.isWishlist;
    data['image'] = this.image;
    data['type'] = this.type;
    data['main_title'] = this.mainTitle;
    data['country_publisher'] = this.countryPublisher;
    data['year_published'] = this.yearPublished;
    data['decade_published'] = this.decadePublished;
    data['author2'] = this.author2;
    data['author3'] = this.author3;
    data['author4'] = this.author4;
    data['free_book'] = this.freeBook;
    data['summary'] = this.summary;
    data['profession'] = this.profession;
    data['target_audience'] = this.targetAudience;
    data['gender'] = this.gender;
    data['isbn10'] = this.isbn10;
    data['isbn13'] = this.isbn13;
    data['classification'] = this.classification;
    data['original_content_type'] = this.originalContentType;
    data['original_material_type'] = this.originalMaterialType;
    data['original_print_length'] = this.originalPrintLength;
    data['original_audiobook_length'] = this.originalAudiobookLength;
    data['introduction'] = this.introduction;
    return data;
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
