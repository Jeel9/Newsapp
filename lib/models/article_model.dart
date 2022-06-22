import 'package:flutter/cupertino.dart';

class ArticleModel {
  String imageurl;
  String title;
  String desc;
  String url;
  String? author;
  String? content;

  ArticleModel({
    required this.author,
    required this.title,
    required this.desc,
    required this.url,
    required this.imageurl,
    required this.content,
  });
}
