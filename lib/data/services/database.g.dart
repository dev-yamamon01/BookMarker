// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $DomainsTable extends Domains with TableInfo<$DomainsTable, Domain> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DomainsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _domainNameMeta =
      const VerificationMeta('domainName');
  @override
  late final GeneratedColumn<String> domainName = GeneratedColumn<String>(
      'domain_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  @override
  List<GeneratedColumn> get $columns => [id, domainName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'domains';
  @override
  VerificationContext validateIntegrity(Insertable<Domain> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('domain_name')) {
      context.handle(
          _domainNameMeta,
          domainName.isAcceptableOrUnknown(
              data['domain_name']!, _domainNameMeta));
    } else if (isInserting) {
      context.missing(_domainNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Domain map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Domain(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      domainName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}domain_name'])!,
    );
  }

  @override
  $DomainsTable createAlias(String alias) {
    return $DomainsTable(attachedDatabase, alias);
  }
}

class Domain extends DataClass implements Insertable<Domain> {
  final int id;
  final String domainName;
  const Domain({required this.id, required this.domainName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['domain_name'] = Variable<String>(domainName);
    return map;
  }

  DomainsCompanion toCompanion(bool nullToAbsent) {
    return DomainsCompanion(
      id: Value(id),
      domainName: Value(domainName),
    );
  }

  factory Domain.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Domain(
      id: serializer.fromJson<int>(json['id']),
      domainName: serializer.fromJson<String>(json['domainName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'domainName': serializer.toJson<String>(domainName),
    };
  }

  Domain copyWith({int? id, String? domainName}) => Domain(
        id: id ?? this.id,
        domainName: domainName ?? this.domainName,
      );
  Domain copyWithCompanion(DomainsCompanion data) {
    return Domain(
      id: data.id.present ? data.id.value : this.id,
      domainName:
          data.domainName.present ? data.domainName.value : this.domainName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Domain(')
          ..write('id: $id, ')
          ..write('domainName: $domainName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, domainName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Domain &&
          other.id == this.id &&
          other.domainName == this.domainName);
}

class DomainsCompanion extends UpdateCompanion<Domain> {
  final Value<int> id;
  final Value<String> domainName;
  const DomainsCompanion({
    this.id = const Value.absent(),
    this.domainName = const Value.absent(),
  });
  DomainsCompanion.insert({
    this.id = const Value.absent(),
    required String domainName,
  }) : domainName = Value(domainName);
  static Insertable<Domain> custom({
    Expression<int>? id,
    Expression<String>? domainName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (domainName != null) 'domain_name': domainName,
    });
  }

  DomainsCompanion copyWith({Value<int>? id, Value<String>? domainName}) {
    return DomainsCompanion(
      id: id ?? this.id,
      domainName: domainName ?? this.domainName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (domainName.present) {
      map['domain_name'] = Variable<String>(domainName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DomainsCompanion(')
          ..write('id: $id, ')
          ..write('domainName: $domainName')
          ..write(')'))
        .toString();
  }
}

class $SubTitlesTable extends SubTitles
    with TableInfo<$SubTitlesTable, Subtitle> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubTitlesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _subTitleNameMeta =
      const VerificationMeta('subTitleName');
  @override
  late final GeneratedColumn<String> subTitleName = GeneratedColumn<String>(
      'sub_title_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  @override
  List<GeneratedColumn> get $columns => [id, subTitleName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sub_titles';
  @override
  VerificationContext validateIntegrity(Insertable<Subtitle> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sub_title_name')) {
      context.handle(
          _subTitleNameMeta,
          subTitleName.isAcceptableOrUnknown(
              data['sub_title_name']!, _subTitleNameMeta));
    } else if (isInserting) {
      context.missing(_subTitleNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Subtitle map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Subtitle(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      subTitleName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sub_title_name'])!,
    );
  }

  @override
  $SubTitlesTable createAlias(String alias) {
    return $SubTitlesTable(attachedDatabase, alias);
  }
}

class Subtitle extends DataClass implements Insertable<Subtitle> {
  final int id;
  final String subTitleName;
  const Subtitle({required this.id, required this.subTitleName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sub_title_name'] = Variable<String>(subTitleName);
    return map;
  }

  SubTitlesCompanion toCompanion(bool nullToAbsent) {
    return SubTitlesCompanion(
      id: Value(id),
      subTitleName: Value(subTitleName),
    );
  }

  factory Subtitle.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Subtitle(
      id: serializer.fromJson<int>(json['id']),
      subTitleName: serializer.fromJson<String>(json['subTitleName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'subTitleName': serializer.toJson<String>(subTitleName),
    };
  }

  Subtitle copyWith({int? id, String? subTitleName}) => Subtitle(
        id: id ?? this.id,
        subTitleName: subTitleName ?? this.subTitleName,
      );
  Subtitle copyWithCompanion(SubTitlesCompanion data) {
    return Subtitle(
      id: data.id.present ? data.id.value : this.id,
      subTitleName: data.subTitleName.present
          ? data.subTitleName.value
          : this.subTitleName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Subtitle(')
          ..write('id: $id, ')
          ..write('subTitleName: $subTitleName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, subTitleName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Subtitle &&
          other.id == this.id &&
          other.subTitleName == this.subTitleName);
}

class SubTitlesCompanion extends UpdateCompanion<Subtitle> {
  final Value<int> id;
  final Value<String> subTitleName;
  const SubTitlesCompanion({
    this.id = const Value.absent(),
    this.subTitleName = const Value.absent(),
  });
  SubTitlesCompanion.insert({
    this.id = const Value.absent(),
    required String subTitleName,
  }) : subTitleName = Value(subTitleName);
  static Insertable<Subtitle> custom({
    Expression<int>? id,
    Expression<String>? subTitleName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subTitleName != null) 'sub_title_name': subTitleName,
    });
  }

  SubTitlesCompanion copyWith({Value<int>? id, Value<String>? subTitleName}) {
    return SubTitlesCompanion(
      id: id ?? this.id,
      subTitleName: subTitleName ?? this.subTitleName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (subTitleName.present) {
      map['sub_title_name'] = Variable<String>(subTitleName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubTitlesCompanion(')
          ..write('id: $id, ')
          ..write('subTitleName: $subTitleName')
          ..write(')'))
        .toString();
  }
}

class $GenresTable extends Genres with TableInfo<$GenresTable, Genre> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GenresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _genreNameMeta =
      const VerificationMeta('genreName');
  @override
  late final GeneratedColumn<String> genreName = GeneratedColumn<String>(
      'genre_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  @override
  List<GeneratedColumn> get $columns => [id, genreName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'genres';
  @override
  VerificationContext validateIntegrity(Insertable<Genre> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('genre_name')) {
      context.handle(_genreNameMeta,
          genreName.isAcceptableOrUnknown(data['genre_name']!, _genreNameMeta));
    } else if (isInserting) {
      context.missing(_genreNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Genre map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Genre(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      genreName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}genre_name'])!,
    );
  }

  @override
  $GenresTable createAlias(String alias) {
    return $GenresTable(attachedDatabase, alias);
  }
}

class Genre extends DataClass implements Insertable<Genre> {
  final int id;
  final String genreName;
  const Genre({required this.id, required this.genreName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['genre_name'] = Variable<String>(genreName);
    return map;
  }

  GenresCompanion toCompanion(bool nullToAbsent) {
    return GenresCompanion(
      id: Value(id),
      genreName: Value(genreName),
    );
  }

  factory Genre.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Genre(
      id: serializer.fromJson<int>(json['id']),
      genreName: serializer.fromJson<String>(json['genreName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'genreName': serializer.toJson<String>(genreName),
    };
  }

  Genre copyWith({int? id, String? genreName}) => Genre(
        id: id ?? this.id,
        genreName: genreName ?? this.genreName,
      );
  Genre copyWithCompanion(GenresCompanion data) {
    return Genre(
      id: data.id.present ? data.id.value : this.id,
      genreName: data.genreName.present ? data.genreName.value : this.genreName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Genre(')
          ..write('id: $id, ')
          ..write('genreName: $genreName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, genreName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Genre &&
          other.id == this.id &&
          other.genreName == this.genreName);
}

class GenresCompanion extends UpdateCompanion<Genre> {
  final Value<int> id;
  final Value<String> genreName;
  const GenresCompanion({
    this.id = const Value.absent(),
    this.genreName = const Value.absent(),
  });
  GenresCompanion.insert({
    this.id = const Value.absent(),
    required String genreName,
  }) : genreName = Value(genreName);
  static Insertable<Genre> custom({
    Expression<int>? id,
    Expression<String>? genreName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (genreName != null) 'genre_name': genreName,
    });
  }

  GenresCompanion copyWith({Value<int>? id, Value<String>? genreName}) {
    return GenresCompanion(
      id: id ?? this.id,
      genreName: genreName ?? this.genreName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (genreName.present) {
      map['genre_name'] = Variable<String>(genreName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GenresCompanion(')
          ..write('id: $id, ')
          ..write('genreName: $genreName')
          ..write(')'))
        .toString();
  }
}

class $UrlsTable extends Urls with TableInfo<$UrlsTable, Url> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UrlsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _domainIdMeta =
      const VerificationMeta('domainId');
  @override
  late final GeneratedColumn<int> domainId = GeneratedColumn<int>(
      'domain_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES domains (id)'));
  static const VerificationMeta _directoryMeta =
      const VerificationMeta('directory');
  @override
  late final GeneratedColumn<String> directory = GeneratedColumn<String>(
      'directory', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subTitleIdMeta =
      const VerificationMeta('subTitleId');
  @override
  late final GeneratedColumn<int> subTitleId = GeneratedColumn<int>(
      'sub_title_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES sub_titles (id)'));
  static const VerificationMeta _genreIdMeta =
      const VerificationMeta('genreId');
  @override
  late final GeneratedColumn<int> genreId = GeneratedColumn<int>(
      'genre_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES genres (id)'));
  static const VerificationMeta _evaluationMeta =
      const VerificationMeta('evaluation');
  @override
  late final GeneratedColumn<int> evaluation = GeneratedColumn<int>(
      'evaluation', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _numOfViewsMeta =
      const VerificationMeta('numOfViews');
  @override
  late final GeneratedColumn<int> numOfViews = GeneratedColumn<int>(
      'num_of_views', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _commentMeta =
      const VerificationMeta('comment');
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
      'comment', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageResDirMeta =
      const VerificationMeta('imageResDir');
  @override
  late final GeneratedColumn<String> imageResDir = GeneratedColumn<String>(
      'image_res_dir', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        domainId,
        directory,
        title,
        subTitleId,
        genreId,
        evaluation,
        numOfViews,
        createdAt,
        comment,
        imageResDir
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'urls';
  @override
  VerificationContext validateIntegrity(Insertable<Url> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('domain_id')) {
      context.handle(_domainIdMeta,
          domainId.isAcceptableOrUnknown(data['domain_id']!, _domainIdMeta));
    } else if (isInserting) {
      context.missing(_domainIdMeta);
    }
    if (data.containsKey('directory')) {
      context.handle(_directoryMeta,
          directory.isAcceptableOrUnknown(data['directory']!, _directoryMeta));
    } else if (isInserting) {
      context.missing(_directoryMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('sub_title_id')) {
      context.handle(
          _subTitleIdMeta,
          subTitleId.isAcceptableOrUnknown(
              data['sub_title_id']!, _subTitleIdMeta));
    } else if (isInserting) {
      context.missing(_subTitleIdMeta);
    }
    if (data.containsKey('genre_id')) {
      context.handle(_genreIdMeta,
          genreId.isAcceptableOrUnknown(data['genre_id']!, _genreIdMeta));
    } else if (isInserting) {
      context.missing(_genreIdMeta);
    }
    if (data.containsKey('evaluation')) {
      context.handle(
          _evaluationMeta,
          evaluation.isAcceptableOrUnknown(
              data['evaluation']!, _evaluationMeta));
    } else if (isInserting) {
      context.missing(_evaluationMeta);
    }
    if (data.containsKey('num_of_views')) {
      context.handle(
          _numOfViewsMeta,
          numOfViews.isAcceptableOrUnknown(
              data['num_of_views']!, _numOfViewsMeta));
    } else if (isInserting) {
      context.missing(_numOfViewsMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    } else if (isInserting) {
      context.missing(_commentMeta);
    }
    if (data.containsKey('image_res_dir')) {
      context.handle(
          _imageResDirMeta,
          imageResDir.isAcceptableOrUnknown(
              data['image_res_dir']!, _imageResDirMeta));
    } else if (isInserting) {
      context.missing(_imageResDirMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Url map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Url(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      domainId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}domain_id'])!,
      directory: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}directory'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      subTitleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sub_title_id'])!,
      genreId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}genre_id'])!,
      evaluation: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}evaluation'])!,
      numOfViews: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}num_of_views'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      comment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}comment'])!,
      imageResDir: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_res_dir'])!,
    );
  }

  @override
  $UrlsTable createAlias(String alias) {
    return $UrlsTable(attachedDatabase, alias);
  }
}

class Url extends DataClass implements Insertable<Url> {
  final int id;
  final int domainId;
  final String directory;
  final String title;
  final int subTitleId;
  final int genreId;
  final int evaluation;
  final int numOfViews;
  final DateTime createdAt;
  final String comment;
  final String imageResDir;
  const Url(
      {required this.id,
      required this.domainId,
      required this.directory,
      required this.title,
      required this.subTitleId,
      required this.genreId,
      required this.evaluation,
      required this.numOfViews,
      required this.createdAt,
      required this.comment,
      required this.imageResDir});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['domain_id'] = Variable<int>(domainId);
    map['directory'] = Variable<String>(directory);
    map['title'] = Variable<String>(title);
    map['sub_title_id'] = Variable<int>(subTitleId);
    map['genre_id'] = Variable<int>(genreId);
    map['evaluation'] = Variable<int>(evaluation);
    map['num_of_views'] = Variable<int>(numOfViews);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['comment'] = Variable<String>(comment);
    map['image_res_dir'] = Variable<String>(imageResDir);
    return map;
  }

  UrlsCompanion toCompanion(bool nullToAbsent) {
    return UrlsCompanion(
      id: Value(id),
      domainId: Value(domainId),
      directory: Value(directory),
      title: Value(title),
      subTitleId: Value(subTitleId),
      genreId: Value(genreId),
      evaluation: Value(evaluation),
      numOfViews: Value(numOfViews),
      createdAt: Value(createdAt),
      comment: Value(comment),
      imageResDir: Value(imageResDir),
    );
  }

  factory Url.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Url(
      id: serializer.fromJson<int>(json['id']),
      domainId: serializer.fromJson<int>(json['domainId']),
      directory: serializer.fromJson<String>(json['directory']),
      title: serializer.fromJson<String>(json['title']),
      subTitleId: serializer.fromJson<int>(json['subTitleId']),
      genreId: serializer.fromJson<int>(json['genreId']),
      evaluation: serializer.fromJson<int>(json['evaluation']),
      numOfViews: serializer.fromJson<int>(json['numOfViews']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      comment: serializer.fromJson<String>(json['comment']),
      imageResDir: serializer.fromJson<String>(json['imageResDir']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'domainId': serializer.toJson<int>(domainId),
      'directory': serializer.toJson<String>(directory),
      'title': serializer.toJson<String>(title),
      'subTitleId': serializer.toJson<int>(subTitleId),
      'genreId': serializer.toJson<int>(genreId),
      'evaluation': serializer.toJson<int>(evaluation),
      'numOfViews': serializer.toJson<int>(numOfViews),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'comment': serializer.toJson<String>(comment),
      'imageResDir': serializer.toJson<String>(imageResDir),
    };
  }

  Url copyWith(
          {int? id,
          int? domainId,
          String? directory,
          String? title,
          int? subTitleId,
          int? genreId,
          int? evaluation,
          int? numOfViews,
          DateTime? createdAt,
          String? comment,
          String? imageResDir}) =>
      Url(
        id: id ?? this.id,
        domainId: domainId ?? this.domainId,
        directory: directory ?? this.directory,
        title: title ?? this.title,
        subTitleId: subTitleId ?? this.subTitleId,
        genreId: genreId ?? this.genreId,
        evaluation: evaluation ?? this.evaluation,
        numOfViews: numOfViews ?? this.numOfViews,
        createdAt: createdAt ?? this.createdAt,
        comment: comment ?? this.comment,
        imageResDir: imageResDir ?? this.imageResDir,
      );
  Url copyWithCompanion(UrlsCompanion data) {
    return Url(
      id: data.id.present ? data.id.value : this.id,
      domainId: data.domainId.present ? data.domainId.value : this.domainId,
      directory: data.directory.present ? data.directory.value : this.directory,
      title: data.title.present ? data.title.value : this.title,
      subTitleId:
          data.subTitleId.present ? data.subTitleId.value : this.subTitleId,
      genreId: data.genreId.present ? data.genreId.value : this.genreId,
      evaluation:
          data.evaluation.present ? data.evaluation.value : this.evaluation,
      numOfViews:
          data.numOfViews.present ? data.numOfViews.value : this.numOfViews,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      comment: data.comment.present ? data.comment.value : this.comment,
      imageResDir:
          data.imageResDir.present ? data.imageResDir.value : this.imageResDir,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Url(')
          ..write('id: $id, ')
          ..write('domainId: $domainId, ')
          ..write('directory: $directory, ')
          ..write('title: $title, ')
          ..write('subTitleId: $subTitleId, ')
          ..write('genreId: $genreId, ')
          ..write('evaluation: $evaluation, ')
          ..write('numOfViews: $numOfViews, ')
          ..write('createdAt: $createdAt, ')
          ..write('comment: $comment, ')
          ..write('imageResDir: $imageResDir')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, domainId, directory, title, subTitleId,
      genreId, evaluation, numOfViews, createdAt, comment, imageResDir);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Url &&
          other.id == this.id &&
          other.domainId == this.domainId &&
          other.directory == this.directory &&
          other.title == this.title &&
          other.subTitleId == this.subTitleId &&
          other.genreId == this.genreId &&
          other.evaluation == this.evaluation &&
          other.numOfViews == this.numOfViews &&
          other.createdAt == this.createdAt &&
          other.comment == this.comment &&
          other.imageResDir == this.imageResDir);
}

class UrlsCompanion extends UpdateCompanion<Url> {
  final Value<int> id;
  final Value<int> domainId;
  final Value<String> directory;
  final Value<String> title;
  final Value<int> subTitleId;
  final Value<int> genreId;
  final Value<int> evaluation;
  final Value<int> numOfViews;
  final Value<DateTime> createdAt;
  final Value<String> comment;
  final Value<String> imageResDir;
  const UrlsCompanion({
    this.id = const Value.absent(),
    this.domainId = const Value.absent(),
    this.directory = const Value.absent(),
    this.title = const Value.absent(),
    this.subTitleId = const Value.absent(),
    this.genreId = const Value.absent(),
    this.evaluation = const Value.absent(),
    this.numOfViews = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.comment = const Value.absent(),
    this.imageResDir = const Value.absent(),
  });
  UrlsCompanion.insert({
    this.id = const Value.absent(),
    required int domainId,
    required String directory,
    required String title,
    required int subTitleId,
    required int genreId,
    required int evaluation,
    required int numOfViews,
    this.createdAt = const Value.absent(),
    required String comment,
    required String imageResDir,
  })  : domainId = Value(domainId),
        directory = Value(directory),
        title = Value(title),
        subTitleId = Value(subTitleId),
        genreId = Value(genreId),
        evaluation = Value(evaluation),
        numOfViews = Value(numOfViews),
        comment = Value(comment),
        imageResDir = Value(imageResDir);
  static Insertable<Url> custom({
    Expression<int>? id,
    Expression<int>? domainId,
    Expression<String>? directory,
    Expression<String>? title,
    Expression<int>? subTitleId,
    Expression<int>? genreId,
    Expression<int>? evaluation,
    Expression<int>? numOfViews,
    Expression<DateTime>? createdAt,
    Expression<String>? comment,
    Expression<String>? imageResDir,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (domainId != null) 'domain_id': domainId,
      if (directory != null) 'directory': directory,
      if (title != null) 'title': title,
      if (subTitleId != null) 'sub_title_id': subTitleId,
      if (genreId != null) 'genre_id': genreId,
      if (evaluation != null) 'evaluation': evaluation,
      if (numOfViews != null) 'num_of_views': numOfViews,
      if (createdAt != null) 'created_at': createdAt,
      if (comment != null) 'comment': comment,
      if (imageResDir != null) 'image_res_dir': imageResDir,
    });
  }

  UrlsCompanion copyWith(
      {Value<int>? id,
      Value<int>? domainId,
      Value<String>? directory,
      Value<String>? title,
      Value<int>? subTitleId,
      Value<int>? genreId,
      Value<int>? evaluation,
      Value<int>? numOfViews,
      Value<DateTime>? createdAt,
      Value<String>? comment,
      Value<String>? imageResDir}) {
    return UrlsCompanion(
      id: id ?? this.id,
      domainId: domainId ?? this.domainId,
      directory: directory ?? this.directory,
      title: title ?? this.title,
      subTitleId: subTitleId ?? this.subTitleId,
      genreId: genreId ?? this.genreId,
      evaluation: evaluation ?? this.evaluation,
      numOfViews: numOfViews ?? this.numOfViews,
      createdAt: createdAt ?? this.createdAt,
      comment: comment ?? this.comment,
      imageResDir: imageResDir ?? this.imageResDir,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (domainId.present) {
      map['domain_id'] = Variable<int>(domainId.value);
    }
    if (directory.present) {
      map['directory'] = Variable<String>(directory.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (subTitleId.present) {
      map['sub_title_id'] = Variable<int>(subTitleId.value);
    }
    if (genreId.present) {
      map['genre_id'] = Variable<int>(genreId.value);
    }
    if (evaluation.present) {
      map['evaluation'] = Variable<int>(evaluation.value);
    }
    if (numOfViews.present) {
      map['num_of_views'] = Variable<int>(numOfViews.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (imageResDir.present) {
      map['image_res_dir'] = Variable<String>(imageResDir.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UrlsCompanion(')
          ..write('id: $id, ')
          ..write('domainId: $domainId, ')
          ..write('directory: $directory, ')
          ..write('title: $title, ')
          ..write('subTitleId: $subTitleId, ')
          ..write('genreId: $genreId, ')
          ..write('evaluation: $evaluation, ')
          ..write('numOfViews: $numOfViews, ')
          ..write('createdAt: $createdAt, ')
          ..write('comment: $comment, ')
          ..write('imageResDir: $imageResDir')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DomainsTable domains = $DomainsTable(this);
  late final $SubTitlesTable subTitles = $SubTitlesTable(this);
  late final $GenresTable genres = $GenresTable(this);
  late final $UrlsTable urls = $UrlsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [domains, subTitles, genres, urls];
}

typedef $$DomainsTableCreateCompanionBuilder = DomainsCompanion Function({
  Value<int> id,
  required String domainName,
});
typedef $$DomainsTableUpdateCompanionBuilder = DomainsCompanion Function({
  Value<int> id,
  Value<String> domainName,
});

final class $$DomainsTableReferences
    extends BaseReferences<_$AppDatabase, $DomainsTable, Domain> {
  $$DomainsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UrlsTable, List<Url>> _urlsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.urls,
          aliasName: $_aliasNameGenerator(db.domains.id, db.urls.domainId));

  $$UrlsTableProcessedTableManager get urlsRefs {
    final manager = $$UrlsTableTableManager($_db, $_db.urls)
        .filter((f) => f.domainId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_urlsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$DomainsTableFilterComposer
    extends Composer<_$AppDatabase, $DomainsTable> {
  $$DomainsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get domainName => $composableBuilder(
      column: $table.domainName, builder: (column) => ColumnFilters(column));

  Expression<bool> urlsRefs(
      Expression<bool> Function($$UrlsTableFilterComposer f) f) {
    final $$UrlsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.urls,
        getReferencedColumn: (t) => t.domainId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UrlsTableFilterComposer(
              $db: $db,
              $table: $db.urls,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$DomainsTableOrderingComposer
    extends Composer<_$AppDatabase, $DomainsTable> {
  $$DomainsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get domainName => $composableBuilder(
      column: $table.domainName, builder: (column) => ColumnOrderings(column));
}

class $$DomainsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DomainsTable> {
  $$DomainsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get domainName => $composableBuilder(
      column: $table.domainName, builder: (column) => column);

  Expression<T> urlsRefs<T extends Object>(
      Expression<T> Function($$UrlsTableAnnotationComposer a) f) {
    final $$UrlsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.urls,
        getReferencedColumn: (t) => t.domainId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UrlsTableAnnotationComposer(
              $db: $db,
              $table: $db.urls,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$DomainsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DomainsTable,
    Domain,
    $$DomainsTableFilterComposer,
    $$DomainsTableOrderingComposer,
    $$DomainsTableAnnotationComposer,
    $$DomainsTableCreateCompanionBuilder,
    $$DomainsTableUpdateCompanionBuilder,
    (Domain, $$DomainsTableReferences),
    Domain,
    PrefetchHooks Function({bool urlsRefs})> {
  $$DomainsTableTableManager(_$AppDatabase db, $DomainsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DomainsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DomainsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DomainsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> domainName = const Value.absent(),
          }) =>
              DomainsCompanion(
            id: id,
            domainName: domainName,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String domainName,
          }) =>
              DomainsCompanion.insert(
            id: id,
            domainName: domainName,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$DomainsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({urlsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (urlsRefs) db.urls],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (urlsRefs)
                    await $_getPrefetchedData<Domain, $DomainsTable, Url>(
                        currentTable: table,
                        referencedTable:
                            $$DomainsTableReferences._urlsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DomainsTableReferences(db, table, p0).urlsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.domainId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$DomainsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DomainsTable,
    Domain,
    $$DomainsTableFilterComposer,
    $$DomainsTableOrderingComposer,
    $$DomainsTableAnnotationComposer,
    $$DomainsTableCreateCompanionBuilder,
    $$DomainsTableUpdateCompanionBuilder,
    (Domain, $$DomainsTableReferences),
    Domain,
    PrefetchHooks Function({bool urlsRefs})>;
typedef $$SubTitlesTableCreateCompanionBuilder = SubTitlesCompanion Function({
  Value<int> id,
  required String subTitleName,
});
typedef $$SubTitlesTableUpdateCompanionBuilder = SubTitlesCompanion Function({
  Value<int> id,
  Value<String> subTitleName,
});

final class $$SubTitlesTableReferences
    extends BaseReferences<_$AppDatabase, $SubTitlesTable, Subtitle> {
  $$SubTitlesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UrlsTable, List<Url>> _urlsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.urls,
          aliasName: $_aliasNameGenerator(db.subTitles.id, db.urls.subTitleId));

  $$UrlsTableProcessedTableManager get urlsRefs {
    final manager = $$UrlsTableTableManager($_db, $_db.urls)
        .filter((f) => f.subTitleId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_urlsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$SubTitlesTableFilterComposer
    extends Composer<_$AppDatabase, $SubTitlesTable> {
  $$SubTitlesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get subTitleName => $composableBuilder(
      column: $table.subTitleName, builder: (column) => ColumnFilters(column));

  Expression<bool> urlsRefs(
      Expression<bool> Function($$UrlsTableFilterComposer f) f) {
    final $$UrlsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.urls,
        getReferencedColumn: (t) => t.subTitleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UrlsTableFilterComposer(
              $db: $db,
              $table: $db.urls,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$SubTitlesTableOrderingComposer
    extends Composer<_$AppDatabase, $SubTitlesTable> {
  $$SubTitlesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subTitleName => $composableBuilder(
      column: $table.subTitleName,
      builder: (column) => ColumnOrderings(column));
}

class $$SubTitlesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubTitlesTable> {
  $$SubTitlesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get subTitleName => $composableBuilder(
      column: $table.subTitleName, builder: (column) => column);

  Expression<T> urlsRefs<T extends Object>(
      Expression<T> Function($$UrlsTableAnnotationComposer a) f) {
    final $$UrlsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.urls,
        getReferencedColumn: (t) => t.subTitleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UrlsTableAnnotationComposer(
              $db: $db,
              $table: $db.urls,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$SubTitlesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SubTitlesTable,
    Subtitle,
    $$SubTitlesTableFilterComposer,
    $$SubTitlesTableOrderingComposer,
    $$SubTitlesTableAnnotationComposer,
    $$SubTitlesTableCreateCompanionBuilder,
    $$SubTitlesTableUpdateCompanionBuilder,
    (Subtitle, $$SubTitlesTableReferences),
    Subtitle,
    PrefetchHooks Function({bool urlsRefs})> {
  $$SubTitlesTableTableManager(_$AppDatabase db, $SubTitlesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubTitlesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubTitlesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubTitlesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> subTitleName = const Value.absent(),
          }) =>
              SubTitlesCompanion(
            id: id,
            subTitleName: subTitleName,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String subTitleName,
          }) =>
              SubTitlesCompanion.insert(
            id: id,
            subTitleName: subTitleName,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$SubTitlesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({urlsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (urlsRefs) db.urls],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (urlsRefs)
                    await $_getPrefetchedData<Subtitle, $SubTitlesTable, Url>(
                        currentTable: table,
                        referencedTable:
                            $$SubTitlesTableReferences._urlsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SubTitlesTableReferences(db, table, p0).urlsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.subTitleId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$SubTitlesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SubTitlesTable,
    Subtitle,
    $$SubTitlesTableFilterComposer,
    $$SubTitlesTableOrderingComposer,
    $$SubTitlesTableAnnotationComposer,
    $$SubTitlesTableCreateCompanionBuilder,
    $$SubTitlesTableUpdateCompanionBuilder,
    (Subtitle, $$SubTitlesTableReferences),
    Subtitle,
    PrefetchHooks Function({bool urlsRefs})>;
typedef $$GenresTableCreateCompanionBuilder = GenresCompanion Function({
  Value<int> id,
  required String genreName,
});
typedef $$GenresTableUpdateCompanionBuilder = GenresCompanion Function({
  Value<int> id,
  Value<String> genreName,
});

final class $$GenresTableReferences
    extends BaseReferences<_$AppDatabase, $GenresTable, Genre> {
  $$GenresTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UrlsTable, List<Url>> _urlsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.urls,
          aliasName: $_aliasNameGenerator(db.genres.id, db.urls.genreId));

  $$UrlsTableProcessedTableManager get urlsRefs {
    final manager = $$UrlsTableTableManager($_db, $_db.urls)
        .filter((f) => f.genreId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_urlsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$GenresTableFilterComposer
    extends Composer<_$AppDatabase, $GenresTable> {
  $$GenresTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get genreName => $composableBuilder(
      column: $table.genreName, builder: (column) => ColumnFilters(column));

  Expression<bool> urlsRefs(
      Expression<bool> Function($$UrlsTableFilterComposer f) f) {
    final $$UrlsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.urls,
        getReferencedColumn: (t) => t.genreId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UrlsTableFilterComposer(
              $db: $db,
              $table: $db.urls,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GenresTableOrderingComposer
    extends Composer<_$AppDatabase, $GenresTable> {
  $$GenresTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get genreName => $composableBuilder(
      column: $table.genreName, builder: (column) => ColumnOrderings(column));
}

class $$GenresTableAnnotationComposer
    extends Composer<_$AppDatabase, $GenresTable> {
  $$GenresTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get genreName =>
      $composableBuilder(column: $table.genreName, builder: (column) => column);

  Expression<T> urlsRefs<T extends Object>(
      Expression<T> Function($$UrlsTableAnnotationComposer a) f) {
    final $$UrlsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.urls,
        getReferencedColumn: (t) => t.genreId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UrlsTableAnnotationComposer(
              $db: $db,
              $table: $db.urls,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GenresTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GenresTable,
    Genre,
    $$GenresTableFilterComposer,
    $$GenresTableOrderingComposer,
    $$GenresTableAnnotationComposer,
    $$GenresTableCreateCompanionBuilder,
    $$GenresTableUpdateCompanionBuilder,
    (Genre, $$GenresTableReferences),
    Genre,
    PrefetchHooks Function({bool urlsRefs})> {
  $$GenresTableTableManager(_$AppDatabase db, $GenresTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GenresTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GenresTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GenresTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> genreName = const Value.absent(),
          }) =>
              GenresCompanion(
            id: id,
            genreName: genreName,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String genreName,
          }) =>
              GenresCompanion.insert(
            id: id,
            genreName: genreName,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$GenresTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({urlsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (urlsRefs) db.urls],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (urlsRefs)
                    await $_getPrefetchedData<Genre, $GenresTable, Url>(
                        currentTable: table,
                        referencedTable:
                            $$GenresTableReferences._urlsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GenresTableReferences(db, table, p0).urlsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.genreId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$GenresTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GenresTable,
    Genre,
    $$GenresTableFilterComposer,
    $$GenresTableOrderingComposer,
    $$GenresTableAnnotationComposer,
    $$GenresTableCreateCompanionBuilder,
    $$GenresTableUpdateCompanionBuilder,
    (Genre, $$GenresTableReferences),
    Genre,
    PrefetchHooks Function({bool urlsRefs})>;
typedef $$UrlsTableCreateCompanionBuilder = UrlsCompanion Function({
  Value<int> id,
  required int domainId,
  required String directory,
  required String title,
  required int subTitleId,
  required int genreId,
  required int evaluation,
  required int numOfViews,
  Value<DateTime> createdAt,
  required String comment,
  required String imageResDir,
});
typedef $$UrlsTableUpdateCompanionBuilder = UrlsCompanion Function({
  Value<int> id,
  Value<int> domainId,
  Value<String> directory,
  Value<String> title,
  Value<int> subTitleId,
  Value<int> genreId,
  Value<int> evaluation,
  Value<int> numOfViews,
  Value<DateTime> createdAt,
  Value<String> comment,
  Value<String> imageResDir,
});

final class $$UrlsTableReferences
    extends BaseReferences<_$AppDatabase, $UrlsTable, Url> {
  $$UrlsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DomainsTable _domainIdTable(_$AppDatabase db) => db.domains
      .createAlias($_aliasNameGenerator(db.urls.domainId, db.domains.id));

  $$DomainsTableProcessedTableManager get domainId {
    final $_column = $_itemColumn<int>('domain_id')!;

    final manager = $$DomainsTableTableManager($_db, $_db.domains)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_domainIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $SubTitlesTable _subTitleIdTable(_$AppDatabase db) => db.subTitles
      .createAlias($_aliasNameGenerator(db.urls.subTitleId, db.subTitles.id));

  $$SubTitlesTableProcessedTableManager get subTitleId {
    final $_column = $_itemColumn<int>('sub_title_id')!;

    final manager = $$SubTitlesTableTableManager($_db, $_db.subTitles)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_subTitleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $GenresTable _genreIdTable(_$AppDatabase db) => db.genres
      .createAlias($_aliasNameGenerator(db.urls.genreId, db.genres.id));

  $$GenresTableProcessedTableManager get genreId {
    final $_column = $_itemColumn<int>('genre_id')!;

    final manager = $$GenresTableTableManager($_db, $_db.genres)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_genreIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$UrlsTableFilterComposer extends Composer<_$AppDatabase, $UrlsTable> {
  $$UrlsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get directory => $composableBuilder(
      column: $table.directory, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get evaluation => $composableBuilder(
      column: $table.evaluation, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get numOfViews => $composableBuilder(
      column: $table.numOfViews, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get comment => $composableBuilder(
      column: $table.comment, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageResDir => $composableBuilder(
      column: $table.imageResDir, builder: (column) => ColumnFilters(column));

  $$DomainsTableFilterComposer get domainId {
    final $$DomainsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.domainId,
        referencedTable: $db.domains,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DomainsTableFilterComposer(
              $db: $db,
              $table: $db.domains,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SubTitlesTableFilterComposer get subTitleId {
    final $$SubTitlesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.subTitleId,
        referencedTable: $db.subTitles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SubTitlesTableFilterComposer(
              $db: $db,
              $table: $db.subTitles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GenresTableFilterComposer get genreId {
    final $$GenresTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.genreId,
        referencedTable: $db.genres,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GenresTableFilterComposer(
              $db: $db,
              $table: $db.genres,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$UrlsTableOrderingComposer extends Composer<_$AppDatabase, $UrlsTable> {
  $$UrlsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get directory => $composableBuilder(
      column: $table.directory, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get evaluation => $composableBuilder(
      column: $table.evaluation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get numOfViews => $composableBuilder(
      column: $table.numOfViews, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get comment => $composableBuilder(
      column: $table.comment, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageResDir => $composableBuilder(
      column: $table.imageResDir, builder: (column) => ColumnOrderings(column));

  $$DomainsTableOrderingComposer get domainId {
    final $$DomainsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.domainId,
        referencedTable: $db.domains,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DomainsTableOrderingComposer(
              $db: $db,
              $table: $db.domains,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SubTitlesTableOrderingComposer get subTitleId {
    final $$SubTitlesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.subTitleId,
        referencedTable: $db.subTitles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SubTitlesTableOrderingComposer(
              $db: $db,
              $table: $db.subTitles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GenresTableOrderingComposer get genreId {
    final $$GenresTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.genreId,
        referencedTable: $db.genres,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GenresTableOrderingComposer(
              $db: $db,
              $table: $db.genres,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$UrlsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UrlsTable> {
  $$UrlsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get directory =>
      $composableBuilder(column: $table.directory, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get evaluation => $composableBuilder(
      column: $table.evaluation, builder: (column) => column);

  GeneratedColumn<int> get numOfViews => $composableBuilder(
      column: $table.numOfViews, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get comment =>
      $composableBuilder(column: $table.comment, builder: (column) => column);

  GeneratedColumn<String> get imageResDir => $composableBuilder(
      column: $table.imageResDir, builder: (column) => column);

  $$DomainsTableAnnotationComposer get domainId {
    final $$DomainsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.domainId,
        referencedTable: $db.domains,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DomainsTableAnnotationComposer(
              $db: $db,
              $table: $db.domains,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SubTitlesTableAnnotationComposer get subTitleId {
    final $$SubTitlesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.subTitleId,
        referencedTable: $db.subTitles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SubTitlesTableAnnotationComposer(
              $db: $db,
              $table: $db.subTitles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GenresTableAnnotationComposer get genreId {
    final $$GenresTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.genreId,
        referencedTable: $db.genres,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GenresTableAnnotationComposer(
              $db: $db,
              $table: $db.genres,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$UrlsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UrlsTable,
    Url,
    $$UrlsTableFilterComposer,
    $$UrlsTableOrderingComposer,
    $$UrlsTableAnnotationComposer,
    $$UrlsTableCreateCompanionBuilder,
    $$UrlsTableUpdateCompanionBuilder,
    (Url, $$UrlsTableReferences),
    Url,
    PrefetchHooks Function({bool domainId, bool subTitleId, bool genreId})> {
  $$UrlsTableTableManager(_$AppDatabase db, $UrlsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UrlsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UrlsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UrlsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> domainId = const Value.absent(),
            Value<String> directory = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<int> subTitleId = const Value.absent(),
            Value<int> genreId = const Value.absent(),
            Value<int> evaluation = const Value.absent(),
            Value<int> numOfViews = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> comment = const Value.absent(),
            Value<String> imageResDir = const Value.absent(),
          }) =>
              UrlsCompanion(
            id: id,
            domainId: domainId,
            directory: directory,
            title: title,
            subTitleId: subTitleId,
            genreId: genreId,
            evaluation: evaluation,
            numOfViews: numOfViews,
            createdAt: createdAt,
            comment: comment,
            imageResDir: imageResDir,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int domainId,
            required String directory,
            required String title,
            required int subTitleId,
            required int genreId,
            required int evaluation,
            required int numOfViews,
            Value<DateTime> createdAt = const Value.absent(),
            required String comment,
            required String imageResDir,
          }) =>
              UrlsCompanion.insert(
            id: id,
            domainId: domainId,
            directory: directory,
            title: title,
            subTitleId: subTitleId,
            genreId: genreId,
            evaluation: evaluation,
            numOfViews: numOfViews,
            createdAt: createdAt,
            comment: comment,
            imageResDir: imageResDir,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$UrlsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {domainId = false, subTitleId = false, genreId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (domainId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.domainId,
                    referencedTable: $$UrlsTableReferences._domainIdTable(db),
                    referencedColumn:
                        $$UrlsTableReferences._domainIdTable(db).id,
                  ) as T;
                }
                if (subTitleId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.subTitleId,
                    referencedTable: $$UrlsTableReferences._subTitleIdTable(db),
                    referencedColumn:
                        $$UrlsTableReferences._subTitleIdTable(db).id,
                  ) as T;
                }
                if (genreId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.genreId,
                    referencedTable: $$UrlsTableReferences._genreIdTable(db),
                    referencedColumn:
                        $$UrlsTableReferences._genreIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$UrlsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UrlsTable,
    Url,
    $$UrlsTableFilterComposer,
    $$UrlsTableOrderingComposer,
    $$UrlsTableAnnotationComposer,
    $$UrlsTableCreateCompanionBuilder,
    $$UrlsTableUpdateCompanionBuilder,
    (Url, $$UrlsTableReferences),
    Url,
    PrefetchHooks Function({bool domainId, bool subTitleId, bool genreId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DomainsTableTableManager get domains =>
      $$DomainsTableTableManager(_db, _db.domains);
  $$SubTitlesTableTableManager get subTitles =>
      $$SubTitlesTableTableManager(_db, _db.subTitles);
  $$GenresTableTableManager get genres =>
      $$GenresTableTableManager(_db, _db.genres);
  $$UrlsTableTableManager get urls => $$UrlsTableTableManager(_db, _db.urls);
}
