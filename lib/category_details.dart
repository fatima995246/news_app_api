import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api_manager.dart';
import 'package:news_app/model/categoryDM.dart';
import 'package:news_app/tab_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'model/SourceResponse.dart';

class CataegoryDetails extends StatefulWidget {
  static const String routName = 'category details' ;
  CategoryDM category;
  CataegoryDetails({required this.category});
  @override
  State<CataegoryDetails> createState() => _CataegoryDetailsState();
}

class _CataegoryDetailsState extends State<CataegoryDetails> {

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<SourceResponse>(
        future:ApiManager.getSources(widget.category.id,context) ,
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
                Text(AppLocalizations.of(context)!.somethingwrong),
                ElevatedButton(
                    onPressed: (){
                      ApiManager.getSources(widget.category.id,context);
                      setState(() {

                      });
                    },
                    child: Text(AppLocalizations.of(context)!.tryagain)
                )
              ],
            );
          }
          //server has response
          if(snapshot.data?.status != 'ok'){
            return Column(
              children: [
                Text(snapshot.data?.message??''),
                ElevatedButton(
                    onPressed: (){
                      ApiManager.getSources(widget.category.id,context);
                      setState(() {

                      });
                    },
                    child: Text(AppLocalizations.of(context)!.tryagain)
                )
              ],
            );

          }
          //data statue sources
          var soursesList = snapshot.data?.sources ?? [];
          return TabContainer(soursesList: soursesList);
        },

      );

  }
}
