import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocalGyCardNo with ChangeNotifier{
  // int _count = 0;
  // int get count => _count;
  // void increment(){
  //   _count++;
  //   notifyListeners();
  // }

  String _localGyCardNo = '';
  String get localGyCardNo => _localGyCardNo;
  void addlocalGyCardNo(String addstr){
    _localGyCardNo = addstr;
    notifyListeners();
  }

}