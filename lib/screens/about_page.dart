import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
          "About Shopiee",
          style: GoogleFonts.montserrat(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(18.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ------------------- LOGO -------------------
            Center(
              child: Container(
                height: 110.w,
                width: 110.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(26.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Image.asset(
                  "assets/image/shopiee.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),

            SizedBox(height: 22.h),

            // ------------------- TITLE -------------------
            Center(
              child: Text(
                "Shopiee",
                style: GoogleFonts.montserrat(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
            ),

            SizedBox(height: 10.h),

            Center(
              child: Text(
                "Your trusted online shopping experience",
                textAlign: TextAlign.center,
                style: GoogleFonts.nunitoSans(
                  fontSize: 15.sp,
                  color: Colors.black54,
                ),
              ),
            ),

            SizedBox(height: 25.h),

            // ------------------- ABOUT TEXT -------------------
            Text(
              "What is Shopiee?",
              style: GoogleFonts.montserrat(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),

            SizedBox(height: 10.h),

            Text(
              "Shopiee is a modern e-commerce application designed to deliver a fast, smooth, and user-friendly online shopping experience. "
              "Browse through categories, explore detailed product information, manage your wishlist and cart, and enjoy a seamless checkout flow.",
              textAlign: TextAlign.justify,
              style: GoogleFonts.nunitoSans(
                fontSize: 15.sp,
                height: 1.5,
                color: Colors.black87,
              ),
            ),

            SizedBox(height: 24.h),

            Text(
              "Features",
              style: GoogleFonts.montserrat(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),

            SizedBox(height: 10.h),

            _featureItem("Clean and minimal user interface"),
            _featureItem("Category-based product browsing"),
            _featureItem("Responsive product details"),
            _featureItem("Cart with total calculation"),
            _featureItem("Wishlist, offers & deals"),
            _featureItem("Form validation for secure inputs"),
            _featureItem("Local database for caching and offline support"),
            _featureItem("Settings & profile management"),

            SizedBox(height: 25.h),

            Center(
              child: Text(
                "Version 1.0.0",
                style: GoogleFonts.nunitoSans(
                  fontSize: 14.sp,
                  color: Colors.black54,
                ),
              ),
            ),

            SizedBox(height: 12.h),

            Center(
              child: Text(
                "Developed with ❤️ using Flutter",
                style: GoogleFonts.montserrat(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: pink,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _featureItem(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        children: [
          Icon(Icons.check_circle_outline, color: Colors.pink, size: 20.sp),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.nunitoSans(
                fontSize: 15.sp,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
