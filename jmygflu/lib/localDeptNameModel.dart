import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocalDeptName with ChangeNotifier{
  // int _count = 0;
  // int get count => _count;
  // void increment(){
  //   _count++;
  //   notifyListeners();
  // }

  String _localDeptName = '';
  String get localDeptName => _localDeptName;
  void addlocalDeptName(String addstr){
    _localDeptName = addstr;
    notifyListeners();
  }

}