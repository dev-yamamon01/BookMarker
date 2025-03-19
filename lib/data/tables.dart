import 'package:drift/drift.dart';

@DataClassName('Domain')
class Domains extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get domainName => text().unique()();
}

@DataClassName('Subtitle')
class SubTitles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get subTitleName => text().unique()();
}

@DataClassName('Genre')
class Genres extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get genreName => text().unique()();
}

@DataClassName('Url')
class Urls extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get domainId => integer().references(Domains, #id)();
  TextColumn get directory => text()();
  TextColumn get title => text()();
  IntColumn get subTitleId => integer().references(SubTitles, #id)();
  IntColumn get genreId => integer().references(Genres, #id)();
  IntColumn get evaluation => integer()();
  IntColumn get numOfViews => integer()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get comment => text()();
  TextColumn get imageResDir => text()();
}