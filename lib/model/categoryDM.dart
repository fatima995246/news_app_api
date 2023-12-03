
import 'package:flutter/widgets.dart';
import 'package:news_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class CategoryDM {
  String id ;
  String title ;
  String image ;
  Color color ;

  CategoryDM({required this.color,required this.title,required this.id,required this.image});
 //Possible options:         science   technology.
  static List<CategoryDM>getCategories(BuildContext context){
  return [
    CategoryDM(
        color:  MyTheme.redLight, title:'${AppLocalizations.of(context)!.sports}',
        id: 'sports', image: 'assets/ball.png'
    ) ,
    CategoryDM(
        color:  MyTheme.DarkBlueColor, title:'${AppLocalizations.of(context)!.general}',
        id: 'general', image: 'assets/entertainment.png'
    ) ,
    CategoryDM(
        color:  MyTheme.pinkColor, title:'${AppLocalizations.of(context)!.health}',
        id: 'health', image: 'assets/health.png'
    ) ,
    CategoryDM(
        color:  MyTheme.brownColor, title:'${AppLocalizations.of(context)!.business}',
        id: 'business', image: 'assets/business.png'
    ) ,
    CategoryDM(
        color:  MyTheme.blueColor, title:'${AppLocalizations.of(context )!.entertainment}',
        id: 'entertainment', image: 'assets/entertainment.png'
    ) ,
    CategoryDM(
        color:  MyTheme.yellowColor, title:'${AppLocalizations.of(context )!.science}',
        id: 'science', image: 'assets/science.png'
    ) ,
    CategoryDM(
        color:  MyTheme.redLight, title:'${AppLocalizations.of(context )!.technology}',
        id: 'technology', image: 'assets/technology.png'
    ) ,
  ];

 }



}
//packages/news_app/model/categoryDM.dart 21:72                                     getCategories
// packages/news_app/category_fragment.dart 11:35                                    new
// packages/news_app/home/home_screen.dart