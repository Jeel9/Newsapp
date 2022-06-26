import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> arr = <CategoryModel>[];
  List<ArticleModel> arr2 = <ArticleModel>[];

  bool _loading = false;

  getNews() async {
    News newsclass = News();
    await newsclass.newsfunc();
    arr2 = newsclass.array;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    arr = getCategory();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F0),
//
      //---App Bar---
      appBar: newAppBar(),
//
      //---Body---
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : Column(
              children: <Widget>[
                //
                //---Categories---
                Container(
                  color: Colors.white,
                  height: 88,
                  child: ListView.builder(
                    itemCount: arr.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryCard(
                        image: arr[index].imagename,
                        name: arr[index].categoryname,
                      );
                    },
                  ),
                ),

                //
                //---Newscards---
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
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  // --- AppBar Method ---
  AppBar newAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Super",
            style: TextStyle(
              color: Color(0xFF1A1A1A),
              fontStyle: FontStyle.italic,
              fontSize: 20,
            ),
          ),
          Text(
            "News",
            style: TextStyle(
              color: Color(0xFFE63B3B),
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              fontSize: 20,
            ),
          ),
        ],
      ),
      elevation: 0.0,
    );
  }
  // AppBar Method Ends
}

class CategoryCard extends StatelessWidget {
  final String image, name;

  CategoryCard({
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Navigator.push(context, route)
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                image,
                height: 72.0,
                width: 128.0,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 72.0,
              width: 128.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0x301A1A1A),
              ),
              child: Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String image, title, desc;

  NewsCard({
    required this.image,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        children: <Widget>[
          //
          //--Card Box--
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),

            //
            //--Content Column--
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(image),
                  ),
                  //--Padding--
                  SizedBox(height: 12),
                  //
                  Text(
                    title,
                    style: TextStyle(
                      color: Color(0xFF1A1A1A),
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  //--Padding--
                  SizedBox(height: 8),
                  //
                  Text(
                    desc,
                    style: TextStyle(
                      color: Color(0xFF4F4F4F),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
