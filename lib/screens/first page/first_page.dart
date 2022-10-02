import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:lined_bottomnavigationbar/appcolors/app_colors.dart';
import 'package:lined_bottomnavigationbar/models/dashboard_model.dart';
import 'package:lined_bottomnavigationbar/providers/dashboard%20provider/dashboard_provider.dart';
import 'package:lined_bottomnavigationbar/widgets/cards/custom_ads_card.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardProvider>().getDashbaordData();
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.read<DashboardProvider>();
    var util = ScreenUtil();
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: const Text("Hitech city,Madhapur"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.search),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.filter),
              ],
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(18.r), topLeft: Radius.circular(18.r)),
        child: Container(
          height: util.screenHeight,
          width: util.screenWidth,
          color: Colors.white,
          child: CustomScrollView(
            slivers: [
              //* premium card widget
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTitleWidget(title: "Premium Ads"),
                    Container(
                      height: util.screenHeight * .2,
                      child: Consumer<DashboardProvider>(
                          builder: (context, provider, _) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              provider.dashboardMOdel!.premiumAds!.length,
                          itemBuilder: (context, index) {
                            PremiumAds premiumAds =
                                provider.dashboardMOdel!.premiumAds![index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: util.screenWidth * .5,
                                      height: util.screenHeight * .3,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          color: const Color(0xff03008D),
                                          image: DecorationImage(
                                              image: NetworkImage(premiumAds
                                                  .imageUrl![0]
                                                  .toString()),
                                              fit: BoxFit.cover)),
                                    ),
                                    CustomDetialsWidget(
                                      productDistance: provider.dashboardMOdel!
                                          .recentAds![index].dist!.calculated
                                          .toString(),
                                      productName: provider.dashboardMOdel!
                                          .recentAds![index].title!
                                          .toString(),
                                      productPrice: provider.dashboardMOdel!
                                          .recentAds![index].price!
                                          .toString(),
                                      height: util.screenHeight * .080,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }),
                    ),
                  ],
                ),
              ),
              //* category widget

              SliverToBoxAdapter(
                child: Container(
                  height: util.screenHeight * .3,
                  width: util.screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomTitleWidget(
                        title: 'Category Ads',
                      ),
                      Expanded(
                        child: Consumer<DashboardProvider>(
                            builder: (context, provider, _) {
                          return ListView.builder(
                              itemCount:
                                  provider.dashboardMOdel!.premiumAds!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: ((context, index) {
                                return index == 0
                                    ? Center(child: CircularProgressIndicator())
                                    : Container(
                                        margin: EdgeInsets.all(8.h),
                                        height: util.screenHeight * .3,
                                        width: util.screenWidth * .2,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.primaries[Random()
                                                .nextInt(
                                                    Colors.primaries.length)]),
                                        child: Text(provider.dashboardMOdel!
                                            .premiumAds![index].title
                                            .toString()),
                                      );
                              }));
                        }),
                      ),
                    ],
                  ),
                ),
              ),
              SliverAppBar(
                pinned: true,
                actions: [
                  const Icon(
                    Icons.search,
                    color: Colors.purpleAccent,
                  ),
                  const Icon(
                    Icons.filter,
                    color: Colors.purpleAccent,
                  ),
                  SizedBox(
                    width: 10.w,
                  )
                ],
                backgroundColor: Colors.white,
                title: const Text(
                  "Recents Ads",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),

              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    RecentAds model =
                        provider.dashboardMOdel!.recentAds![index];
                    return index % 9 == 0
                        //* premium adds
                        ? CustomAdsCardWidget(
                            productUrl: provider
                                .dashboardMOdel!.premiumAds![index].imageUrl![0]
                                .toString(),
                            productTitle: provider
                                .dashboardMOdel!.premiumAds![index].title
                                .toString(),
                            productPrice: provider
                                .dashboardMOdel!.premiumAds![index].price
                                .toString(),
                            productDistance: provider.dashboardMOdel!
                                .premiumAds![index].dist!.location
                                .toString(),
                            favoriteCallback: () {},
                            isPrime: provider
                                .dashboardMOdel!.premiumAds![index].isPrime!)
                        //* recent cards
                        : CustomAdsCardWidget(
                            productUrl: model.imageUrl![0].toString().isNotEmpty
                                ? model.imageUrl![0].toString()
                                : "",
                            // productUrl:
                            //     "https://images.unsplash.com/photo-1591337676887-a217a6970a8a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80",
                            productTitle: model.title.toString(),
                            productPrice: model.price.toString(),
                            productDistance: model.dist!.calculated.toString(),
                            favoriteCallback: () {},
                            isPrime: model.isPrime!);
                  },
                  childCount: provider.dashboardMOdel!.recentAds!.isNotEmpty
                      ? provider.dashboardMOdel!.recentAds!.length
                      : 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDetialsWidget extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String productDistance;

  const CustomDetialsWidget({
    Key? key,
    required this.productName,
    required this.productPrice,
    required this.productDistance,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    var util = ScreenUtil();
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: height,
        width: util.screenWidth,
        color: Colors.white70,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              productName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    productPrice,
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                  AutoSizeText(
                    productName,
                    style: const TextStyle(fontSize: 20),
                    maxLines: 2,
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

class CustomTitleWidget extends StatelessWidget {
  final String title;
  const CustomTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: GoogleFonts.poppins(fontSize: 20.sp, color: Colors.black),
      ),
    );
  }
}

class CustomAppbarWidget extends StatelessWidget {
  const CustomAppbarWidget({
    Key? key,
    required this.util,
  }) : super(key: key);

  final ScreenUtil util;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: util.screenHeight * 0.020),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Hitech City Location",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.sp),
              ),
            )),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Text("Show All"),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ]),
    );
  }
}
