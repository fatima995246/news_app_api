import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDrawer extends StatelessWidget {
  Function onSideMenuItem;
  static const int categories = 1;
  static const int settings = 2;
  static const int search = 3;
  HomeDrawer({required this.onSideMenuItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.1),
            color: Theme.of(context).primaryColor,
            child: Text(
              AppLocalizations.of(context)!.appbartitle,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              onSideMenuItem(HomeDrawer.categories);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(Icons.list),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    AppLocalizations.of(context)!.categories,
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onSideMenuItem(HomeDrawer.settings);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    AppLocalizations.of(context)!.settings,
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
