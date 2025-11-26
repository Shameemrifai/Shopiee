import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class YourOrdersPage extends StatelessWidget {
  const YourOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final beige = const Color(0xFFF9F5EF);
    final pink = const Color(0xFFE976A6);

    return Scaffold(
      backgroundColor: beige,
      appBar: AppBar(
        backgroundColor: beige,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Your Orders",
          style: GoogleFonts.montserrat(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ),

      body: _emptyOrdersUI(),
    );
  }

  // --------------- EMPTY UI ------------------
  Widget _emptyOrdersUI() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.receipt_long_outlined, size: 80.sp, color: Colors.pink),
          SizedBox(height: 10.h),
          Text(
            "No Orders Yet",
            style: GoogleFonts.montserrat(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            "Your past orders will appear here",
            style: GoogleFonts.nunitoSans(
              fontSize: 14.sp,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
