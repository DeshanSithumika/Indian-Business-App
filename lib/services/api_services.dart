import 'dart:convert';
import 'package:http/http.dart';
import 'package:reading_app/models/article.dart';

class ApiServices {
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=e6910404ee634bb58d80cd2de213bfe8";

  Future<List<Article>> getArticle() async {
    Response response = await get(Uri.parse(endPointUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic article) => Article.fromJson(article)).toList();

      return articles;
    } else {
      throw ("Can't get articles");
    }
  }
}
