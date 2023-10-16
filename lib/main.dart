import 'package:book/ColorTheme/ColorTheme.dart';
import 'package:book/core/storage/app_storage.dart';
import 'package:book/provider/auth_provider.dart';
import 'package:book/provider/explore_provider.dart';
import 'package:book/provider/home_provider.dart';
import 'package:book/provider/profile_provider.dart';
import 'package:book/provider/wishlist_provider.dart';
import 'package:book/router/app_router.dart';
import 'package:book/router/app_routes.dart';
import 'package:book/theme/theme_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
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
    GoRouter goRouter = AppRouter.getRouter(
      initialLocation: isLogin ? AppRoutesPath.home : AppRoutesPath.logInEmail,
    );
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
          return MaterialApp.router(
            theme: MyThemes.lightTheme,
            themeMode: themeProvider.themeMode,
            darkTheme: MyThemes.darktheme,
            title: 'book',
            debugShowCheckedModeBanner: false,
            routerConfig: goRouter,
          );
        },
      ),
    );
  }
}
