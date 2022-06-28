import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/screens/Home.dart';

class CategoryPage extends StatefulWidget {
  final String category;
  CategoryPage({required this.category});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool _loading = true;
  List<ArticleModel> arr2 = <ArticleModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  getNews() async {
    CategoryNews newsclass = CategoryNews();
    await newsclass.newsfunc(widget.category);
    arr2 = newsclass.array;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F0),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          color: Color(0xFF1a1a1a),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        title: Text(
          widget.category.toUpperCase(),
          style: TextStyle(
            color: Color(0xFF1a1a1a),
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.save),
            ),
          ),
        ],
        elevation: 0.0,
        centerTitle: true,
      ),
      //
      //
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  itemCount: arr2.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, i) {
                    return NewsCard(
                      image: arr2[i].imageurl,
                      title: arr2[i].title,
                      desc: arr2[i].desc,
                      url: arr2[i].url,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
