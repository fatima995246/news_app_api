import 'dart:convert';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'api_constants.dart';
class ApiManager{
  static Future<SourceResponse> getSources(String categoryId,BuildContext context) async {
    var provider = Provider.of<AppConfigProvider>(context);
    //https://newsapi.org/v2/top-headlines/sources?apiKey=62babb19e3e44d518482bc59c5f34e17
   Uri url=Uri.https(ApiConstants.baseURL,ApiConstants.sourceApi,{
   'apiKey' : '62babb19e3e44d518482bc59c5f34e17',
     'category': categoryId,
   });
   try{
     var response = await http.get(url);
     var bodyString = response.body; //string
     var json = jsonDecode(bodyString); //json
     return SourceResponse.fromJson(json);
   } catch(e){
     throw e ;
   }


  }
  static Future<NewsResponse> getNewsBySourceId({required String sourceId,int? pageNumber }) async {
    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=62babb19e3e44d518482bc59c5f34e17
    Uri url =Uri.https(ApiConstants.baseURL,ApiConstants.newsApi,{
      'apiKey' : '62babb19e3e44d518482bc59c5f34e17' ,
      'sources' : sourceId ,
      'pageSize' : '10' ,
      'page' : '$pageNumber'
    });
   try {
     var response=await http.get(url);
     var bodyString=response.body ;
     var json =jsonDecode(bodyString);
     return NewsResponse.fromJson(json);
   } catch(e){
     throw e ;
    }

  }


  static Future<NewsResponse> searchNews(String query) async {
    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=62babb19e3e44d518482bc59c5f34e17
    Uri url =Uri.https(ApiConstants.baseURL,ApiConstants.newsApi,{
      'apiKey' : '62babb19e3e44d518482bc59c5f34e17' ,
      'q' : query
    });
    try {
      var response=await http.get(url);
      var bodyString=response.body ;
      var json =jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    } catch(e){
      throw e ;
    }

  }

}