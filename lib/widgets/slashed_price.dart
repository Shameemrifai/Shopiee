import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget slashedPrice(
  String originalprice,
  String currentprice,
  String offerpercentage,
) {
  return Row(
    // crossAxisAlignment:
    //     CrossAxisAlignment.baseline,
    // textBaseline: TextBaseline
    //     .alphabetic,
    children: [
      Text(
        "₹$originalprice",
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          color: Colors.grey,
          decoration: TextDecoration.lineThrough,
          decorationColor: Colors.grey,
        ),
      ),
      SizedBox(width: 5.w),
      Text(
        "₹$currentprice",
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      SizedBox(width: 5.w),
      Text(
        offerpercentage,
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
          color: const Color.fromARGB(255, 255, 156, 126),
        ),
      ),
    ],
  );
}
