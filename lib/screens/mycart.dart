import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopiee/screens/checkoutpage.dart';

class MyCartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const MyCartPage({super.key, required this.cartItems});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  double get totalPrice {
    double sum = 0;
    for (var item in widget.cartItems) {
      sum += item['price'] * item['quantity'];
    }
    return sum;
  }

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
          "My Cart",
          style: GoogleFonts.montserrat(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ),

      body: widget.cartItems.isEmpty
          ? _emptyCartUI()
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(14.w),
                    itemCount: widget.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = widget.cartItems[index];
                      return _cartItemCard(item, index, pink);
                    },
                  ),
                ),
                _bottomTotalBar(totalPrice, pink),
              ],
            ),
    );
  }

  // ---------------- EMPTY CART ----------------
  Widget _emptyCartUI() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 80.sp, color: Colors.pink),
          SizedBox(height: 10.h),
          Text(
            "Your cart is empty",
            style: GoogleFonts.montserrat(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            "Add products to continue shopping",
            style: GoogleFonts.nunitoSans(
              fontSize: 14.sp,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- CART ITEM CARD ----------------
  Widget _cartItemCard(item, int index, Color pink) {
    return Container(
      margin: EdgeInsets.only(bottom: 14.h),
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Product image
          Container(
            height: 70.w,
            width: 70.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              color: Colors.grey.shade200,
              image: item['image'] != null
                  ? DecorationImage(
                      image: NetworkImage(item['image']),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
          ),

          SizedBox(width: 14.w),

          // Product details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  "₹${item['price']}",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: pink,
                  ),
                ),
              ],
            ),
          ),

          // Quantity buttons
          Row(
            children: [
              _qtyBtn(Icons.remove, () {
                if (item['quantity'] > 1) {
                  setState(() => item['quantity']--);
                }
              }),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  item['quantity'].toString(),
                  style: GoogleFonts.montserrat(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              _qtyBtn(Icons.add, () {
                setState(() => item['quantity']++);
              }),
            ],
          ),

          // Remove button
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            onPressed: () {
              setState(() {
                widget.cartItems.removeAt(index);
              });
            },
          ),
        ],
      ),
    );
  }

  // ---------------- QUANTITY BUTTON ----------------
  Widget _qtyBtn(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 28.w,
        width: 28.w,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(icon, size: 18.sp),
      ),
    );
  }

  // ---------------- TOTAL PRICE BAR ----------------
  Widget _bottomTotalBar(double total, Color pink) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Total:",
            style: GoogleFonts.montserrat(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "₹${total.toStringAsFixed(2)}",
            style: GoogleFonts.montserrat(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: pink,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: pink,
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.r),
              ),
            ),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => BuyNowPage(product: widget.cartItems),
              //   ),
              // );
            },
            child: Text(
              "Checkout",
              style: GoogleFonts.montserrat(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
