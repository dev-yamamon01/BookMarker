import 'package:go_router/go_router.dart';
import 'package:bookmarker/views/screens/genre_edit_screen.dart';
import 'package:bookmarker/views/screens/home_screen.dart';

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
  ],
);

class AppRoutes{
  static String get home => '/';
  static String get genreEdit => '/genreEdit';
}