import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopiee/screens/about_page.dart';
import 'package:shopiee/screens/categories.dart';
import 'package:shopiee/screens/login_screen.dart';
import 'package:shopiee/screens/mycart.dart';
import 'package:shopiee/screens/orderpage.dart';
import 'package:shopiee/screens/product_screen.dart';
import 'package:shopiee/screens/profile_screen.dart';
import 'package:shopiee/screens/searchscreen.dart';
import 'package:shopiee/screens/settings_screen.dart';
import 'package:shopiee/widgets/inlineads.dart';
import 'package:shopiee/widgets/stars.dart';
import '../widgets/localdb/databasehelper.dart';

class HomeScreen extends StatefulWidget {
  final dynamic userData;
  const HomeScreen({super.key, this.userData});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  late Timer timer;
  final PageController pageController = PageController();
  BannerAd? _bannerAd;
  bool _isAdloaded = false;

  // Use your product, product1, imageUrls, and carousel data as defined originally

  final List imageUrls = [
    {
      "name": "Watches",
      "image":
          'https://images.unsplash.com/photo-1546868871-7041f2a55e12?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1ODc3NjR8MHwxfHNlYXJjaHwxfHxlY29tbWVyY2UlMjBwcm9kdXNjdHN8ZW58MHx8fDE3MTU3NzY0NzZ8MA&ixlib=rb-4.0.3&q=80&w=1080', // General products
    },
    {
      "name": "Perfumes",
      "image":
          'https://images.unsplash.com/photo-1567721913486-6585f069b332?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=388',
    },
    {
      "name": "Headphones",
      "image":
          'https://images.unsplash.com/photo-1550009158-9ebf69173e03?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1ODc3NjR8MHwxfHNlYXJjaHwxfHxsYXB0b3B8ZW58MHwwfHx8fDE3MTU3NzY3OTB8MA&ixlib=rb-4.0.3&q=80&w=1080', // Laptop
    },
    {
      "name": "Shoes",
      "image":
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1ODc3NjR8MHwxfHNlYXJjaHwxfHtzbmVha2Vyc3xlbnwwfDB8fHwxNzE1NzcxNzYyfDA&ixlib=rb-4.0.3&q=80&w=1080', // Sneakers
    },
    {
      "name": "Clothes",
      "image":
          'https://plus.unsplash.com/premium_photo-1722643227353-aed9dbdd00ce?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=870',
    },
    {
      "name": "Mobiles",
      "image":
          'https://images.unsplash.com/photo-1522273400909-fd1a8f77637e?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1412',
    },
    {
      "name": "Cameras",
      "image":
          'https://images.unsplash.com/photo-1640890959827-6307611b34a1?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=327',
    },
    {
      "name": "Air pods",
      "image":
          'https://images.unsplash.com/photo-1572569511254-d8f925fe2cbb?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=989',
    },
    {
      "name": "Cosmetics",
      "image":
          'https://images.unsplash.com/photo-1598460880248-71ec6d2d582b?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8ODZ8fHByb2R1Y3RzfGVufDB8fDB8fHww&auto=format&fit=crop&q=60&w=500',
    },
    {
      "name": "Toys",
      "image":
          'https://images.unsplash.com/photo-1599623560574-39d485900c95?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=870',
    },
  ];

