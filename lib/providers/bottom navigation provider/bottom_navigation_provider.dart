import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:lined_bottomnavigationbar/enums/bottom_enums.dart';

class BottomProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void changeBottomIndex({required int id}) {
    _selectedIndex = id;
    notifyListeners();
  }
}
