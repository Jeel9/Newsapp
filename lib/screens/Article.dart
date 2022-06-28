import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app/screens/Home.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticlePage extends StatefulWidget {
  final String blogurl;

  ArticlePage({required this.blogurl});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "News",
              style: TextStyle(
                color: Color(0xFF1A1A1A),
                fontStyle: FontStyle.italic,
                fontSize: 20,
              ),
            ),
            Text(
              "Buddy",
              style: TextStyle(
                color: Color(0xFFE63B3B),
                fontWeight: FontWeight.w600,
                //fontStyle: FontStyle.italic,
                fontSize: 20,
              ),
            ),
          ],
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
      body: Container(
        child: WebView(
          initialUrl: widget.blogurl,
          onWebViewCreated: ((WebViewController webviewcontroller) {
            _completer.complete(webviewcontroller);
          }),
        ),
      ),
    );
  }
}
