import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SessionStr with ChangeNotifier{
  // int _count = 0;
  // int get count => _count;
  // void increment(){
  //   _count++;
  //   notifyListeners();
  // }

  String _sessionStr = '';
  String get sessionStr => _sessionStr;
  void addSessionStr(String addstr){
    _sessionStr = addstr;
    notifyListeners();
  }

}