import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api_manager.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';

import 'news+details.dart';
import 'news_item.dart';

class NewsContainer extends StatefulWidget {
Source source ;

NewsContainer({required this.source});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  final ScrollController scrollController =ScrollController();
  int pageNumber =1 ;
  List<News> news =[] ;
  bool shouldLoadNextPage = false ;
  @override
  void initState() {
    super.initState();

    // Setup the listener.
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          print('At the bottom');
          shouldLoadNextPage=true ;
          setState(() {

          });

        }
      }
    });
  }
  @override
  void dispose() {
    scrollController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(shouldLoadNextPage){
      ApiManager.getNewsBySourceId(sourceId: widget.source.id??'' ,pageNumber: ++pageNumber).then((value) => news.addAll(value.articles!));
      shouldLoadNextPage = false ;
      setState(() {

      });
    }
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNewsBySourceId(sourceId: widget.source.id??''),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting && news.isEmpty) {
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
                      ApiManager.getNewsBySourceId(sourceId: widget.source.id??'');
                      setState(() {

                      });
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
          if(news.isEmpty){
            news = newsList ;
          }else if(news.first.title != newsList.first.title) {
            news = newsList ;
          }
          print(news.length);

          return ListView.builder(
              controller: scrollController ,
              itemBuilder: (context,index){
                return NewsItem(news: news[index],);


              },itemCount: news.length,
          );
        }
    );
  }
}
