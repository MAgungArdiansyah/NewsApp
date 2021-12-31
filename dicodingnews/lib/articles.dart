import 'dart:convert';

class Articles {
  late String author;
  late String title;
  late String description;
  late String url;
  late String urlToImage;
  late String publishedAt;
  late String content;

  Articles(
      {required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  // konfersi json file menjadi object
  Articles.fromJson(Map<String, dynamic> article) {
    author = article['author'];
    title = article['title'];
    description = article['description'];
    url = article['url'];
    urlToImage = article['urlToImage'];
    publishedAt = article['publishedAt'];
    content = article['content'];
  }
}
  /*
  Karena Future kita mengembalikan String, 
  maka kita perlu mengonversinya menjadi objek yang kita siapkan. 
  Proses konversi ini juga dikenal dengan json parsing. 
  */
List<Articles> parseArticles(String? json) {
    if (json == null) {
      return [];
    }
    
    final parsed = jsonDecode(json);
    return parsed.map((json) => Articles.fromJson(json)).toList();
}