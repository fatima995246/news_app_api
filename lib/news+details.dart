import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'model/NewsResponse.dart';
import 'my_theme.dart';
import 'news_item.dart';

class NewsDetails extends StatefulWidget {
  static const String routeName = "NewsDetails";

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {

 @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as News ;
    print(args.content);

    return Stack(
     children: [
      Container(
      color: MyTheme.whiteColor,
      child: Image.asset('assets/pattern.png',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover),
    ),
    Scaffold(
    appBar: AppBar(
    centerTitle: true,
    title: Text('${args.title}',
    style: Theme.of(context).textTheme.titleLarge,),

      ),
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
        NewsItem(news: args,),
        Container(
          decoration: BoxDecoration(
              color: MyTheme.whiteColor
          ),
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.02,
              horizontal: MediaQuery.of(context).size.width * 0.08),
          child:
          Column(

            children: [
              Container(
                width:double.infinity,
                height: MediaQuery.of(context).size.height * 0.32,
                child: Text(args.content!, maxLines: args.content!.length,
                    overflow: TextOverflow.visible,),

              ),
              InkWell(
                onTap: (){
                  _launchUrl(args.url!);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('View Full Article',textAlign: TextAlign.right,),
                    Icon(Icons.arrow_right)
                  ],

                ),
              )
            ],
          ),
        ),

    ],
    ),
      )

    ),
    ]

    );


  }

 Future<void> _launchUrl(String url) async {
   var uri = Uri.parse(url);

   if (!await launchUrl(uri)) {
     throw Exception('Could not launch $uri');
   }
 }
}
