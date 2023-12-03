import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/my_theme.dart';

class CustomeSearchBar extends StatelessWidget {
  final fieldText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [ // SizedBox
        Expanded(
          child: TextField(
          controller: fieldText,
            decoration: InputDecoration(
              prefixIcon:   InkWell(
                onTap: (){
                  fieldText.clear();
                },
                child: Icon(
                  Icons.close,
                  size: 35,
                  color:MyTheme.primaryLightColor,
                ),
              ),
              filled: true,
              fillColor: MyTheme.whiteColor,
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
              /* -- Text and Icon -- */
              hintText: "Search Article...",
              hintStyle: const TextStyle(
                fontSize: 18,
                color: Color(0xFFB3B1B1),
              ), // TextStyle
              suffixIcon:  InkWell(
                onTap: (){

                },
                child: Icon(
                  Icons.search,
                  size: 35,
                  color:MyTheme.primaryLightColor,
                ),
              ), // Icon
              /* -- Border Styling -- */
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(45.0),
                borderSide: const BorderSide(
                  width: 2.0,
                ), // BorderSide
              ), // OutlineInputBorder
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(45.0),
                borderSide:  BorderSide(
                  width: 2.0,
                  color: MyTheme.primaryLightColor,
                ), // BorderSide
              ), // OutlineInputBorder
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(45.0),
                borderSide:  BorderSide(
                  width: 2.0,
                  color: MyTheme.primaryLightColor,
                ), // BorderSide
              ), // OutlineInputBorder
            ), // InputDecoration
          ), // TextField
        ), // Expanded
      ],
    ); // Row;
  }
}
