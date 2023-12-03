import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/news_container.dart';
import 'package:news_app/tab_item.dart';

import 'model/SourceResponse.dart';

class TabContainer extends StatefulWidget {
 List<Source> soursesList ;
 TabContainer({required this.soursesList});

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
 int selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:widget.soursesList.length,
      child:Column(
        children: [
          TabBar(
            onTap: (index){
            selectedIndex = index ;
            setState(() {

            });

            },
            isScrollable: true,
              indicatorColor:Colors.transparent ,
              tabs:widget.soursesList.map((source) => TabItem(
                  source: source,
                  isSelected: selectedIndex == widget.soursesList.indexOf(source)
              )).toList()
          ),
          Expanded(child: NewsContainer(source:widget.soursesList[selectedIndex] ))
        ],
      ) ,);
  }
}
