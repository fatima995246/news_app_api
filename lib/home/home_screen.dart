import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/category_details.dart';
import 'package:news_app/category_fragment.dart';
import 'package:news_app/home_drawer.dart';
import 'package:news_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../model/categoryDM.dart';
import '../custome_search_bar.dart';
import '../settings/settings_tab.dart';
import 'custome_search_delegate.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = 'home';
  bool searchMode=false;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
              title: Text(
                selectedMenuItem == HomeDrawer.settings
                    ? AppLocalizations.of(context)!.settings
                    : selectedCategory == null
                        ? AppLocalizations.of(context)!.appbartitle
                        : '${selectedCategory?.title}',
                style: Theme.of(context).textTheme.titleLarge,
              ),

              actions: [
                    Container(
                        margin: EdgeInsets.only(right: 40),
                        child: IconButton(
                            onPressed: () {
                              showSearch(context: context, delegate: CustomSearchDelegate());
                              setState(() {

                              });
                            },
                          icon: Icon(Icons.search,size: 35,)
                        )
                    )
              ]


            )
            ,
            drawer: Drawer(
              child: HomeDrawer(
                onSideMenuItem: onSideMenuItem,
              ),
            ),
            body: selectedMenuItem == HomeDrawer.settings
                ? SettingsTab()
                    : selectedCategory == null
                        ? CategoryFragment(
                            onCategoryClick: onCategoryClick,
                          )
                        : CataegoryDetails(category: selectedCategory!)
        )
      ],

    );
  }

  CategoryDM? selectedCategory;

  void onCategoryClick(CategoryDM newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  int selectedMenuItem = HomeDrawer.categories;
  void onSideMenuItem(int newSelectedMenuItem) {
    selectedMenuItem = newSelectedMenuItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
