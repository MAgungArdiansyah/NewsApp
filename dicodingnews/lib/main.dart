import 'package:dicodingnews/articles.dart';
import 'package:flutter/material.dart';
 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'News App',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        initialRoute: NewsListPage.routeName,
        routes: {
          NewsListPage.routeName: (context) => NewsListPage(),
        });
  }
}

class NewsListPage extends StatelessWidget {
  static const routeName = '/article_list';

  const NewsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: FutureBuilder<String>(
        future:
            // Untuk membaca string
            DefaultAssetBundle.of(context).loadString('assets/articles.json'),
        builder: (context, snapshot) {
          final List<Articles> articles = parseArticles(snapshot.data);
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return _buildArticleItem(context, articles[index]);
            },
          );
        },
      ),
    );
  }
}

Widget _buildArticleItem(BuildContext context, Articles article) {
  return ListTile(
    contentPadding:
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    leading: Image.network(
      article.urlToImage,
      width: 100,
    ),
    title: Text(article.title),
    subtitle: Text(article.author),
  );
}