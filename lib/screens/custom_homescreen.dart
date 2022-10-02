import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lined_bottomnavigationbar/enums/bottom_enums.dart';
import 'package:lined_bottomnavigationbar/screens/first%20page/first_page.dart';
import 'package:lined_bottomnavigationbar/screens/full_homescreen/home_screen_full.dart';
import 'package:provider/provider.dart';

import 'package:lined_bottomnavigationbar/providers/bottom%20navigation%20provider/bottom_navigation_provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  var primaryColor = const Color(0XFF03008D);

  final List<Widget> _widgetOptions = [
    const FirstPage(),
    HomeScreenFull(),
    Center(
      child: Text(ScreenUtil().scaleHeight.toString()),
    ),
    Center(
      child: Text(ScreenUtil().bottomBarHeight.toString()),
    ),
    Center(
      child: Text(ScreenUtil().statusBarHeight.toString()),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: context.watch<BottomProvider>().selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: Container(
        height: ScreenUtil().screenHeight * .1,
        width: ScreenUtil().screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: Consumer<BottomProvider>(builder: (context, provider, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomBotttomIcons(
                primaryColor: primaryColor,
                iconData: Icons.home,
                title: "Home",
                showIndicator: provider.selectedIndex == 0 ? true : false,
                callback: () => provider.changeBottomIndex(id: 0),
              ),
              CustomBotttomIcons(
                primaryColor: primaryColor,
                iconData: Icons.favorite_outline,
                title: "Favorite",
                showIndicator: provider.selectedIndex == 1 ? true : false,
                callback: () => provider.changeBottomIndex(id: 1),
              ),
              CustomBotttomIcons(
                primaryColor: primaryColor,
                iconData: Icons.add_circle_outline_outlined,
                title: "Post",
                showIndicator: provider.selectedIndex == 2 ? true : false,
                callback: () => provider.changeBottomIndex(id: 2),
              ),
              CustomBotttomIcons(
                primaryColor: primaryColor,
                iconData: Icons.chat_outlined,
                showIndicator: provider.selectedIndex == 3 ? true : false,
                title: "Inbox",
                callback: () => provider.changeBottomIndex(id: 3),
              ),
              CustomBotttomIcons(
                primaryColor: primaryColor,
                iconData: Icons.person_outline,
                title: "Account",
                showIndicator: provider.selectedIndex == 4 ? true : false,
                callback: () => provider.changeBottomIndex(id: 4),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class CustomBotttomIcons extends StatelessWidget {
  const CustomBotttomIcons({
    Key? key,
    required this.primaryColor,
    required this.iconData,
    required this.title,
    this.showIndicator,
    required this.callback,
  }) : super(key: key);

  final Color primaryColor;
  final IconData iconData;
  final String title;
  final bool? showIndicator;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        showIndicator == true
            ? Container(
                height: 5,
                width: 50,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(12)),
              )
            : Container(),
        const SizedBox(
          height: 5,
        ),
        Flexible(
          child: IconButton(onPressed: callback, icon: Icon(iconData)),
        ),
        Text(title)
      ],
    );
  }
}
