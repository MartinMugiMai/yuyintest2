import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class X5BootState with ChangeNotifier{
  // int _count = 0;
  // int get count => _count;
  // void increment(){
  //   _count++;
  //   notifyListeners();
  // }

  bool _x5BootState = true;
  bool get x5BootState => _x5BootState;
  void gaix5BootState(bool stateCode){
    _x5BootState = stateCode;
    notifyListeners();
  }

}