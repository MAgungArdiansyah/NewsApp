import 'package:dicodingnews/model/marticles.dart';
import 'package:flutter/material.dart';

import 'detail_page.dart';

class NewsListPage extends StatelessWidget {
  static const routeName = '/article_list';

  const NewsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
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
    leading: Hero(
      tag: article.urlToImage,
      child: Image.network(
        article.urlToImage,
        width: 100,
      ),
    ),
    title: Text(article.title),
    subtitle: Text(article.author),
    onTap: () => Navigator.pushNamed(context, ArticleDetailPage.routeName, arguments: article),
  );
}