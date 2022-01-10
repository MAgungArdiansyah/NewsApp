import 'package:dicodingnews/model/marticles.dart';
import 'package:dicodingnews/screen/article_web_view.dart';
import 'package:flutter/material.dart';

class ArticleDetailPage extends StatelessWidget {

  static const routeName = '/article_detail';
  final Articles articles;

  const ArticleDetailPage({ Key? key, required this.articles }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(articles.title),
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: articles.urlToImage,
              child: Image.network(articles.urlToImage)
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(articles.description),
                  const Divider(color: Colors.grey),
                  Text(
                    articles.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const Divider(color: Colors.grey),
                  Text('Date: ${articles.publishedAt}'),
                  const SizedBox(height: 10),
                  Text('Author: ${articles.author}'),
                  const Divider(color: Colors.grey),
                  Text(
                    articles.content,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    child: const Text('Read more'),
                    onPressed: () {
                      Navigator.pushNamed(context, ArticleWebView.routeName, arguments: articles.url);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}