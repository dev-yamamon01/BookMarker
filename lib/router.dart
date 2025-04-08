import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bookmarker/main.dart';
import 'package:bookmarker/screens/genre_edit_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(title: 'Book Maker'),
    ),
    GoRoute(
      path: '/genreEdit',
      builder: (context, state) => const GenreEditScreen(),
    ),
  ],
);