import 'dart:convert';

import 'package:book/core/storage/cache_storage.dart';
import 'package:book/model/book_model.dart';
import 'package:book/provider/continue_reading_book_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  static int? purchasePackageId;
  static String? purchasePackageType;
  
  void setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  Future<void> setUser(String user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', user);
  }

  Future<String> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user') ?? '';
  }

  Future<void> setPackage(String package) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('package', package);
  }

  Future<String?> getPackage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('package');
  }

  void setLogin(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin', value);
  }

  Future<bool> getLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLogin') ?? false;
  }

  void setDarkMode(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', value);
  }

  Future<bool> getDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isDark') ?? false;
  }

  void setCategoryIsFirst(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFirstTime', value);
  }

  Future<bool> getCategoryIsFirst() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isFirstTime') ?? true;
  }

  void setCurrentReadingBook(BookModel? book) {
    GetStorage getStorage = GetStorage();
    getStorage.write('book', book);
  }

  BookModel? getCurrentReadingBook() {
    GetStorage getStorage = GetStorage();
    final json = getStorage.read('book');
    if (json == null) {
      return null;
    }
    return BookModel.fromJson(json);
  }

  void saveCurrentChapterPosition(int book, int position) async {
    GetStorage getStorage = GetStorage();
    String? data = getStorage.read<String>('chapter-position');
    data ??= '{}';
    dynamic savedata = jsonDecode(data);
    savedata[book.toString()] = position;
    await getStorage.write('chapter-position', jsonEncode(savedata));
    data = getStorage.read<String>('chapter-position');
  }

  int getCurrentChapterPosition(int book) {
    GetStorage getStorage = GetStorage();
    String? data = getStorage.read<String>('chapter-position');
    return data == null ? 0 : jsonDecode(data)[book.toString()] ?? 0;
  }

  bool isReadChapterBookContain(int book) {
    GetStorage getStorage = GetStorage();
    String? data = getStorage.read<String>('chapter-position');
    return data == null
        ? false
        : jsonDecode(data)[book.toString()] == null
            ? false
            : true;
  }

  void dispose(BuildContext context) async {
    context.read<ContinueReadingProvider>().setBook(null);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    prefs.remove('user');
    prefs.setBool('isLogin', false);
    GetStorage getStorage = GetStorage();
    getStorage.remove('chapter-position');
    getStorage.remove('book');
    CacheStorage.dispose();
  }
}
