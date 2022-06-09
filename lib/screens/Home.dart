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
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Jeels",
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
              ),
            ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final image, name;
  CategoryCard(
    this.image,
    this.name,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.asset(
            image,
            height: 100.0,
            width: 80.0,
          ),
        ],
      ),
    );
  }
}
