import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatelessWidget {

  static const routeName = '/article_web';
  final String url;
  
  const ArticleWebView({ Key? key, required this.url }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

//https://news.detik.com/berita/d-5878058/pesinetron-ca-ditangkap-terkait-prostitusi-muncikarinya-juga-dicokok?tag_from=wp_nhl_2