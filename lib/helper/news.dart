import 'dart:convert';

import 'package:khabri/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
   List<ArticleModel> news = [];

   Future<void> getNews() async{
      var url = "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=9b1a07a6e4c646c4b44510186f0d2faa";


   var response = await http.get(Uri.parse(url));
      // var response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      if(jsonData['status'] == "ok") {

         jsonData["articles"].forEach((element){

            if(element["urlToImage"] != null && element['description'] != null  ) {
               ArticleModel articleModel = ArticleModel(
                  title: element['title'] ?? "NA",
                  author: element["author"] ?? "NA",
                  description: element["description"] ?? "NA",
                  url: element["url"] ?? "NA",
                  urlToImage: element["urlToImage"] ?? "NA",
                  // publishedAt: element["publishAt"],
                  content: element["content"] ?? "NA",
               );
               news.add(articleModel);
            }

         });


         }
   }

}
