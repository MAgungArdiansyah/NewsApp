import 'package:dicodingnews/model/marticles.dart';
import 'package:dicodingnews/screen/settings.dart';
import 'package:dicodingnews/widget/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'article_list_page.dart';
import 'detail_page.dart';

class NewsListPage extends StatefulWidget {
  static const routeName = '/home_page';

  const NewsListPage({Key? key}) : super(key: key);

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> _listWidget = [
      ArticleListPage(),
      SettingsPage(),
    ];

    List<BottomNavigationBarItem> _bottomNavBarItems = [
      BottomNavigationBarItem(
        icon: Icon(defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoIcons.news
            : Icons.public),
        label: 'News',
      ),
      BottomNavigationBarItem(
        icon: Icon(defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoIcons.settings
            : Icons.settings),
        label: 'Settings',
      ),
    ];

    Widget _buildAndroid(BuildContext context) {
      return Scaffold(
        body: _listWidget[_bottomNavIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _bottomNavIndex,
          items: _bottomNavBarItems,
          onTap: (index) => setState(() {
            _bottomNavIndex = index;
            print(_bottomNavIndex.toString());
          }),
        ),
      );
    }

    Widget _buildIos(BuildContext context) {
      return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: _bottomNavBarItems
        ),
        tabBuilder: (context, index) {
         return _listWidget[index];
        },
      );
    }

    return _buildIos(context);
  }
}

Widget _buildIos(BuildContext context) {
  return CupertinoTabScaffold(
    tabBar: CupertinoTabBar(items: [
      BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.news), label: 'Headline'),
      BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.settings), label: 'Settings'),
    ]),
    tabBuilder: (context, index) {
      switch (index) {
        case 0:
          return ArticleListPage();
        case 1:
          return Placeholder();
        default:
          return Text('');
      }
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
