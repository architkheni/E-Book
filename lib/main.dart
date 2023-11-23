import 'package:book/ColorTheme/ColorTheme.dart';
import 'package:book/core/storage/app_storage.dart';
import 'package:book/core/storage/cache_storage.dart';
import 'package:book/model/book_model.dart';
import 'package:book/presentation/langugaes_screen/provider/language_provider.dart';
import 'package:book/provider/auth_provider.dart';
import 'package:book/provider/category_provider.dart';
import 'package:book/provider/continue_reading_book_provider.dart';
import 'package:book/provider/explore_provider.dart';
import 'package:book/provider/home_provider.dart';
import 'package:book/provider/package_provider.dart';
import 'package:book/provider/profile_provider.dart';
import 'package:book/provider/wishlist_provider.dart';
import 'package:book/router/app_router.dart';
import 'package:book/router/app_routes.dart';
import 'package:book/theme/theme_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await GetStorage.init();
  bool isLogin = await AppStorage().getLogin();
  bool isDark = await AppStorage().getDarkMode();
  BookModel? book = AppStorage().getCurrentReadingBook();

  ThemeHelper().changeTheme('primary');
  AppRouter.instance = AppRouter.getRouter(
    initialLocation: isLogin ? AppRoutesPath.home : AppRoutesPath.logInEmail,
  );
  CacheStorage.isDark = isDark;
  runApp(MyApp(isDark: isDark, book: book));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  final BookModel? book;

  const MyApp({Key? key, required this.isDark, this.book}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ContinueReadingProvider()..setBook(book),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider()..toggleTheme(isDark),
        ),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => HomePovider()..getDashboardDetails()),
        ChangeNotifierProvider(
          create: (context) => ExploreProvider()..getAllCategories(),
        ),
        ChangeNotifierProvider(
          create: (context) => LanguageProvider()..getAllLanguage(),
        ),
        ChangeNotifierProvider(create: (context) => WishlistProvider()),
        ChangeNotifierProvider(create: (context) => PackageProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp.router(
            theme: MyThemes.lightTheme,
            themeMode: themeProvider.themeMode,
            darkTheme: MyThemes.darktheme,
            title: 'book',
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.instance,
          );
        },
      ),
    );
  }
}
