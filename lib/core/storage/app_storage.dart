import 'package:book/model/book_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
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

  void dispose() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', '');
    prefs.setString('user', '');
    prefs.setBool('isLogin', false);
  }
}
