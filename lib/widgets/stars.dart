// // Helper function to generate the list of star widgets
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';

// Widget buildRatingStars(double rating, int reviewcount) {
//   List<Widget> stars = [];
//   int fullStars = rating.floor(); // e.g., 4.2 -> 4
//   bool hasHalfStar =
//       (rating - fullStars) >= 0.5; // e.g., 4.2 - 4 = 0.2 < 0.5 (false)

//   // 1. Add Full Stars
//   for (int i = 0; i < fullStars; i++) {
//     stars.add(const Icon(Icons.star, color: Colors.amber, size: 14));
//   }

//   // 2. Add Half Star (if applicable)
//   if (hasHalfStar) {
//     stars.add(const Icon(Icons.star_half, color: Colors.amber, size: 14));
//   }

//   // 3. Add Empty Stars (to make a total of 5 stars)
//   int remainingStars = 5 - stars.length;
//   for (int i = 0; i < remainingStars; i++) {
//     stars.add(const Icon(Icons.star_border, color: Colors.amber, size: 14));
//   }

//   return Row(
//     children: [
//       ...stars,
//       SizedBox(width: 4.w),
//       Text(
//         "($reviewcount)",
//         style: GoogleFonts.montserrat(
//           fontSize: 12.sp,
//           color: Color.fromARGB(255, 0, 0, 0),
//         ),
//       ),
//     ],
//   );
// }



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildRatingStars(double rating, int reviewcount) {
  // 🔥 Cap the rating between 0 and 5
  double safeRating = rating.clamp(0, 5);

  List<Widget> stars = [];
  int fullStars = safeRating.floor();
  bool hasHalfStar = (safeRating - fullStars) >= 0.5;

  // 1. Full stars
  for (int i = 0; i < fullStars; i++) {
    stars.add(const Icon(Icons.star, color: Colors.amber, size: 14));
  }

  // 2. Half star
  if (hasHalfStar) {
    stars.add(const Icon(Icons.star_half, color: Colors.amber, size: 14));
  }

  // 3. Empty stars (always total 5)
  int remainingStars = 5 - stars.length;
  for (int i = 0; i < remainingStars; i++) {
    stars.add(const Icon(Icons.star_border, color: Colors.amber, size: 14));
  }

  return Row(
    children: [
      ...stars,
      SizedBox(width: 4.w),
      Text(
        "($reviewcount)",
        style: GoogleFonts.montserrat(
          fontSize: 12.sp,
          color: Colors.black,
        ),
      ),
    ],
  );
}
