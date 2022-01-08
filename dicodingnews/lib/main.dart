import 'package:dicodingnews/articles.dart';
import 'package:dicodingnews/article_web_view.dart';
import 'package:dicodingnews/detail_page.dart';
import 'package:dicodingnews/style.dart';
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
            visualDensity: VisualDensity.adaptivePlatformDensity,
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryCoolor,
              onPrimary: Colors.black,
              secondary: secondaryColor
            ),
            textTheme: myTextTheme,
            appBarTheme: const AppBarTheme(elevation: 0),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                primary: secondaryColor,
                onPrimary: Colors.white,
                textStyle: TextStyle(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(0)
                  )
                )
              )
            )
            ),
        initialRoute: NewsListPage.routeName,
        routes: {
          NewsListPage.routeName: (context) => const NewsListPage(),
          ArticleDetailPage.routeName: (context) => ArticleDetailPage(articles: ModalRoute.of(context)?.settings.arguments as Articles  ),
          ArticleWebView.routeName: (context) => ArticleWebView(url: ModalRoute.of(context)?.settings.arguments as String)
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