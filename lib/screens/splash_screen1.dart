import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopiee/screens/login_screen.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  List list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/image/background.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(top: 200.sp),
            child: Center(
              child: Column(
                children: [
                  Image.asset("assets/image/shopiee.png"),
                  Text(
                    "Let's Get Started",
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      //   fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      fontSize: 30.sp,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  // Image.asset("assets/image/carosel.png", width: 300),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      design_container(
                        Icons.person_add_rounded,
                        "Create Account",
                      ),
                      SizedBox(width: 10),
                      design_container(
                        Icons.ads_click_rounded,
                        "Browse Products",
                      ),
                      SizedBox(width: 10),
                      design_container(
                        Icons.wallet_giftcard_rounded,
                        "Start Shopping!",
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  button(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextButton button(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.pink,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 44),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(30),
        ),
      ),
      child: Text(
        "Get Started",
        style: GoogleFonts.montserrat(
          //fontFamily: "Montserrat",
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Container design_container(IconData icon, String text) {
    return Container(
      height: 70.h,
      width: 80.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.5),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(255, 255, 255, 255),
        border: Border.all(
          color: const Color.fromARGB(255, 241, 124, 163),
          width: 1.0.sp,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: const Color.fromARGB(255, 241, 124, 163)),
          SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(
              fontSize: 9.sp,
              color: Colors.pink,
              fontFamily: "Nunito Sans",
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
////////////////
////////////////
//////// new code
///

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shopiee/screens/login_screen.dart';

// class SplashScreen1 extends StatefulWidget {
//   const SplashScreen1({super.key});

//   @override
//   State<SplashScreen1> createState() => _SplashScreen1State();
// }

// class _SplashScreen1State extends State<SplashScreen1> {
//   List list = [];
//   @override
//   Widget build(BuildContext context) {
//     final Color backgroundBeige = const Color(0xFFF9F5EF);
//     final Color cardWhite = Colors.white;
//     final Color accentBrown = const Color(0xFF7B6F61);
//     final Color borderGray = const Color(0xFFD9CFC2);

//     return Scaffold(
//       backgroundColor: backgroundBeige,
//       body: Stack(
//         children: [
//           // Replace with your professional beige textured background image
//           // Opacity(
//           //   opacity: 0.12,
//           //   child: Image.asset(
//           //     'assets/image/bg_texture.png', // replace with your preferred image
//           //     width: double.infinity,
//           //     height: double.infinity,
//           //     fit: BoxFit.cover,
//           //   ),
//           // ),
//           Padding(
//             padding: EdgeInsets.only(top: 200.sp),
//             child: Center(
//               child: Column(
//                 children: [
//                   Image.asset("assets/image/shopiee.png",height: 50,),
//                   SizedBox(height: 20.h),
//                   Text(
//                     "Let's Get Started",
//                     style: GoogleFonts.montserrat(
//                       color: accentBrown,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 30.sp,
//                     ),
//                   ),
//                   SizedBox(height: 30.h),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       design_container(
//                         Icons.person_add_rounded,
//                         "Create Account",
//                         cardWhite,
//                         accentBrown,
//                         borderGray,
//                       ),
//                       SizedBox(width: 10.w),
//                       design_container(
//                         Icons.ads_click_rounded,
//                         "Browse Products",
//                         cardWhite,
//                         accentBrown,
//                         borderGray,
//                       ),
//                       SizedBox(width: 10.w),
//                       design_container(
//                         Icons.wallet_giftcard_rounded,
//                         "Start Shopping!",
//                         cardWhite,
//                         accentBrown,
//                         borderGray,
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 50.h),
//                   button(context, accentBrown),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   TextButton button(BuildContext context, Color accentBrown) {
//     return TextButton(
//       onPressed: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const LoginScreen()),
//         );
//       },
//       style: TextButton.styleFrom(
//         foregroundColor: Colors.white,
//         backgroundColor: accentBrown,
//         padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 44.w),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30),
//         ),
//       ),
//       child: Text(
//         "Get Started",
//         style: GoogleFonts.montserrat(
//           fontWeight: FontWeight.w500,
//           fontSize: 16.sp,
//         ),
//       ),
//     );
//   }

//   Container design_container(
//     IconData icon,
//     String text,
//     Color cardWhite,
//     Color accentBrown,
//     Color borderGray,
//   ) {
//     return Container(
//       height: 70.h,
//       width: 80.w,
//       decoration: BoxDecoration(
//         color: cardWhite,
//         borderRadius: BorderRadius.circular(15),
//         border: Border.all(
//           color: borderGray,
//           width: 1.0.sp,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: accentBrown.withOpacity(0.25),
//             blurRadius: 8,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, color: accentBrown),
//           SizedBox(height: 10.h),
//           Text(
//             text,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 9.sp,
//               color: accentBrown,
//               fontFamily: "Nunito Sans",
//               fontWeight: FontWeight.w900,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
