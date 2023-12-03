import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/category_item.dart';
import 'package:news_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'model/categoryDM.dart';

class CategoryFragment extends StatelessWidget {

  Function  onCategoryClick ;
  CategoryFragment({required this.onCategoryClick});



  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var CategoriesList = CategoryDM.getCategories(context);
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('${AppLocalizations.of(context)!.pick} \n${AppLocalizations.of(context)!.ofinterst}',
              style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: 15,),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
              itemBuilder: (context, int index) {
                return
                  InkWell(
                      onTap: (){
                   onCategoryClick(CategoriesList[index]);
                  },
                      child: CategoryItem(category: CategoriesList[index], index: index));
              },
              itemCount: CategoriesList.length,
            ),
          )
        ],
      ),
    );
  }
}
