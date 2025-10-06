
// import 'package:flutter/material.dart';

// class TitleProvider with ChangeNotifier {
//   String _title = "Hilya";

//   String get title => _title;

//   void updateTitle(String newTitle) {
//     _title = newTitle;
//     notifyListeners(); 
//   }
// }

import 'package:flutter/material.dart';
import 'package:hello_world/userDataModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'userDataModel.dart';



class Userdetailsprovider with ChangeNotifier{
  UserData? _user;
bool _isLoading = false;

UserData? get user => _user;
  bool get isLoading => _isLoading;





}
