import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopiee/screens/checkoutpage.dart';
import 'package:shopiee/screens/mycart.dart';
import 'package:shopiee/widgets/slashed_price.dart';
import 'package:shopiee/widgets/stars.dart';

class ProductScreen extends StatefulWidget {
  final dynamic product;
  const ProductScreen({super.key, this.product});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final PageController _pageController = PageController();
  String? selectedSize;
  String? selectedButton;
  int _currentIndex = 0;
  List<Map<String, dynamic>> cartItems = [];

  final beige = const Color(0xFFF9F5EF);
  final accent = const Color(0xFFE6B8A2);
  final warmBrown = const Color(0xFF7B6F61);
  final lightText = Colors.black87;

  final List products1 = [
    {
      "name": "Rolex Oyster Perpetual Watch",
      "description":
          "Luxury automatic watch with stainless steel body, 100m water resistance, and precision Swiss movement.",
      "price": "4,99,999",
      "originalPrice": "5,49,999",
      "offerPercentage": "9% OFF",
      "rating": 4.5,
      "reviewcount": 450,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxqgG1lvakbxNtePy_DVmZ8PbysMs3-b8plw&s",
    },
    {
      "name": "Dior Sauvage Eau de Parfum – 100ml",
      "description":
          "Fresh and woody masculine fragrance featuring bergamot, amberwood, and patchouli for a lasting impression.",
      "price": "10,499",
      "originalPrice": "12,000",
      "offerPercentage": "13% OFF",
      "rating": 3.8,
      "reviewcount": 356,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt9Erd-ntAx0oaoxz3UE09uoICqd3lfSsbPQ&s",
    },
    {
      "name": "Sony WH-1000XM5 Wireless Headphones",
      "description":
          "Noise-cancelling headphones with 30-hour battery life, premium comfort, and superior audio clarity.",
      "price": "27,999",
      "originalPrice": "34,999",
      "offerPercentage": "20% OFF",
      "rating": 4.5,
      "reviewcount": 300,
      "image":
          "https://m.media-amazon.com/images/I/710YM8cBnnL._AC_UF350,350_QL80_.jpg",
    },
    {
      "name": "Nike Air Max 270 Sneakers",
      "description":
          "Trendy lifestyle sneakers with visible Air cushioning and breathable mesh upper for all-day comfort.",
      "price": "9,499",
      "originalPrice": "11,499",
      "offerPercentage": "17% OFF",
      "rating": 5.0,
      "reviewcount": 350,
      "image":
          "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.1.0&auto=format&fit=crop&q=60&w=500",
    },
    {
      "name": "Men’s Casual Cotton Printed Shirt",
      "description":
          "Soft cotton shirt with floral prints and button-down design, perfect for both work and weekends.",
      "price": "799",
      "originalPrice": "999",
      "offerPercentage": "20% OFF",
      "reviewcount": 400,
      "rating": 4.5,
      "image":
          "https://images.pexels.com/photos/428338/pexels-photo-428338.jpeg",
    },
    {
      "name": "Tecno Pova 5 Pro 5G Smartphone",
      "description":
          "68W ultra-fast charging, 50MP AI camera, 6.78″ FHD+ 120Hz display and 5000 mAh battery for gamers.",
      "price": "12,499",
      "originalPrice": "15,999",
      "offerPercentage": "22% OFF",
      "rating": 5.0,
      "reviewcount": 658,
      "image":
          "https://m.media-amazon.com/images/I/519AhQ1lOVL._AC_UF350,350_QL80_.jpg",
    },
    {
      "name": "Emerald Silver Pendant Necklace",
      "description":
          "Elegant sterling-silver chain with a natural emerald gemstone centerpiece, perfect for special occasions.",
      "price": "1,499",
      "originalPrice": "1,999",
      "offerPercentage": "25% OFF",
      "rating": 4.2,
      "reviewcount": 6598,
      "image":
          "https://media.istockphoto.com/id/1166369315/photo/white-gold-necklace-with-peridot-and-diamonds-on-black-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=HYSNQbcMQnH3qtVb-NTpom7PbznTkIFGsmd391NfhJo=",
    },
    {
      "name": "Lego Classic Creative Bricks Set (500 pcs)",
      "description":
          "Encourage imagination with 500 colorful Lego pieces, perfect for kids and adults alike.",
      "price": "2,199",
      "originalPrice": "2,799",
      "offerPercentage": "21% OFF",
      "rating": 4.0,
      "reviewcount": 5654,
      "image":
          "https://images.unsplash.com/photo-1598550476439-6847785fcea6?ixlib=rb-4.1.0&auto=format&fit=crop&q=60&w=500",
    },
  ];

