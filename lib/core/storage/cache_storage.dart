import 'package:book/model/book_chapter_model.dart';
import 'package:book/presentation/detail_page_container_page/model/detail_model.dart';
import 'package:book/presentation/home/model/dashboard_model.dart';
import 'package:go_router/go_router.dart';

class CacheStorage {
  static Map<int, DetailModel> bookRead = {};
  static Map<int, List<BookChapterModel>> bookChapters = {};
  static int count = 1;
  static late bool isDark;
  static DashboardModel? dashboardModel;
  static late StatefulNavigationShell navigationShell;

  static void dispose() {
    bookRead = {};
    bookRead = {};
    bookChapters = {};
    count = 1;
    dashboardModel;
  }
}
