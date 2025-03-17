class Url {
  final int? id;
  final int domainId;
  final String directory;
  final String title;
  final int subTitleId;
  final int genreId;
  final int evaluation;
  final int numOfViews;
  final String createdAt;
  final String comment;
  final String imageResDir;

  Url({
    this.id,
    required this.domainId,
    required this.directory,
    required this.title,
    required this.subTitleId,
    required this.genreId,
    required this.evaluation,
    required this.numOfViews,
    required this.createdAt,
    required this.comment,
    required this.imageResDir,
  });

  //DBからデータを取得するときに使う。JSONからUrlオブジェクトに変換
  factory Url.fromJson(Map<String, dynamic> json) {
    return Url(
      id: json['id'],
      domainId: json['domain_id'],
      directory: json['directory'],
      title: json['title'],
      subTitleId: json['sub_title_id'],
      genreId: json['genre_id'],
      evaluation: json['evaluation'],
      numOfViews: json['num_of_views'],
      createdAt: json['created_at'],
      comment: json['comment'],
      imageResDir: json['image_res_dir'],
    );
  }

  //DBにデータを保存するときに使う。UrlオブジェクトからJSONに変換
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'domain_id': domainId,
      'directory':directory,
      'title': title,
      'sub_title_id': subTitleId,
      'genre_id': genreId,
      'evaluation': evaluation,
      'num_of_views': numOfViews,
      'created_at': createdAt,
      'comment': comment,
      'image_res_dir': imageResDir,
    };
  }
}