import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lined_bottomnavigationbar/models/dashboard_model.dart';

class DashboardServices {
  final dio = Dio();
  static const url =
      "https://deep-nucleus1.azurewebsites.net/api/v1/home?lng=78.3825456&lat=17.3608&maxDistance=700000";

  static Future<DashboardMOdel> getMyAds() async {
    DashboardMOdel? dashboardModel;

    try {
      final response = await Dio().get(url);

      if (response.statusCode == 200) {
        dashboardModel = DashboardMOdel.fromJson(response.data[0]);
      }

      debugPrint(dashboardModel!.premiumAds![0].specialMention.toString());
    } on DioError catch (e) {
      debugPrint(e.toString());
    } catch (er) {
      debugPrint(er.toString());
    }
    return dashboardModel!;
  }
}
