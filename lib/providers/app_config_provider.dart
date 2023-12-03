import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AppConfigProvider extends ChangeNotifier {
  //data
  String appLanguage = 'en';
  final SharedPreferences _prefs;

  AppConfigProvider(this._prefs) {
    var selectedLanguage = _prefs.getString("selectedLocale");
    if (selectedLanguage != null) {
      appLanguage = selectedLanguage;
    }

  }

  String get locale => appLanguage;


  void changeLanguage(String newlanguage) async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    appLanguage = newlanguage ;
    _prefs.setString("selectedLocale", newlanguage);
    notifyListeners();
  }

}
