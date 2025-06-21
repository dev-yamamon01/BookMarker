import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bookmarker/data/services/database.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});