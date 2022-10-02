
import 'package:flutter/material.dart';
import 'package:lined_bottomnavigationbar/models/dashboard_model.dart';
import 'package:lined_bottomnavigationbar/services/dashboard_services.dart';

class DashboardProvider extends ChangeNotifier {
  DashboardMOdel? dashboardMOdel;

  Future<DashboardMOdel> getDashbaordData() async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      var model = await DashboardServices.getMyAds();
      dashboardMOdel = model;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
    return dashboardMOdel!;
  }
}
