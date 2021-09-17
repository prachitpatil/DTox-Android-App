import 'dart:convert';

import 'package:dtox/models/news_article_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class News{

  List<ArticleModel> news = [];

  Future<void> getNews() async{

    String url = 'http://newsapi.org/v2/top-headlines?' +
        'country=in&' +
        'apiKey=1234yourapikey1234';

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            //publishedAt: element['publishedAt'],
            content: element['content'],
          );

          news.add(articleModel);
      }
      });
    }
  }
}