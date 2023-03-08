import 'package:reading_app/models/source.dart';

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article(
      {this.author,
      this.source,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'] == null ? "" : json['author'],
      title: json['title'] == null ? null : json['title'],
      description: json['description'] == null ? null : json['description'],
      url: json['url'] == null ? null : json['url'],
      urlToImage: json['urlToImage'] == null ? null : json['urlToImage'],
      publishedAt: json['publishedAt'] == null ? null : json['publishedAt'],
      content: json['content'] == null ? null : json['content'],
    );
  }
}
