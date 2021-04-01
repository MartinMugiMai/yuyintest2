import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocalRealName with ChangeNotifier{
  // int _count = 0;
  // int get count => _count;
  // void increment(){
  //   _count++;
  //   notifyListeners();
  // }

  String _localRealName = '';
  String get localRealName => _localRealName;
  void addLocalRealName(String addstr){
    _localRealName = addstr;
    notifyListeners();
  }

}