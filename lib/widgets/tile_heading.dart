import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitleHeading extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  const CustomTitleHeading({
    Key? key,
    required this.title,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            title,
            style:
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          InkWell(
            onTap: () => callback,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Show All",
                  style: GoogleFonts.poppins(color: Colors.grey.shade600),
                ),
                Icon(
                  Icons.skip_next_sharp,
                  color: Colors.grey.shade600,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