  final List products = [
    {
      "name": "Coastal Linen Blend Shirt", // Aesthetic and descriptive name
      "price": "1500",
      "originalPrice": "2499",
      "offerPercentage": "40% Off",
      "image":
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSpe-cb14RUm0iRSY_StK3lPeejFdFmYx9_vaS50SaIDIKzZZcG6jugDQxNvuEAXa7TlnF2-AR2hDmI-O9RwqlPsss9kmiFJ7GHaqKJ-WKwb5GGwnsRKHHkoN_NVToJoCEd-uIaymsm&usqp=CAc",
      "description":
          "A breathable, lightweight linen blend shirt in a relaxed fit. Perfect for casual outings, beach trips, or stylish layering.",
      "rating": 4.0,
      "reviewcount": 500,
      "offer": "15% off today",
    },
    {
      "name": "Nike Shoe",
      "originalPrice": "2499",
      "offerPercentage": "40% Off",
      "price": "1300",
      "image":
          "https://images.unsplash.com/photo-1600269452121-4f2416e55c28?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=465",
      "description":
          "High-performance Nike sports shoe with superior cushioning and durable outsole for all-day comfort.",
      "rating": 4.6,
      "reviewcount": 500,
      "offer": "Buy one, get 20% off second pair",
    },
    {
      "name": "Tecno Pova 5pro",
      "originalPrice": "2499",
      "offerPercentage": "40% Off",
      "price": "12,499",
      "image":
          "https://m.media-amazon.com/images/I/519AhQ1lOVL._AC_UF350,350_QL80_.jpg",
      "description":
          "Tecno Pova 5 Pro 5G – featuring 68W ultra fast charging, 50MP AI dual camera and 6.78″ FHD+ 120 Hz display. :contentReference[oaicite:0]{index=0}",
      "rating": 4.1,
      "reviewcount": 500,
      "offer": "Available from ₹12,499 – save ~22%",
    },
    {
      "name": "Emerald Locket",
      "originalPrice": "2499",
      "offerPercentage": "40% Off",
      "price": "1500",
      "image":
          "https://media.istockphoto.com/id/1166369315/photo/white-gold-necklace-with-peridot-and-diamonds-on-black-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=HYSNQbcMQnH3qtVb-NTpom7PbznTkIFGsmd391NfhJo=",
      "description":
          "Elegant emerald-set locket pendant in sterling silver housing a genuine green emerald, ideal for timeless jewelry wear.",
      "rating": 4.7,
      "reviewcount": 500,
      "offer": "Free cleaning service for first year",
    },
    {
      "name": "Woodland Shoes",
      "originalPrice": "2499",
      "offerPercentage": "40% Off",
      "price": "3000",
      "image":
          "https://images.pexels.com/photos/298863/pexels-photo-298863.jpeg",
      "description":
          "Woodland rugged outdoor shoes – crafted from wear-resistant nubuck, rubber sole and cushioned collar for added comfort. :contentReference[oaicite:1]{index=1}",
      "rating": 4.4,
      "reviewcount": 500,
      "offer": "Flat ₹500 off on first purchase",
    },
  ];
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

  final List image = [
    "https://img.freepik.com/free-psd/mega-offer-50-percent-off-sale-banner-design-editable-template_47987-13077.jpg?semt=ais_hybrid&w=740&q=80",
    "https://www.shutterstock.com/image-vector/special-offer-banner-vector-template-260nw-2474802375.jpg",
    "https://static.vecteezy.com/system/resources/thumbnails/011/593/341/small/special-offer-banner-template-design-for-web-or-social-media-vector.jpg",
  ];
  //////
  // Countdown
  ///

  void showDeleteDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Delete Account"),
          content: Text("Are you sure you want to delete your account?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                deleteAccount();
              },
              child: Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  DateTime saleEndTime = DateTime.now().add(Duration(hours: 5));
  late Timer countdownTimer;
  Duration timeLeft = Duration.zero;
  ///////
  //////
  //////
  @override
  void initState() {
    loaduser();
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 3), (Timer t) {
      if (currentIndex < image.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });

