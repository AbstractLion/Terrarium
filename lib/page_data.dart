import 'screens/garden.dart';
import 'package:flutter/material.dart';
import 'screens/timer.dart';

class PageData {
  static Widget getPage(int pageNumber) {
    switch(pageNumber) {
      case 0:
        return Timer();
      case 1:
        return Garden();
      case 2:
        return Timer();
      default:
        return Timer();
    }
  }
}