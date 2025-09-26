import 'package:bookmarker/main.dart';
import 'package:bookmarker/views/screens/edit_url_screen.dart';
import 'package:bookmarker/views/screens/webview_screenshot_page.dart';
import 'package:go_router/go_router.dart';
import 'package:bookmarker/views/screens/genre_edit_screen.dart';
import 'package:bookmarker/views/screens/home_screen.dart';
import 'package:bookmarker/views/screens/edit_domain_screen.dart';
import 'package:bookmarker/views/screens/about_app/about_app_screen.dart';
import 'package:bookmarker/views/screens/about_app/privacy_policy_screen.dart';
import 'package:bookmarker/views/screens/about_app/terms_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.home,
  navigatorKey: navigatorKey,
  routes: [
    GoRoute(
      name: 'home',
      path: AppRoutes.home,
      builder: (context, state) => const MyHomePage(title: 'Book Marker'),
    ),
    GoRoute(
      name: 'genreEdit',
      path: AppRoutes.genreEdit,
      builder: (context, state) => const GenreEditScreen(),
    ),
    GoRoute(
      name: 'editDomain',
      path: AppRoutes.editDomain,
      builder: (context, state) => const EditDomainScreen(),
    ),
    GoRoute(
      name: 'aboutApp',
      path: AppRoutes.aboutApp,
      builder: (context, state) => const AboutAppScreen(),
    ),
    GoRoute(
      name: 'privacyPolicy',
      path: AppRoutes.privacyPolicy,
      builder: (context, state) => const PrivacyPolicyScreen(),
    ),
    GoRoute(
      name: 'terms',
      path: AppRoutes.terms,
      builder: (context, state) => const TermsScreen(),
    ),
    GoRoute(
      name: 'editUrl',
      path: '${AppRoutes.editUrl}/:urlId',
      builder: (context, state) {
        final urlId=state.pathParameters['urlId']!;
        return EditUrlScreen(urlId: urlId);
      },
    ),
    GoRoute(
      name: 'webviewScreenshot',
      path: '/webview/:url',
      builder: (context, state) {
        final rawUrl=state.pathParameters['url']!;
        final decodedUrl = Uri.decodeComponent(rawUrl);
        return WebViewScreenshotPage(url: decodedUrl);
      },
    ),
  ],
);

class AppRoutes{
  static String get home => '/';
  static String get genreEdit => '/genreEdit';
  static String get editUrl => '/editUrl';
  static String get editDomain => '/editDomain';
  static String get aboutApp => '/aboutApp';
  static String get terms => '/terms';
  static String get privacyPolicy => '/privacyPolicy';
}