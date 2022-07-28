import 'dart:convert';

import 'package:http/http.dart' as http;

class News {
  String? title;
  String description;
  String url;
  String urlToImage;
  String? publishedAt;
  String? content;

  News(
      {required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});
}

Future<List<News>> getNewsList() async {
  List<News> list = [];
  String url =
      "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=82a589a72d6349979ac6e4741d369b10";
  var response = await http.get(Uri.parse(url));
  var data = jsonDecode(response.body);
  if (data['status'] == 'ok') {
    data['articles'].forEach((x) {
      if (x['urlToImage'] != null && x['description'] != null
          //&& x['title']!=null && x['url']!=null && x['publishedAt']!=null
          ) {
        News a = News(
          title: x['title'],
          description: x['description'],
          url: x['url'],
          urlToImage: x['urlToImage'],
          publishedAt: x['publishedAt'],
          content: x['content'],
        );
        list.add(a);
      }
    });
  }
  return list;
}

Future<List<News>> getCategoryNewsList(String x) async {
  List<News> list = [];
  String url =
      "https://newsapi.org/v2/top-headlines?country=in&category=$x&apiKey=82a589a72d6349979ac6e4741d369b10";
  var response = await http.get(Uri.parse(url));
  var data = jsonDecode(response.body);
  if (data['status'] == 'ok') {
    data['articles'].forEach((x) {
      if (x['urlToImage'] != null && x['description'] != null) {
        News a = News(
          title: x['title'],
          description: x['description'],
          url: x['url'],
          urlToImage: x['urlToImage'],
          publishedAt: x['publishedAt'],
          content: x['content'] ?? '',
        );
        list.add(a);
      }
    });
  }
  return list;
}
