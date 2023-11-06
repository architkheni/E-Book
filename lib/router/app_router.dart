import 'package:book/core/storage/cache_storage.dart';
import 'package:book/presentation/Profile_Screen/Contact_Us.dart';
import 'package:book/presentation/Profile_Screen/Profile_Screen.dart';
import 'package:book/presentation/Profile_Screen/editProfile.dart';
import 'package:book/presentation/book_read_screen/book_read_screen.dart';
import 'package:book/presentation/categories_screen/categories_screen.dart';
import 'package:book/presentation/change_password/change_password_screen.dart';
import 'package:book/presentation/custom_bottom_bar/custom_bottom_bar.dart';
import 'package:book/presentation/detail_page_container_page/detail_page_container_page.dart';
import 'package:book/presentation/explore_page/explore_page.dart';
import 'package:book/presentation/forgot_password_one_screen/forgot_password_one_screen.dart';
import 'package:book/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:book/presentation/home/home_screen_page.dart';
import 'package:book/presentation/home_recommended_for_you_see_all_screen/home_recommended_for_you_see_all_screen.dart';
import 'package:book/presentation/langugaes_screen/langugaes_screen.dart';
import 'package:book/presentation/log_in_email_screen/log_in_email_screen.dart';
import 'package:book/presentation/my_library_screen/my_library_screen.dart';
import 'package:book/presentation/payment_screen/payment_screen.dart';
import 'package:book/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:book/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

class AppRouter {
  static late GoRouter instance;

  static GoRouter getRouter({String initialLocation = AppRoutesPath.home}) {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: initialLocation,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: AppRoutesPath.logInEmail,
          name: AppRoutesName.logInEmail,
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) => const MaterialPage(
            child: LogInEmailScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutesPath.signUp,
          name: AppRoutesName.signUp,
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) => const MaterialPage(
            child: SignUpScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutesPath.forgotPassword,
          name: AppRoutesName.forgotPassword,
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) => MaterialPage(
            child: ForgotPasswordScreen(email: state.extra as String),
          ),
        ),
        GoRoute(
          path: AppRoutesPath.forgotPasswordOne,
          name: AppRoutesName.forgotPasswordOne,
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) => MaterialPage(
            child: ForgotPasswordOneScreen(email: state.extra as String),
          ),
        ),
        GoRoute(
          path: AppRoutesPath.category,
          name: AppRoutesName.category,
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) => MaterialPage(
            child: CategoriesScreen(goIsProfile: state.extra as bool?),
          ),
        ),
        GoRoute(
          path: AppRoutesPath.language,
          name: AppRoutesName.language,
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) {
            Map<String, dynamic>? data = state.extra as Map<String, dynamic>?;
            return MaterialPage(
              child: LangugaesScreen(
                goIsProfile: data?['goIsProfile'],
                start: data?['start'],
              ),
            );
          },
        ),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            CacheStorage.navigationShell = navigationShell;
            return BottombarPage(
              navigationShell: CacheStorage.navigationShell,
            );
          },
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutesPath.home,
                  name: AppRoutesName.home,
                  builder: (context, state) => const HomeScreenPage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutesPath.explore,
                  name: AppRoutesName.explore,
                  builder: (context, state) {
                    return const ExplorePage();
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutesPath.library,
                  name: AppRoutesName.library,
                  builder: (context, state) => const MyLibraryScreen(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutesPath.profile,
                  name: AppRoutesName.profile,
                  builder: (context, state) => const ProfileScreen(),
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: AppRoutesPath.bookDetail,
          name: AppRoutesName.bookDetail,
          builder: (context, state) {
            return DetailPageContainerPage(bookId: state.extra as int);
          },
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: AppRoutesPath.bookRead,
          name: AppRoutesName.bookRead,
          builder: (context, state) {
            return BookReadScreen(bookId: state.extra as int);
          },
        ),
        GoRoute(
          path: AppRoutesPath.viewAllBook,
          name: AppRoutesName.viewAllBook,
          builder: (context, state) {
            Map<String, dynamic> data = state.extra as Map<String, dynamic>;
            return HomeRecommendedForYouSeeAllScreen(
              title: data['title'] as String,
              param: data['param'] as String,
              jsonKey: data['jsonKey'],
            );
          },
        ),
        GoRoute(
          path: AppRoutesPath.contactUs,
          name: AppRoutesName.contactUs,
          builder: (context, state) {
            return const ContactUsScreen();
          },
        ),
        GoRoute(
          path: AppRoutesPath.editProfile,
          name: AppRoutesName.editProfile,
          builder: (context, state) {
            return const EditProfile();
          },
        ),
        GoRoute(
          path: AppRoutesPath.changePassword,
          name: AppRoutesName.changePassword,
          builder: (context, state) {
            return const ChangePasswordScreen();
          },
        ),
        GoRoute(
          path: AppRoutesPath.payment,
          name: AppRoutesName.payment,
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) => const MaterialPage(
            child: PaymentScreen(),
          ),
        ),
      ],
    );
  }
}
