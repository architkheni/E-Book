import 'dart:developer';

import 'package:book/ColorTheme/ColorTheme.dart';
import 'package:book/core/storage/app_storage.dart';
import 'package:book/provider/auth_provider.dart';
import 'package:book/provider/explore_provider.dart';
import 'package:book/provider/home_provider.dart';
import 'package:book/provider/profile_provider.dart';
import 'package:book/provider/wishlist_provider.dart';
import 'package:book/routes/app_routes.dart';
import 'package:book/theme/theme_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  bool isLogin = await AppStorage().getLogin();
  bool isDark = await AppStorage().getDarkMode();

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(
    MyApp(
      isLogin: isLogin,
      isDark: isDark,
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLogin;
  final bool isDark;

  const MyApp({Key? key, required this.isLogin, required this.isDark})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider()..toggleTheme(isDark),
        ),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => HomePovider()),
        ChangeNotifierProvider(create: (context) => ExploreProvider()),
        ChangeNotifierProvider(create: (context) => WishlistProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            theme: MyThemes.lightTheme,
            themeMode: themeProvider.themeMode,
            // themeMode: ThemeMode.light,
            darkTheme: MyThemes.darktheme,
            title: 'book',
            debugShowCheckedModeBanner: false,
            initialRoute:
                isLogin ? AppRoutes.bottomPage : AppRoutes.logInEmailScreen,
            routes: AppRoutes.routes,
          );
        },
      ),
    );
  }
}
