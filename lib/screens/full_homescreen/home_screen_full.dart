import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:lined_bottomnavigationbar/appcolors/app_colors.dart';
import 'package:lined_bottomnavigationbar/models/dashboard_model.dart';
import 'package:lined_bottomnavigationbar/widgets/cards/custom_ads_card.dart';
import 'package:lined_bottomnavigationbar/widgets/tile_heading.dart';

import '../../providers/dashboard provider/dashboard_provider.dart';

class HomeScreenFull extends StatefulWidget {
  HomeScreenFull({Key? key}) : super(key: key);

  @override
  State<HomeScreenFull> createState() => _HomeScreenFullState();
}

class _HomeScreenFullState extends State<HomeScreenFull> {
  @override
  void initState() {
    context.read<DashboardProvider>().getDashbaordData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var util = ScreenUtil();
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Home-Premium-Ads",
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
                color: Colors.white),
            height: 1.sh,
            width: 1.sw,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: CustomPremiumAdsWidget(util),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                      height: util.screenHeight * .3,
                      child: Container(
                        color: Colors.black,
                      )),
                ),
                SliverFillRemaining(
                  child: Container(color: Colors.yellow),
                )
              ],
            )),
      ),
    ));
  }

  SizedBox CustomPremiumAdsWidget(ScreenUtil util) {
    return SizedBox(
        height: util.screenHeight * .27,
        width: util.screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomTitleHeading(title: "Premium Ads", callback: () {}),
            Expanded(child:
                Consumer<DashboardProvider>(builder: (context, provider, _) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: provider.dashboardMOdel!.premiumAds!.length,
                itemBuilder: (BuildContext context, int index) {
                  PremiumAds model =
                      provider.dashboardMOdel!.premiumAds![index];
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(30.r),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Card(
                        elevation: 7,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              height: util.screenHeight * 3,
                              width: 220.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border:
                                      Border.all(color: Colors.grey.shade500),
                                  color: Colors.primaries[Random()
                                      .nextInt(Colors.primaries.length)],
                                  image: DecorationImage(
                                      image: NetworkImage(model.imageUrl![0]),
                                      fit: BoxFit.cover)),
                            ),

                            //* details widget
                            CustomBottomDetails(
                                width: 220.w,
                                height: util.screenHeight * .075,
                                productDistance: model.price.toString(),
                                productPrice: model.price.toString(),
                                productname: model.title.toString()),

                            //* favorite widget
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: EdgeInsets.all(8.sp),
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey.shade600,
                                  child: const Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }))
          ],
        ));
  }
}

class CustomBottomDetails extends StatelessWidget {
  const CustomBottomDetails({
    Key? key,
    required this.height,
    required this.productname,
    required this.productPrice,
    required this.productDistance,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;
  final String productname;
  final String productPrice;
  final String productDistance;

  @override
  Widget build(BuildContext context) {
    var util = ScreenUtil();
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.r),
            bottomRight: Radius.circular(10.r),
          ),
        ),
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              overflow: TextOverflow.ellipsis,
              productname,
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "" + productPrice,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade800),
                  ),
                  Text(
                    "$productDistance ",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade800),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
