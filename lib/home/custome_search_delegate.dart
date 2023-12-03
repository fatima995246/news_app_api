import 'package:flutter/material.dart';
import 'package:news_app/my_theme.dart';

import '../api_manager.dart';
import '../model/NewsResponse.dart';
import '../news_item.dart';

class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying
  List<String> searchTerms = [
"entertainment","technology","health","sports"
  ];

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
         showResults(context);
        },
        icon: Icon(Icons.search,size:35,color: MyTheme.primaryLightColor,),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        query='';
        close(context, null);
      },
      icon: Icon(Icons.close,size:35,color: MyTheme.primaryLightColor,),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    if(query.isNotEmpty){
      return FutureBuilder<NewsResponse>(
        future: ApiManager.searchNews(query ?? ''),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ), );
          }
          else if (snapshot.hasError){
            ///client
            return Column(
              children: [
                Text("something went wrong"),
                ElevatedButton(
                    onPressed: (){
                      ApiManager.searchNews(query);

                    },
                    child: Text("try again")
                )
              ],
            );
          }
          //server has response
          if(snapshot.data?.status != 'ok'){
            return Text(snapshot.data?.message??'something went wrong');

          }
          var newsList = snapshot.data?.articles ??[];
          return ListView.builder(
            itemBuilder: (context,index){
              return NewsItem(news: newsList[index],);


            },itemCount: newsList.length,
          );
        }
    );
    }else{
      return Container();
    }
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isNotEmpty){
      return FutureBuilder<NewsResponse>(
          future: ApiManager.searchNews(query ?? ''),
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ), );
            }
            else if (snapshot.hasError){
              ///client
              return Column(
                children: [
                  Text("something went wrong"),
                  ElevatedButton(
                      onPressed: (){
                        ApiManager.searchNews(query);

                      },
                      child: Text("try again")
                  )
                ],
              );
            }
            //server has response
            if(snapshot.data?.status != 'ok'){
              return Text(snapshot.data?.message??'something went wrong');

            }
            var newsList = snapshot.data?.articles ??[];
            return ListView.builder(
              itemBuilder: (context,index){
                return NewsItem(news: newsList[index],);


              },itemCount: newsList.length,
            );
          }
      );
    }else{
      return Container();
    }
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return ThemeData(
      primaryColor: MyTheme.primaryLightColor,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide.none
        )
      ),

      appBarTheme: AppBarTheme(
          backgroundColor: MyTheme.primaryLightColor ,
          centerTitle: true,
          shape: RoundedRectangleBorder(

              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)
              )
          )

      ),



    );
  }

}