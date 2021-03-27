
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Helper{

  BuildContext context ;
  DateTime currentBackPressTime;

  Helper.of(BuildContext _context){
    this.context = _context;
  }

  Future<bool> onWillPop(){
    DateTime now = DateTime.now();
    if(currentBackPressTime == null || now.difference(currentBackPressTime)>Duration(seconds: 2)){
      currentBackPressTime = now;
      return Future.value(false);
    }
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(true);
  }

}