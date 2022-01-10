import 'package:dicodingnews/model/marticles.dart';
import 'package:dicodingnews/widget/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'article_list_page.dart';
import 'detail_page.dart';

class NewsListPage extends StatefulWidget {
  static const routeName = '/article_list';

  const NewsListPage({Key? key}) : super(key: key);

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  @override
  Widget build(BuildContext context) {
    int bottomNavIndex = 0;

    Widget _buildAndroid(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('News App'),
        ),
        body: bottomNavIndex == 0 ? ArticleListPage() : Placeholder(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomNavIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.public), label: 'Headline'),
            BottomNavigationBarItem(
                icon: Icon(Icons.public), label: 'Headline'),
          ],
          onTap: (value) => setState(() {
            bottomNavIndex = value;
          }),
        ),
      );
    }

    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}

Widget _buildIos(BuildContext context) {
  return CupertinoPageScaffold(
    navigationBar: const CupertinoNavigationBar(
      middle: Text('News App'),
    ),
    child: _buildList(context),
  );
}

Widget _buildList(BuildContext context) {
  return FutureBuilder<String>(
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
  );
}

Widget _buildArticleItem(BuildContext context, Articles article) {
  return Material(
    child: ListTile(
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
      onTap: () => Navigator.pushNamed(context, ArticleDetailPage.routeName,
          arguments: article),
    ),
  );
}
