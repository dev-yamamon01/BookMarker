import 'package:bookmarker/views/screens/edit_url_screen.dart';
import 'package:bookmarker/views/screens/webview_screenshot_page.dart';
import 'package:go_router/go_router.dart';
import 'package:bookmarker/views/screens/genre_edit_screen.dart';
import 'package:bookmarker/views/screens/home_screen.dart';
import 'dart:typed_data';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.home,
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
}