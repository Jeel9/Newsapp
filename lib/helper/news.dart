import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article_model.dart';

class News {
  List<ArticleModel> array = [];

  Future<void> newsfunc() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=350a4d35900841118bfde6fffb650258";
    var response = await http.get(Uri.parse(url));

    var jsondata = jsonDecode(response.body);

    if (jsondata['status'] == "ok") {
      jsondata["articles"].forEach((element) {
        if (element["urlToImage"] != null &&
            element["title"] != null &&
            element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element["author"],
            desc: element["description"],
            url: element["url"],
            imageurl: element["urlToImage"],
            content: element["context"],
          );
          array.add(articleModel);
        }
      });
    }
  }
}
