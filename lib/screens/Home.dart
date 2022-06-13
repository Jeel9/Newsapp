import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/models/category_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loading = false;

  List<CategoryModel> arr = <CategoryModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    arr = getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      //
      //---App Bar---
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Super",
              style: TextStyle(
                color: Color(0xFF1A1A1A),
              ),
            ),
            Text(
              "News",
              style: TextStyle(
                color: Color(0xFFE63B3B),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        elevation: 0.0,
      ),
      //
      //---Body---
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: <Widget>[
//
                    //---Categories---
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Container(
                        height: 72.0,
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
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final image, name;

  CategoryCard({
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0),
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
                borderRadius: BorderRadius.circular(8.0),
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
  final image, title, desc;

  NewsCard({
    required this.image,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.asset(image),
          Text(title),
          Text(desc),
        ],
      ),
    );
  }
}