    timeLeft = saleEndTime.difference(DateTime.now());

    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      final diff = saleEndTime.difference(DateTime.now());
      if (diff.isNegative) {
        timer.cancel();
      }
      setState(() {
        timeLeft = diff;
      });
    });
  }

  void _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("name");
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  void loaduser() async {
    final datas = await DatabaseHelper().getUsers();
    print("AAAAAAAAAAAAA$datas");
    debugPrint("Hi $datas");
  }

  // void _loadbannerAd() {
  //   _bannerAd = BannerAd(
  //     size: AdSize.largeBanner,
  //     adUnitId: 'ca-app-pub-3940256099942544/9214589741',
  //     listener: BannerAdListener(
  //       onAdLoaded: (ad) {
  //         setState(() {
  //           _isAdloaded = true;
  //         });
  //       },
  //       onAdFailedToLoad: (ad, error) {
  //         ad.dispose();
  //         print("Ad failed to load:$error");
  //       },
  //     ),
  //     request: AdRequest(),
  //   )..load();
  // }

  @override
  void dispose() {
    timer.cancel();
    //  _bannerAd?.dispose();
    countdownTimer.cancel();
    pageController.dispose();
    super.dispose();
  }

  void deleteAccount() async {
    final deleted = await DatabaseHelper().deleteUserByName(
      widget.userData["name"],
    );

    if (deleted > 0) {
      // Successfully deleted
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Account deleted successfully"),
          backgroundColor: Colors.redAccent,
        ),
      );

      // Navigate to login page
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false,
        );
      });
    } else {
      // No user found OR failed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error deleting account"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Modern palette
    final beige = const Color(0xFFF9F5EF); // Light beige for background
    final cardBackground = Colors.white; // Cards and containers
    final accent = const Color(0xFFE9CFC6); // Slightly deeper beige for accents

    return Scaffold(
      backgroundColor: beige,
      drawer: SizedBox(
        width: 200.w,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // ---------------- HEADER ----------------
              DrawerHeader(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Color(0xFFF9F5EF), Color(0xFFE976A6)],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: Colors.pink, size: 32),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Welcome to Shopiee",
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        color: Colors.pink,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Explore the best deals!",
                      style: GoogleFonts.nunitoSans(
                        fontSize: 13,
                        color: Colors.pink,
                      ),
                    ),
                  ],
                ),
              ),

              // ---------------- MENU ITEMS ----------------
              _drawerItem(Icons.home_outlined, "Home", () {
                Navigator.pop(context);
              }),

              _drawerItem(Icons.category_outlined, "Categories", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Searchscreen()),
                );
              }),

              _drawerItem(Icons.shopping_cart_outlined, "My Cart", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyCartPage(cartItems: []),
                  ),
                );
              }),

              _drawerItem(Icons.receipt_long_outlined, "Your Orders", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => YourOrdersPage()),
                );
              }),

              //   _drawerItem(Icons.local_offer_outlined, "Offers", () {}),
              Divider(),

              _drawerItem(Icons.settings_outlined, "Settings", () {
                //                Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsPage(data:widget.userData)));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(data: widget.userData),
                  ),
                );
              }),

              _drawerItem(Icons.info_outline, "About", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              }),

              Divider(),

              _drawerItem(Icons.logout, "Logout", () {
                _logout();
              }, color: Colors.red),

              Divider(),
              _drawerItem(Icons.delete, "Delete Account", () {
                showDeleteDialog();
              }, color: Colors.red),
            ],
          ),
        ),
      ),

      appBar: AppBar(
        elevation: 0,
        //  backgroundColor: cardBackground,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                // Color.fromARGB(255, 255, 252, 253),
                Color(0xFFF9F5EF),
                Color(0xFFE976A6),
                // Color(0xFFC7417B),
              ],
            ),
          ),
        ),

        centerTitle: true,
        iconTheme: IconThemeData(
          color: const Color.fromARGB(255, 241, 124, 163),
        ),
        title: Image.asset('assets/image/shopiee.png', height: 30.h),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              color: Colors.pink,
            );
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProfileScreen(username: widget.userData),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundColor: accent,
                child: Icon(Icons.person, color: Colors.pink, size: 25.sp),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                Container(
                  decoration: BoxDecoration(
                    color: cardBackground,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(
                          255,
                          241,
                          124,
                          163,
                        ).withOpacity(0.06),
                        // color: Colors.pink,
                        offset: Offset(0, 1),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: TextFormField(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Searchscreen()),
                      );
                    },
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: "Search products...",
                      prefixIcon: Icon(
                        Icons.search,
                        // color: const Color.fromARGB(255, 241, 124, 163),
                        color: Colors.pink,
                      ),
                      suffixIcon: Icon(
                        Icons.mic,
                        //color: const Color.fromARGB(255, 241, 124, 163)
                        color: Colors.pink,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.pink.shade300,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                // Category Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: GoogleFonts.montserrat(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        // color: const Color.fromARGB(255, 241, 124, 163),
                        color: Colors.pink,
                      ),
                    ),
                    Row(
                      children: [
                        _containerButton("Sort", Icons.swap_vert, accent),
                        SizedBox(width: 10.w),
                        _containerButton("Filter", Icons.filter_alt, accent),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8.h),

                // Category Circles
                SizedBox(
                  height: 74.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageUrls.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Categories(
                                categoryname: imageUrls[index]["name"],
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 9.w),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 28.r,
                                backgroundImage: NetworkImage(
                                  imageUrls[index]["image"],
                                ),
                                backgroundColor: accent,
                              ),
                              SizedBox(height: 6.h),
                              Text(
                                imageUrls[index]["name"],
                                style: GoogleFonts.montserrat(
                                  fontSize: 10.sp,
                                  color: Colors.brown[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 18.h),

                // Carousel Offers
                SizedBox(
                  height: 160.h,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: image.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          image: DecorationImage(
                            image: NetworkImage(image[index]),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 12,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 22.h),

                // ---------------- FEATURED PRODUCTS ----------------
                Text(
                  "Featured Products",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: Colors.pink,
                  ),
                ),

                SizedBox(height: 10.h),

                SizedBox(
                  height: 230.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      var item = products[index];

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
                            borderRadius: BorderRadius.circular(13.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // IMAGE
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(13.r),
                                ),
                                child: Hero(
                                  tag: "product_${item["name"]}",
                                  flightShuttleBuilder:
                                      (
                                        flightContext,
                                        animation,
                                        flightDirection,
                                        fromHero,
                                        toHero,
                                      ) {
                                        return ScaleTransition(
                                          scale: Tween(begin: 0.95, end: 1.0)
                                              .animate(
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
                                    item["image"],
                                    height: 110.h,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              // MAIN DETAILS
                              Padding(
                                padding: EdgeInsets.all(8.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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

                                    SizedBox(height: 4.h),

                                    // DESCRIPTION
                                    Text(
                                      item["description"],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 10.sp,
                                        color: Colors.pink,
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
                                        SizedBox(width: 6.w),
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

                                    SizedBox(height: 3.h),

                                    // OFFER
                                    Text(
                                      item["offerPercentage"],
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),

                                    SizedBox(height: 6.h),

                                    // ⭐ RATING + (reviews)
                                    buildRatingStars(
                                      item["rating"],
                                      item["reviewcount"],
                                    ),
                                    SizedBox(width: 4),
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

                // Static Offer Images
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Image.asset("assets/image/Special Offers.png"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  //child: Image.asset("assets/image/mac.png"),
                  child: InlineBannerAdWidget(),
                ),
                SizedBox(height: 10),

                // Product Container 2
                // Text(
                //   "Premium Deals",
                //   style: GoogleFonts.montserrat(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 16.sp,
                //     //color: const Color.fromARGB(255, 241, 124, 163),
                //     color: Colors.pink,
                //   ),
                // ),
                // SizedBox(height: 10.h),
                // SizedBox(
                //   height: 180.h,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: products1.length,
                //     itemBuilder: (context, index) {
                //       final product = products1[index];
                //       return Padding(
                //         padding: const EdgeInsets.only(left: 10, right: 5),
                //         child: GestureDetector(
                //           onTap: () {
                //             Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (context) =>
                //                     ProductScreen(product: product),
                //               ),
                //             );
                //           },
                //           child: Container(
                //             height: 180.h,
                //             width: 150.w,
                //             decoration: BoxDecoration(
                //               color: cardBackground,
                //               borderRadius: BorderRadius.circular(12.r),
                //               boxShadow: [
                //                 BoxShadow(
                //                   color: const Color.fromARGB(
                //                     255,
                //                     241,
                //                     124,
                //                     163,
                //                   ).withOpacity(0.09),
                //                   blurRadius: 10,
                //                   offset: Offset(0, 5),
                //                 ),
                //               ],
                //             ),
                //             child: ClipRRect(
                //               borderRadius: BorderRadius.circular(12.r),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Container(
                //                     height: 100.h,
                //                     width: double.infinity,
                //                     child: Image.network(
                //                       product["image"],
                //                       fit: BoxFit.cover,
                //                     ),
                //                   ),
                //                   Padding(
                //                     padding: const EdgeInsets.all(8.0),
                //                     child: Column(
                //                       crossAxisAlignment:
                //                           CrossAxisAlignment.start,
                //                       children: [
                //                         Text(
                //                           product["name"],
                //                           style: GoogleFonts.montserrat(
                //                             fontSize: 14.sp,
                //                             fontWeight: FontWeight.w500,
                //                           ),
                //                           maxLines: 1,
                //                           overflow: TextOverflow.ellipsis,
                //                         ),
                //                         SizedBox(height: 4),
                //                         Text(
                //                           "₹${product["price"]}",
                //                           style: TextStyle(
                //                             fontWeight: FontWeight.bold,
                //                             fontSize: 13.sp,
                //                           ),
                //                         ),
                //                         SizedBox(height: 2.h),
                //                         Row(
                //                           crossAxisAlignment:
                //                               CrossAxisAlignment.baseline,
                //                           textBaseline: TextBaseline.alphabetic,
                //                           children: [
                //                             Text(
                //                               "₹${product["originalPrice"]}",
                //                               style: TextStyle(
                //                                 fontSize: 12.sp,
                //                                 color: Colors.grey,
                //                                 decoration:
                //                                     TextDecoration.lineThrough,
                //                               ),
                //                             ),
                //                             SizedBox(width: 5.w),
                //                             Text(
                //                               product["offerPercentage"],
                //                               style: TextStyle(
                //                                 color: Colors.red[700],
                //                                 fontSize: 12.sp,
                //                               ),
                //                             ),
                //                           ],
                //                         ),
                //                       ],
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),

                // ---------------- PREMIUM DEALS ----------------
                Text(
                  "Premium Deals",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: Colors.pink,
                  ),
                ),

                SizedBox(height: 10.h),

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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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

                //SizedBox(height: 40.h),
                SizedBox(height: 20.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15.w),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.pink.shade400, Colors.pink.shade200],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Row(
                    children: [
                      // ---- LEFT SECTION ----
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "⏳ Flash Sale Ends In",
                              style: GoogleFonts.montserrat(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10.h),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                _timerBox(
                                  "${timeLeft.inHours.remainder(24).toString().padLeft(2, '0')}",
                                ),
                                _timerSeparator(),
                                _timerBox(
                                  "${timeLeft.inMinutes.remainder(60).toString().padLeft(2, '0')}",
                                ),
                                _timerSeparator(),
                                _timerBox(
                                  "${timeLeft.inSeconds.remainder(60).toString().padLeft(2, '0')}",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 10.w),

                      // ---- RIGHT SIDE IMAGE ----
                      Expanded(
                        flex: 1,
                        child: Image.asset(
                          "assets/image/Giftbox.png",
                          height: 60.h,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10.h),

                // ---------------- GRIDVIEW PRODUCTS CLEAN VERSION ----------------
                Text(
                  "All Products",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: Colors.pink,
                  ),
                ),

                SizedBox(height: 10.h),

                LayoutBuilder(
                  builder: (context, constraints) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero, // 💥 Removes extra padding
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.h,
                        childAspectRatio: 0.68, // 💥 Controls height perfectly
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        var item = products[index];

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
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12.r),
                                  ),
                                  child: Image.network(
                                    item["image"],
                                    height: 120.h,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.all(8.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item["name"],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                        ),
                                      ),

                                      SizedBox(height: 4),

                                      Text(
                                        "₹${item["price"]}",
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.sp,
                                        ),
                                      ),

                                      SizedBox(height: 2),

                                      Row(
                                        children: [
                                          Text(
                                            "₹${item["originalPrice"]}",
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: 11.sp,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(width: 4),
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
                                      SizedBox(height: 6.h),

                                      // ⭐ RATING + (reviews)
                                      buildRatingStars(
                                        item["rating"],
                                        item["reviewcount"],
                                      ),
                                      SizedBox(width: 4),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawerItem(
    IconData icon,
    String title,
    VoidCallback onTap, {
    Color color = Colors.black87,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        title,
        style: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
      onTap: onTap,
    );
  }

  // Flat button for sort/filter
  Widget _containerButton(String text, IconData icon, Color color) {
    return Container(
      alignment: Alignment.center,
      height: 28,
      width: 70,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 241, 124, 163).withOpacity(0.09),
            offset: Offset(0, 2),
            blurRadius: 7,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.brown[800],
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 4),
          Icon(icon, size: 17.sp, color: Colors.brown[800]),
        ],
      ),
    );
  }

  Widget _timerBox(String value) {
    return Container(
      // height: 40.h,
      width: 55.w,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Center(
        child: Text(
          value,
          style: GoogleFonts.montserrat(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.pink,
          ),
        ),
      ),
    );
  }

  Widget _timerSeparator() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Text(
        ":",
        style: GoogleFonts.montserrat(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
