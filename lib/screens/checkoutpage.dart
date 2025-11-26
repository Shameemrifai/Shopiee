import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopiee/screens/home_screen.dart';

class BuyNowPage extends StatelessWidget {
  final Map<String, dynamic> product;

  const BuyNowPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final beige = const Color(0xFFF9F5EF);
    final pink = const Color(0xFFE976A6);
    final warmBrown = const Color(0xFF7B6F61);

    double price = double.parse(
      product["price"].toString().replaceAll(",", ""),
    );

    return Scaffold(
      backgroundColor: beige,
      appBar: AppBar(
        backgroundColor: beige,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black87,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Buy Now",
          style: GoogleFonts.montserrat(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------------- PRODUCT CARD ----------------
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(14.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.network(
                      product["image"],
                      height: 80.w,
                      width: 80.w,
                      fit: BoxFit.cover,
                    ),
                  ),

                  SizedBox(width: 12.w),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product["name"],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.montserrat(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          "₹${product["price"]}",
                          style: GoogleFonts.montserrat(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: pink,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 25.h),

            // ---------------- DELIVERY TIME ----------------
            Container(
              padding: EdgeInsets.all(16.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Delivery Estimate",
                    style: GoogleFonts.montserrat(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: warmBrown,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    "Arriving in 1 Hour",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 25.h),

            // ---------------- ADDRESS ----------------
            Container(
              padding: EdgeInsets.all(16.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Deliver To",
                    style: GoogleFonts.montserrat(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: warmBrown,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Your Saved Address",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 15.sp,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // ---------------- PAY NOW ----------------
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    content: Text(
                      "Order Placed Successfully!",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: pink,
                minimumSize: Size(double.infinity, 48.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r),
                ),
              ),
              child: Text(
                "Proceed to Pay",
                style: GoogleFonts.montserrat(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