  final List<String> productImages = [
    "https://images.unsplash.com/photo-1552346154-21d32810aba3?ixlib=rb-4.1.0&auto=format&fit=crop&q=80&w=870",
    "https://images.unsplash.com/photo-1552346053-c33aa8b3d665?ixlib=rb-4.1.0&auto=format&fit=crop&q=60&w=500",
    "https://images.unsplash.com/photo-1552346210-57dc21545e80?ixlib=rb-4.1.0&auto=format&fit=crop&q=60&w=500",
  ];

  void _nextPage() {
    if (_currentIndex < productImages.length - 1) {
      _currentIndex++;
    } else {
      _currentIndex = 0;
    }
    _pageController.animateToPage(
      _currentIndex,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _prevPage() {
    if (_currentIndex > 0) {
      _currentIndex--;
    } else {
      _currentIndex = productImages.length - 1;
    }
    _pageController.animateToPage(
      _currentIndex,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beige,
      appBar: AppBar(
        backgroundColor: beige,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black87,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Image.asset("assets/image/shopiee.png", height: 30),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyCartPage(cartItems: cartItems),
                ),
              );
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() => _currentIndex = index);
                    },
                    itemCount: productImages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: Hero(
                            tag: "product_${widget.product["name"]}",
                            flightShuttleBuilder:
                                (
                                  flightContext,
                                  animation,
                                  flightDirection,
                                  fromHero,
                                  toHero,
                                ) {
                                  return ScaleTransition(
                                    scale: Tween(begin: 0.95, end: 1.0).animate(
                                      CurvedAnimation(
                                        parent: animation,
                                        curve: Curves
                                            .easeOutCirc, // <-- slower, smoother
                                      ),
                                    ),
                                    child: FadeTransition(
                                      opacity: animation,
                                      child: toHero.widget,
                                    ),
                                  );
                                },
                            child: Image.network(
                              widget.product["image"],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    left: 8,
                    child: _arrowButton(Icons.arrow_back_ios_new, _prevPage),
                  ),
                  Positioned(
                    right: 8,
                    child: _arrowButton(Icons.arrow_forward_ios, _nextPage),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(productImages.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    height: 6.h,
                    width: _currentIndex == index ? 20.w : 8.w,
                    decoration: BoxDecoration(
                      color: _currentIndex == index
                          ? warmBrown
                          : warmBrown.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 18.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                "Select Size",
                style: GoogleFonts.montserrat(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: warmBrown,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                spacing: 5.w,
                children: [
                  "6 UK",
                  "7 UK",
                  "8 UK",
                  "9 UK",
                  "10 UK",
                ].map((s) => _sizeButton(s)).toList(),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product["name"],
                    style: GoogleFonts.montserrat(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                      color: warmBrown,
                    ),
                  ),
                  Text(
                    "Vision Alta Men’s Shoes All Colours",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 14.sp,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  buildRatingStars(
                    widget.product["rating"],
                    widget.product["reviewcount"],
                  ),
                  SizedBox(height: 6.h),
                  slashedPrice(
                    widget.product["originalPrice"],
                    widget.product["price"],
                    widget.product["offerPercentage"],
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "Product Details",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: warmBrown,
                    ),
                  ),
                  Text(
                    "Perhaps the most iconic sneaker of all time. This design is the cornerstone "
                    "of sneaker history, worn by legends and loved by collectors.",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 13.sp,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      _featureChip("Nearby Store", Icons.location_on_outlined),
                      SizedBox(width: 8.w),
                      _featureChip("Secure", Icons.lock_outline),
                      SizedBox(width: 8.w),
                      _featureChip(
                        "Return Policy",
                        Icons.verified_user_rounded,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 14.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 6,
                          offset: Offset(0, -2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // ADD TO CART
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              double price = double.parse(
                                widget.product["price"].replaceAll(",", ""),
                              );

                              cartItems.add({
                                "name": widget.product["name"],
                                "price": price,
                                "image": widget.product["image"],
                                "quantity": 1,
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Added to Cart")),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MyCartPage(cartItems: cartItems),
                                ),
                              );
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFE976A6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                            ),
                            child: Text(
                              "Add to Cart",
                              style: GoogleFonts.montserrat(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 12.w),

                        // BUY NOW
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      BuyNowPage(product: widget.product),
                                ),
                              );

                              // TODO: Buy now logic
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                side: BorderSide(
                                  color: Color(0xFFE976A6),
                                  width: 1.6,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                            ),
                            child: Text(
                              "Buy Now",
                              style: GoogleFonts.montserrat(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFE976A6),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.h),
                  Container(
                    height: 70.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: Color(0xFFE976A6).withOpacity(0.6),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFE976A6).withOpacity(0.05),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 8.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Delivery In",
                            style: GoogleFonts.nunitoSans(
                              fontSize: 14.sp,
                              color: warmBrown,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Within 1 Hour",
                            style: GoogleFonts.montserrat(
                              fontSize: 20.sp,
                              color: warmBrown,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 25.h),
                  Text(
                    "More Products",
                    style: GoogleFonts.montserrat(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: warmBrown,
                    ),
                  ),
                  SizedBox(height: 10.h),

                  // SizedBox(
                  //   height: 180.h,
                  //   child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: products1.length,
                  //     itemBuilder: (context, index) => _productCard(products1[index]),
                  //   ),
                  // ),
                  SizedBox(
                    height: 180.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products1.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        var item = products1[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductScreen(product: item),
                              ),
                            );
                          },
                          child: Container(
                            width:
                                MediaQuery.of(context).size.width *
                                0.42, // 🔥 2.5 cards
                            margin: EdgeInsets.only(right: 12.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // PRODUCT IMAGE
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12.r),
                                  ),
                                  child: Hero(
                                    tag: "product_${item["name"]}",
                                    child: Image.network(
                                      item["image"],
                                      height: 110.h,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                // DETAILS
                                Padding(
                                  padding: EdgeInsets.all(8.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // NAME
                                      Text(
                                        item["name"],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13.sp,
                                        ),
                                      ),

                                      SizedBox(height: 6.h),

                                      // PRICE + ORIGINAL PRICE
                                      Row(
                                        children: [
                                          Text(
                                            "₹${item["price"]}",
                                            style: GoogleFonts.montserrat(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: 6),
                                          Text(
                                            "₹${item["originalPrice"]}",
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: 11.sp,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: 4.h),

                                      // OFFER %
                                      Text(
                                        item["offerPercentage"],
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _arrowButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.15),
        ),
        child: Icon(icon, size: 15.sp, color: warmBrown),
      ),
    );
  }

  Widget _sizeButton(String size) {
    final bool isSelected = selectedSize == size;
    return InkWell(
      onTap: () => setState(() => selectedSize = isSelected ? null : size),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? Color(0xFFE976A6) : Colors.white,
          border: Border.all(color: Color(0xFFE976A6), width: 1.5),
        ),
        child: Text(
          size,
          style: GoogleFonts.montserrat(
            fontSize: 14.sp,
            color: isSelected ? Colors.white : warmBrown,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _featureChip(String text, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.brown.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(8.r),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Icon(icon, color: warmBrown, size: 14.sp),
          SizedBox(width: 4),
          Text(
            text,
            style: GoogleFonts.nunitoSans(
              fontSize: 11.sp,
              color: warmBrown,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionButton(String text, IconData icon) {
    final bool isTapped = selectedButton == text;
    return InkWell(
      onTap: () => setState(() => selectedButton = isTapped ? null : text),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isTapped ? Color(0xFFE976A6) : Colors.white,
          border: Border.all(color: Color(0xFFE976A6), width: 1.8),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20.sp, color: isTapped ? Colors.white : warmBrown),
            SizedBox(width: 6.w),
            Text(
              text,
              style: GoogleFonts.montserrat(
                fontSize: 14.sp,
                color: isTapped ? Colors.white : warmBrown,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _productCard(Map<String, dynamic> product) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      width: 150.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product["image"],
              height: 100.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product["detailedname"],
                    style: GoogleFonts.montserrat(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    product["price"],
                    style: GoogleFonts.nunitoSans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        product["originalprice"],
                        style: GoogleFonts.nunitoSans(
                          fontSize: 12.sp,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        product["offerpercentage"],
                        style: GoogleFonts.nunitoSans(
                          fontSize: 12.sp,
                          color: Colors.red[700],
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
