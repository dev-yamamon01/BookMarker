import 'package:bookmarker/data/database.dart';

class UrlsByGenreName {
  final String name;
  final List<Url> urls;

  UrlsByGenreName({required this.name, required this.urls});
}