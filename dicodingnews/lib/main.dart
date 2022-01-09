import 'package:dicodingnews/model/marticles.dart';
import 'package:dicodingnews/screen/article_web_view.dart';
import 'package:dicodingnews/screen/detail_page.dart';
import 'package:dicodingnews/screen/list_page.dart';
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

