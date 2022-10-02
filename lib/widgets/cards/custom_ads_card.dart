import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lined_bottomnavigationbar/screens/first%20page/first_page.dart';

class CustomAdsCardWidget extends StatelessWidget {
  final String? productUrl;
  final String productTitle;
  final String productPrice;
  final String productDistance;
  final VoidCallback favoriteCallback;
  final bool isPrime;
  const CustomAdsCardWidget({
    Key? key,
    this.productUrl,
    required this.productTitle,
    required this.productPrice,
    required this.productDistance,
    required this.favoriteCallback,
    required this.isPrime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var util = ScreenUtil();
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        //* photo widget
        Container(
          height: util.screenHeight * .5,
          width: util.screenWidth,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(
                  image: NetworkImage(productUrl ??
                      "https://images.unsplash.com/photo-1591337676887-a217a6970a8a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80s"),
                  fit: BoxFit.cover)),
        ),
        //* isprime add widget
        isPrime == true
            ? Positioned(
                top: 20.h,
                left: 0,
                child: Container(
                  height: util.screenHeight * .020,
                  width: util.screenWidth * .075,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12.r),
                        bottomRight: Radius.circular(12.r)),
                    color: Colors.red,
                  ),
                  child: Text(
                    "Paid",
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontSize: 10.sp),
                  ),
                ))
            : Container(),
        //* favorite icon widget
        Positioned(
            top: 10.h,
            right: 0.w,
            child: IconButton(
                onPressed: favoriteCallback,
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ))),
        CustomDetialsWidget(
          productDistance: productDistance,
          productName: productTitle,
          productPrice: productPrice,
          height: util.screenHeight * .060,
        ),
      ],
    );
  }
}
