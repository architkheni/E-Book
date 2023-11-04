import 'package:book/model/book_chapter_model.dart';
import 'package:book/presentation/detail_page_container_page/model/detail_model.dart';

class CacheStorage {
  static Map<int, DetailModel> bookRead = {};
  static Map<int, List<BookChapterModel>> bookChapters = {};
  static int count = 1;
}
