import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopiee/screens/product_screen.dart';
import 'package:shopiee/widgets/stars.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  final beige = const Color(0xFFF9F5EF); // Light beige for background
  final cardBackground = Colors.white; // Cards and containers
  final accent = const Color(0xFFE9CFC6); // Slightly deeper beige for accents

  final List<Map<String, dynamic>> products = [
    // ----------------- WATCHES -----------------
    {
      "id": 1,
      "name": "Rolex Submariner",
      "category": "Watches",
      "price": "120,000",
      "originalPrice": "150,000",
      "offerPercentage": "20% OFF",
      "rating": 4.8,
      "reviewcount": 1200,
      "description": "Premium luxury dive watch with automatic movement.",
      "image":
          "https://cdn2.ethoswatches.com/rolex/pub/media/newtheme/desktop/rolex-submariner-m126613lb-0002_2008jva_cmyk-landscape.jpeg",
    },
    {
      "id": 2,
      "name": "Casio G-Shock",
      "category": "Watches",
      "price": "6,000",
      "originalPrice": "7,999",
      "offerPercentage": "25% OFF",
      "rating": 4.5,
      "reviewcount": 900,
      "description": "Shock-resistant watch built for durability.",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-m_zyu-k0ixfBDU0WN4C8J3iA8EAZ-4sfXA&s",
    },

    // ----------------- PERFUMES -----------------
    {
      "id": 3,
      "name": "Dior Sauvage",
      "category": "Perfumes",
      "price": "7,500",
      "originalPrice": "9,500",
      "offerPercentage": "20% OFF",
      "rating": 4.7,
      "reviewcount": 2300,
      "description": "Fresh, spicy and long-lasting iconic fragrance.",
      "image":
          "https://images.unsplash.com/photo-1567721913486-6585f069b332?auto=format&q=80&w=600",
    },
    {
      "id": 4,
      "name": "Chanel Bleu de Chanel",
      "category": "Perfumes",
      "price": "8,200",
      "originalPrice": "11,000",
      "offerPercentage": "26% OFF",
      "rating": 4.9,
      "reviewcount": 3100,
      "description": "Aromatic-woody perfume for men, long lasting.",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHbJ1xKrqQ4a7YFj_v9ohgjMyujre_Le1CDw&s",
    },

    // ----------------- HEADPHONES -----------------
    {
      "id": 5,
      "name": "Sony WH-1000XM4",
      "category": "Headphones",
      "price": "22,000",
      "originalPrice": "29,999",
      "offerPercentage": "30% OFF",
      "rating": 4.8,
      "reviewcount": 5000,
      "description": "Industry-leading ANC Bluetooth headphones.",
      "image":
          "https://images.unsplash.com/photo-1550009158-9ebf69173e03?auto=format&q=80&w=600",
    },
    {
      "id": 6,
      "name": "Boat Rockerz 550",
      "category": "Headphones",
      "price": "1,999",
      "originalPrice": "3,499",
      "offerPercentage": "40% OFF",
      "rating": 4.2,
      "reviewcount": 7000,
      "description": "Deep bass & long battery wireless headphones.",
      "image":
          "https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&q=80&w=600",
    },

    // ----------------- SHOES -----------------
    {
      "id": 7,
      "name": "Nike Air Max",
      "category": "Shoes",
      "price": "6,500",
      "originalPrice": "8,999",
      "offerPercentage": "28% OFF",
      "rating": 4.6,
      "reviewcount": 4200,
      "description": "Lightweight sneakers with air cushion comfort.",
      "image":
          "https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&q=80&w=600",
    },
    {
      "id": 8,
      "name": "Adidas Ultraboost",
      "category": "Shoes",
      "price": "7,800",
      "originalPrice": "10,999",
      "offerPercentage": "29% OFF",
      "rating": 4.7,
      "reviewcount": 3800,
      "description": "High comfort running shoes with Boost sole.",
      "image":
          "https://images.unsplash.com/photo-1560072810-1cffb09faf0f?auto=format&q=80&w=600",
    },

    // ----------------- CLOTHES -----------------
    {
      "id": 9,
      "name": "Men’s Jacket",
      "category": "Clothes",
      "price": "2,500",
      "originalPrice": "3,499",
      "offerPercentage": "28% OFF",
      "rating": 4.3,
      "reviewcount": 2100,
      "description": "Stylish winter jacket for men.",
      "image":
          "https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?auto=format&q=80&w=600",
    },
    {
      "id": 10,
      "name": "Women’s Summer Dress",
      "category": "Clothes",
      "price": "1,800",
      "originalPrice": "2,900",
      "offerPercentage": "38% OFF",
      "rating": 4.5,
      "reviewcount": 1500,
      "description": "Lightweight and elegant summer dress.",
      "image":
          "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?auto=format&q=80&w=600",
    },

    // ----------------- MOBILES -----------------
    {
      "id": 11,
      "name": "iPhone 14 Pro",
      "category": "Mobiles",
      "price": "120,000",
      "originalPrice": "135,000",
      "offerPercentage": "11% OFF",
      "rating": 4.9,
      "reviewcount": 10200,
      "description": "Flagship Apple smartphone with ProMotion display.",
      "image":
          "https://images.unsplash.com/photo-1522273400909-fd1a8f77637e?auto=format&q=80&w=600",
    },
    {
      "id": 12,
      "name": "Samsung S23 Ultra",
      "category": "Mobiles",
      "price": "98,000",
      "originalPrice": "110,000",
      "offerPercentage": "12% OFF",
      "rating": 4.8,
      "reviewcount": 8900,
      "description": "Premium Samsung flagship with 200MP camera.",
      "image":
          "https://images.unsplash.com/photo-1581299894007-aaa50297cf16?auto=format&q=80&w=600",
    },

    // ----------------- CAMERAS -----------------
    {
      "id": 13,
      "name": "Canon EOS R6",
      "category": "Cameras",
      "price": "180,000",
      "originalPrice": "210,000",
      "offerPercentage": "14% OFF",
      "rating": 4.9,
      "reviewcount": 3400,
      "description": "Professional mirrorless camera with fast autofocus.",
      "image":
          "https://images.unsplash.com/photo-1640890959827-6307611b34a1?auto=format&q=80&w=600",
    },
    {
      "id": 14,
      "name": "Sony A7 IV",
      "category": "Cameras",
      "price": "210,000",
      "originalPrice": "245,000",
      "offerPercentage": "14% OFF",
      "rating": 4.9,
      "reviewcount": 2900,
      "description": "Full-frame hybrid camera with superior 4K performance.",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuiRCqsZ4ADWbcSDEHe3qEyZhNZTsXAm9h-A&s",
    },

    // ----------------- AIR PODS -----------------
    {
      "id": 15,
      "name": "AirPods Pro",
      "category": "Air pods",
      "price": "24,000",
      "originalPrice": "28,000",
      "offerPercentage": "15% OFF",
      "rating": 4.7,
      "reviewcount": 7120,
      "description": "Active noise cancellation with spatial audio.",
      "image":
          "https://images.unsplash.com/photo-1572569511254-d8f925fe2cbb?auto=format&q=80&w=600",
    },

    // ----------------- COSMETICS -----------------
    {
      "id": 16,
      "name": "MAC Matte Lipstick",
      "category": "Cosmetics",
      "price": "1,200",
      "originalPrice": "1,650",
      "offerPercentage": "27% OFF",
      "rating": 4.6,
      "reviewcount": 5000,
      "description": "Long-wear matte lipstick with rich color.",
      "image":
          "https://images.unsplash.com/photo-1598460880248-71ec6d2d582b?auto=format&q=80&w=600",
    },

    // ----------------- TOYS -----------------
    {
      "id": 17,
      "name": "Toy Train Set",
      "category": "Toys",
      "price": "1,400",
      "originalPrice": "1,899",
      "offerPercentage": "26% OFF",
      "rating": 4.3,
      "reviewcount": 1800,
      "description": "Electric toy train set with tracks.",
      "image":
          "https://images.unsplash.com/photo-1599623560574-39d485900c95?auto=format&q=80&w=600",
    },
    {
      "id": 18,
      "name": "Soft Teddy Bear",
      "category": "Toys",
      "price": "700",
      "originalPrice": "999",
      "offerPercentage": "30% OFF",
      "rating": 4.6,
      "reviewcount": 2400,
      "description": "Cute and ultra-soft teddy bear for kids.",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWQ3G4B0LHuPVPd9tvUvDEkmfUeSsBQKdPwA&s",
    },
    {
      "id": 19,
      "name": "Omega Seamaster",
      "category": "Watches",
      "price": "95,000",
      "originalPrice": "120,000",
      "offerPercentage": "21% OFF",
      "rating": 4.7,
      "reviewcount": 1800,
      "description":
          "Iconic diving watch with exceptional precision and durability.",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBzg9Hq3M7NdR7GereboH64zncCRaBmFnDYw&s",
    },

    {
      "id": 20,
      "name": "TAG Heuer Carrera",
      "category": "Watches",
      "price": "1,45,000",
      "originalPrice": "175,000",
      "offerPercentage": "17% OFF",
      "rating": 4.8,
      "reviewcount": 2200,
      "description": "Sporty luxury watch inspired by motor racing culture.",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQe9wAhRu58hI6_IShqtmNWuAlT2H9Dp-bTCw&s",
    },

    {
      "id": 21,
      "name": "Audemars Piguet Royal Oak",
      "category": "Watches",
      "price": "3,50,000",
      "originalPrice": "4,20,000",
      "offerPercentage": "16% OFF",
      "rating": 4.9,
      "reviewcount": 1500,
      "description": "Luxury Swiss watch with iconic octagonal bezel design.",
      "image":
          "https://timepiecetradingllc.com/cdn/shop/articles/Audemars_Piguet_Royal_Oak_in_Rose_Gold.png?v=1689376269",
    },

    {
      "id": 22,
      "name": "Tissot Gentleman",
      "category": "Watches",
      "price": "38,000",
      "originalPrice": "48,000",
      "offerPercentage": "20% OFF",
      "rating": 4.6,
      "reviewcount": 900,
      "description":
          "Elegant everyday watch combining classic style and comfort.",
      "image":
          "https://images.unsplash.com/photo-1524592094714-0f0654e20314?auto=format&q=80&w=1200",
    },

    {
      "id": 23,
      "name": "Seiko Prospex Diver",
      "category": "Watches",
      "price": "28,000",
      "originalPrice": "35,000",
      "offerPercentage": "20% OFF",
      "rating": 4.5,
      "reviewcount": 1700,
      "description":
          "Professional diver’s watch built for adventure and precision.",
      "image":
          "https://cdn.shopify.com/s/files/1/0322/8424/6155/collections/2049x1025Prospex.jpg?v=1716543761",
    },
    {
      "id": 24,
      "name": "Fogg Scent Intensio",
      "category": "Perfumes",
      "price": "499",
      "originalPrice": "799",
      "offerPercentage": "38% OFF",
      "rating": 4.3,
      "reviewcount": 5100,
      "description": "Strong long-lasting scent perfect for daily use.",
      "image":
          "https://rukminim2.flixcart.com/image/480/640/xif0q/perfume/c/d/l/100-0-intensio-eau-de-parfum-fogg-scent-men-original-imahckwndjjhf8jm.jpeg?q=90",
    },

    {
      "id": 25,
      "name": "Denver Hamilton",
      "category": "Perfumes",
      "price": "349",
      "originalPrice": "599",
      "offerPercentage": "42% OFF",
      "rating": 4.2,
      "reviewcount": 4800,
      "description": "Fresh masculine fragrance suitable for all occasions.",
      "image":
          "https://denverformen.com/cdn/shop/products/Denver_Hamilton_Benefits.jpg?v=1741266821&width=1946",
    },

    {
      "id": 26,
      "name": "Wild Stone Ultra Sensual",
      "category": "Perfumes",
      "price": "299",
      "originalPrice": "499",
      "offerPercentage": "40% OFF",
      "rating": 4.1,
      "reviewcount": 6900,
      "description":
          "Warm and sensual fragrance with long-lasting performance.",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiPapdXi5iaPRjCkQTrza7b504dL-NV3MMwA&s",
    },
    {
      "id": 27,
      "name": "Bose QuietComfort 45",
      "category": "Headphones",
      "price": "29,000",
      "originalPrice": "34,999",
      "offerPercentage": "17% OFF",
      "rating": 4.7,
      "reviewcount": 4100,
      "description": "Top-tier noise-cancelling over-ear headphones from Bose.",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjhNqch7Fd1HtX2qgrP9P6Yy6amaHiB1CPOA&s",
    },

    {
      "id": 28,
      "name": "JBL Tune 750BTNC",
      "category": "Headphones",
      "price": "9,999",
      "originalPrice": "14,499",
      "offerPercentage": "31% OFF",
      "rating": 4.4,
      "reviewcount": 2700,
      "description": "Wireless ANC headphones with JBL signature sound.",
      "image":
          "https://i.rtings.com/assets/products/rMsS9m2f/jbl-tune-750btnc-wireless/design-medium.jpg?format=auto",
    },

    {
      "id": 29,
      "name": "Sennheiser HD 660S2",
      "category": "Headphones",
      "price": "45,000",
      "originalPrice": "54,999",
      "offerPercentage": "18% OFF",
      "rating": 4.9,
      "reviewcount": 800,
      "description": "High-end open-back studio-grade audiophile headphones.",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXPlAUY4qJmrNVmLcnR4HLjaALI1QhuqhuQw&s",
    },
    {
      "id": 30,
      "name": "Sony WF-1000XM5",
      "category": "Air pods",
      "price": "18,999",
      "originalPrice": "26,999",
      "offerPercentage": "29% OFF",
      "rating": 4.8,
      "reviewcount": 4300,
      "description":
          "Flagship true-wireless earbuds with industry-leading ANC and rich sound.",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6k1PCDayXSEN1obXYcqeM3cKNMI8zYOPbHw&s",
    },
    {
      "id": 31,
      "name": "Bose QuietComfort Earbuds II",
      "category": "Air pods",
      "price": "19,999",
      "originalPrice": "24,999",
      "offerPercentage": "20% OFF",
      "rating": 4.7,
      "reviewcount": 3800,
      "description":
          "Comfortable fit and top-tier noise cancellation in a sleek design.",
      "image":
          "https://i.rtings.com/assets/products/AQze2J9H/bose-quietcomfort-earbuds-ii-truly-wireless/design-medium.jpg?format=auto",
    },
    {
      "id": 32,
      "name": "Jabra Elite 8 Active",
      "category": "Air pods",
      "price": "14,499",
      "originalPrice": "19,999",
      "offerPercentage": "27% OFF",
      "rating": 4.5,
      "reviewcount": 2500,
      "description":
          "Sport-ready true wireless earbuds with secure fit and IP57 water-resistance.",
      "image":
          "https://images.livemint.com/img/2023/10/11/original/Jabra_Elite_8_Active_review_1697011100218.jpg",
    },
    {
      "id": 33,
      "name": "Anker Soundcore Liberty 4 NC",
      "category": "Air pods",
      "price": "7,999",
      "originalPrice": "10,999",
      "offerPercentage": "27% OFF",
      "rating": 4.3,
      "reviewcount": 6100,
      "description":
          "Great value true wireless earbuds with noise cancelling under budget.",
      "image":
          "https://m.media-amazon.com/images/I/61rV5hLrd4L._AC_UF1000,1000_QL80_.jpg",
    },
    {
      "id": 34,
      "name": "Apple AirPods Pro (2nd Gen)",
      "category": "Air pods",
      "price": "26,900",
      "originalPrice": "29,900",
      "offerPercentage": "10% OFF",
      "rating": 4.9,
      "reviewcount": 8200,
      "description":
          "Apple’s premium true wireless earbuds with ANC and seamless Apple-device integration.",
      "image":
          "https://idestiny.in/wp-content/uploads/2024/10/Airpods-pro2-1.jpg",
    },
    {
      "id": 35,
      "name": "Remote Control Monster Truck",
      "category": "Toys",
      "price": "1,299",
      "originalPrice": "1,899",
      "offerPercentage": "32% OFF",
      "rating": 4.4,
      "reviewcount": 2400,
      "description": "High-speed RC monster truck with shock-absorbing wheels.",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwMlzMGvC_jG1nzX1VcrT9rGdTni9rHOfVOg&s",
    },

    {
      "id": 36,
      "name": "LEGO Creative Brick Set",
      "category": "Toys",
      "price": "2,499",
      "originalPrice": "3,499",
      "offerPercentage": "28% OFF",
      "rating": 4.8,
      "reviewcount": 5200,
      "description": "Big classic LEGO set for open-ended creative building.",
      "image":
          "https://m.media-amazon.com/images/I/71Gw8qvdgdL._AC_UF1000,1000_QL80_.jpg",
    },

    {
      "id": 37,
      "name": "Barbie Fashionista Doll",
      "category": "Toys",
      "price": "750",
      "originalPrice": "1,099",
      "offerPercentage": "32% OFF",
      "rating": 4.5,
      "reviewcount": 3100,
      "description": "Stylish Barbie doll with modern fashion outfit.",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSy_aRflBWEpFmz02nmfex6Lx5cnMmufakxuA&s",
    },

    {
      "id": 38,
      "name": "Kids Kitchen Play Set",
      "category": "Toys",
      "price": "899",
      "originalPrice": "1,499",
      "offerPercentage": "40% OFF",
      "rating": 4.3,
      "reviewcount": 1800,
      "description": "Miniature kitchen toys for imaginative play.",
      "image":
          "https://cdn.fcglcdn.com/brainbees/images/products/583x720/17659156a.webp",
    },

    {
      "id": 39,
      "name": "Plush Unicorn Soft Toy",
      "category": "Toys",
      "price": "599",
      "originalPrice": "899",
      "offerPercentage": "33% OFF",
      "rating": 4.7,
      "reviewcount": 4600,
      "description": "Super soft and cuddly unicorn plush toy for kids.",
      "image":
          "https://5.imimg.com/data5/SELLER/Default/2023/8/337291132/JL/UW/TV/78561479/unicornplush-jpeg-1000x1000.jpeg",
    },

    {
      "id": 40,
      "name": "Puzzle Game – 100 Pieces",
      "category": "Toys",
      "price": "299",
      "originalPrice": "499",
      "offerPercentage": "40% OFF",
      "rating": 4.2,
      "reviewcount": 1500,
      "description":
          "Colorful puzzle game that boosts kids’ brain development.",
      "image": "https://m.media-amazon.com/images/I/71uivgCWdXL.jpg",
    },
    {
      "id": 41,
      "name": "Nikon Z6 II",
      "category": "Cameras",
      "price": "1,75,000",
      "originalPrice": "2,05,000",
      "offerPercentage": "15% OFF",
      "rating": 4.8,
      "reviewcount": 2500,
      "description":
          "Full-frame mirrorless camera with 4K video and dual processors.",
      "image":
          "https://images.unsplash.com/photo-1549923746-c502d488b3ea?auto=format&q=80&w=1200",
    },

    {
      "id": 42,
      "name": "Fujifilm X-T4",
      "category": "Cameras",
      "price": "1,40,000",
      "originalPrice": "1,65,000",
      "offerPercentage": "15% OFF",
      "rating": 4.7,
      "reviewcount": 3100,
      "description":
          "Hybrid APS-C mirrorless camera with IBIS and cinematic color science.",
      "image":
          "https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?auto=format&q=80&w=1200",
    },

    {
      "id": 43,
      "name": "GoPro HERO 12 Black",
      "category": "Cameras",
      "price": "39,999",
      "originalPrice": "49,999",
      "offerPercentage": "20% OFF",
      "rating": 4.6,
      "reviewcount": 7800,
      "description":
          "High-performance action camera for 5.3K video and extreme adventures.",
      "image": "https://i.ytimg.com/vi/UZ5G0tVwBkI/maxresdefault.jpg",
    },

    {
      "id": 44,
      "name": "Canon EOS M50 Mark II",
      "category": "Cameras",
      "price": "57,000",
      "originalPrice": "68,000",
      "offerPercentage": "16% OFF",
      "rating": 4.5,
      "reviewcount": 5400,
      "description":
          "Compact mirrorless camera ideal for vloggers and travel photographers.",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ60Q7bc5kZRPR2dCDtc4Q1tN--eeyQVuPDFg&s",
    },

    {
      "id": 45,
      "name": "DJI Pocket 3",
      "category": "Cameras",
      "price": "52,000",
      "originalPrice": "62,000",
      "offerPercentage": "16% OFF",
      "rating": 4.6,
      "reviewcount": 2900,
      "description":
          "Handheld gimbal camera with 4K HDR video and stabilization.",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSa_hG9j-NhhGybZ8PyxRRAPD5QiP34KBLdPg&s",
    },
    {
      "id": 46,
      "name": "Puma RS-X³ Core",
      "category": "Shoes",
      "price": "8,499",
      "originalPrice": "11,999",
      "offerPercentage": "29% OFF",
      "rating": 4.4,
      "reviewcount": 3200,
      "description":
          "Bold chunky sneakers with retro-futuristic design and comfort cushioning.",
      "image":
          "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_2000,h_2000/global/373308/01/dt05/fnd/IND/fmt/png/RS-X%C2%B3-WH-Sneakers",
    },
    {
      "id": 47,
      "name": "Reebok Nano X3",
      "category": "Shoes",
      "price": "12,999",
      "originalPrice": "16,999",
      "offerPercentage": "23% OFF",
      "rating": 4.5,
      "reviewcount": 2100,
      "description":
          "Premium cross-training shoes with high stability for gym & functional workouts.",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8WQ7iabLCXl_qoaVF2J9YyTg94TFS3NNLRg&s",
    },
    {
      "id": 48,
      "name": "New Balance Fresh Foam 1080v12",
      "category": "Shoes",
      "price": "14,499",
      "originalPrice": "19,999",
      "offerPercentage": "27% OFF",
      "rating": 4.6,
      "reviewcount": 1500,
      "description":
          "Ultimate running shoes with plush cushioning and smooth ride.",
      "image": "https://i.ytimg.com/vi/TGzbBWb6VYo/maxresdefault.jpg",
    },
    {
      "id": 49,
      "name": "Converse Chuck Taylor All Star ’70",
      "category": "Shoes",
      "price": "4,699",
      "originalPrice": "6,299",
      "offerPercentage": "25% OFF",
      "rating": 4.3,
      "reviewcount": 4300,
      "description":
          "Classic canvas sneakers with vintage style and everyday versatility.",
      "image":
          "https://images-cdn.ubuy.co.in/661c95a95db3c747a13edda4-mens-converse-chuck-taylor-all-star-70.jpg",
    },
    {
      "id": 50,
      "name": "Vans Old Skool",
      "category": "Shoes",
      "price": "5,199",
      "originalPrice": "7,199",
      "offerPercentage": "28% OFF",
      "rating": 4.2,
      "reviewcount": 3900,
      "description":
          "Low-top skate sneakers with iconic stripe and durable suede frame.",
      "image":
          "https://5.imimg.com/data5/SELLER/Default/2024/5/423706786/NM/FX/ZP/192412408/whatsapp-image-2024-05-09-at-21-12-51-1-500x500.jpeg",
    },
    {
      "id": 51,
      "name": "Men’s Classic Denim Jacket",
      "category": "Clothes",
      "price": "2,199",
      "originalPrice": "3,499",
      "offerPercentage": "37% OFF",
      "rating": 4.5,
      "reviewcount": 1800,
      "description": "Premium washed denim jacket with a modern slim fit.",
      "image":
          "https://images.unsplash.com/photo-1539533113208-f6df8cc8b543?auto=format&q=80&w=1200",
    },

    {
      "id": 52,
      "name": "Oversized Graphic Hoodie",
      "category": "Clothes",
      "price": "1,499",
      "originalPrice": "2,299",
      "offerPercentage": "35% OFF",
      "rating": 4.6,
      "reviewcount": 2500,
      "description": "Soft cotton hoodie with trendy oversized streetwear fit.",
      "image":
          "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?auto=format&q=80&w=1200",
    },

    {
      "id": 53,
      "name": "Women’s Floral Maxi Dress",
      "category": "Clothes",
      "price": "1,299",
      "originalPrice": "2,199",
      "offerPercentage": "41% OFF",
      "rating": 4.7,
      "reviewcount": 3300,
      "description": "Beautiful lightweight summer dress with floral prints.",
      "image":
          "https://images.unsplash.com/photo-1490481651871-ab68de25d43d?auto=format&q=80&w=1200",
    },

    {
      "id": 54,
      "name": "Men’s Cotton Casual Shirt",
      "category": "Clothes",
      "price": "799",
      "originalPrice": "1,199",
      "offerPercentage": "33% OFF",
      "rating": 4.3,
      "reviewcount": 1700,
      "description":
          "Regular-fit breathable cotton shirt for everyday comfort.",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRRbkyg4SMGgs4Y-BJ5vRVs1ywsICh1klSNw&s",
    },

    {
      "id": 55,
      "name": "Women’s Palazzo & Top Set",
      "category": "Clothes",
      "price": "999",
      "originalPrice": "1,499",
      "offerPercentage": "34% OFF",
      "rating": 4.4,
      "reviewcount": 2100,
      "description":
          "Comfortable palazzo pants paired with a stylish printed top.",
      "image":
          "https://assets.ajio.com/medias/sys_master/root/20240202/Tndw/65bd00578cdf1e0df5e23dfe/-473Wx593H-467035440-orange-MODEL.jpg",
    },

    {
      "id": 56,
      "name": "Women’s Shrug & Tank Top Combo",
      "category": "Clothes",
      "price": "899",
      "originalPrice": "1,399",
      "offerPercentage": "36% OFF",
      "rating": 4.2,
      "reviewcount": 900,
      "description":
          "Soft comfy shrug paired with a matching tank top for casual wear.",
      "image":
          "https://i.pinimg.com/736x/22/19/ab/2219ab63ecd8591a2583e69c5be488de.jpg",
    },
    {
      "id": 57,
      "name": "OnePlus 12R",
      "category": "Mobiles",
      "price": "42,999",
      "originalPrice": "47,999",
      "offerPercentage": "10% OFF",
      "rating": 4.6,
      "reviewcount": 5200,
      "description":
          "Performance flagship with Snapdragon 8 Gen 2 & 5000mAh battery.",
      "image":
          "https://images.unsplash.com/photo-1542751371-adc38448a05e?auto=format&q=80&w=1200",
    },

    {
      "id": 58,
      "name": "Google Pixel 7a",
      "category": "Mobiles",
      "price": "34,999",
      "originalPrice": "43,999",
      "offerPercentage": "20% OFF",
      "rating": 4.7,
      "reviewcount": 4100,
      "description": "Flagship-grade camera performance with Tensor chip.",
      "image":
          "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?auto=format&q=80&w=1200",
    },

    {
      "id": 59,
      "name": "Redmi Note 13 Pro+",
      "category": "Mobiles",
      "price": "29,999",
      "originalPrice": "35,999",
      "offerPercentage": "17% OFF",
      "rating": 4.4,
      "reviewcount": 8900,
      "description": "Curved AMOLED display with 200MP pro-grade camera.",
      "image":
          "https://static.toiimg.com/thumb/msid-106539406,width-400,resizemode-4/106539406.jpg",
    },
    {
      "id": 60,
      "name": "Lakmé 9 to 5 Primer Matte Lipstick",
      "category": "Cosmetics",
      "price": "349",
      "originalPrice": "499",
      "offerPercentage": "30% OFF",
      "rating": 4.4,
      "reviewcount": 6500,
      "description": "Long-lasting matte lipstick with smooth finish.",
      "image":
          "https://images.unsplash.com/photo-1522337360788-8b13dee7a37e?auto=format&q=80&w=1200",
    },

    {
      "id": 61,
      "name": "Maybelline Fit Me Foundation",
      "category": "Cosmetics",
      "price": "479",
      "originalPrice": "549",
      "offerPercentage": "12% OFF",
      "rating": 4.6,
      "reviewcount": 12000,
      "description":
          "Matte and poreless foundation suitable for Indian skin tones.",
      "image":
          "https://rukminim2.flixcart.com/image/704/844/xif0q/foundation/s/w/p/-original-imahfsgfv6ypptgb.jpeg?q=20&crop=false",
    },

    {
      "id": 62,
      "name": "Swiss Beauty Highlighter & Illuminator",
      "category": "Cosmetics",
      "price": "299",
      "originalPrice": "499",
      "offerPercentage": "40% OFF",
      "rating": 4.3,
      "reviewcount": 4700,
      "description": "Dewy highlighter for glowing and radiant skin finish.",
      "image":
          "https://rukminim2.flixcart.com/image/480/640/xif0q/highlighter/p/l/b/-original-imah2jt7h5ftxkfk.jpeg?q=90",
    },
    {
      "id": 63,
      "name": "Beardo Ultimate Wet Look Hair Gel",
      "category": "Cosmetics",
      "price": "349",
      "originalPrice": "499",
      "offerPercentage": "30% OFF",
      "rating": 4.2,
      "reviewcount": 3000,
      "description":
          "Strong hold gel for slick wet hairstyle that stays all day.",
      "image":
          "https://beardo.in/cdn/shop/files/4_026468c3-0880-4d7e-ac22-65afcb8eee2a.jpg?v=1740580838&width=1946",
    },

    {
      "id": 64,
      "name": "The Man Company Sandalwood & Almond Body Wash",
      "category": "Cosmetics",
      "price": "599",
      "originalPrice": "899",
      "offerPercentage": "33% OFF",
      "rating": 4.5,
      "reviewcount": 4200,
      "description":
          "Refreshing sandalwood fragrance with almond extract—premium daily body wash for men.",
      "image":
          "https://assets.ajio.com/medias/sys_master/root/20210130/iWWD/601459237cdb8c1f1432444e/-473Wx593H-4919374240-multi-MODEL.jpg",
    },

    {
      "id": 65,
      "name": "Ustraa Face Moisturizer SPF 30",
      "category": "Cosmetics",
      "price": "799",
      "originalPrice": "1,099",
      "offerPercentage": "27% OFF",
      "rating": 4.4,
      "reviewcount": 2600,
      "description":
          "Daily face moisturizer with SPF 30 to protect and hydrate men’s skin.",
      "image":
          "https://rukminim2.flixcart.com/image/480/640/xif0q/moisturizer-cream/y/h/r/100-moisturising-cream-oily-skin-ustraa-cream-original-imahywmwgd8z6xc8.jpeg?q=90",
    },
    {
      "id": 63,
      "name": "Realme GT Neo 3",
      "category": "Mobiles",
      "price": "32,999",
      "originalPrice": "39,999",
      "offerPercentage": "18% OFF",
      "rating": 4.5,
      "reviewcount": 6700,
      "description":
          "120Hz AMOLED display with Dimensity 8100 performance chipset.",
      "image":
          "https://media.assettype.com/thequint%2F2022-03%2F7a1c243e-5420-4838-9146-414a847c9c80%2Frealme_gt.webp?auto=format%2Ccompress&fmt=webp&width=720&w=1200",
    },

    {
      "id": 64,
      "name": "iQOO Z7 Pro",
      "category": "Mobiles",
      "price": "23,999",
      "originalPrice": "27,999",
      "offerPercentage": "14% OFF",
      "rating": 4.4,
      "reviewcount": 5100,
      "description":
          "Curved AMOLED, 64MP OIS camera and fast Dimensity 7200 processor.",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG3adh7ubP0JhZ5xveoajc6Fu6hF24E5FjzA&s",
    },

    {
      "id": 65,
      "name": "Nothing Phone (2)",
      "category": "Mobiles",
      "price": "44,999",
      "originalPrice": "49,999",
      "offerPercentage": "10% OFF",
      "rating": 4.7,
      "reviewcount": 3800,
      "description":
          "Transparent design with Glyph interface and Snapdragon 8+ Gen 1.",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLNkv8QiN6VVuFv2kCTmdLmF-irjENDoH24Q&s",
    },
  ];
  late List<String> categories;

  final TextEditingController _searchcontroller = TextEditingController();
  List filteredProducts = [];
  @override
  void initState() {
    // TODO: implement initState
    filteredProducts = products;
    super.initState();

    categories = products
        .map((item) => item["category"].toString())
        .toSet()
        .toList();

    _searchcontroller.addListener(() {
      filterProducts();
      setState(() {}); // update UI as user types
    });
  }

  // void filterProducts() {
  //   final query = _searchcontroller.text.toLowerCase();
  //   setState(() {
  //     filteredProducts = products.where((item) {
  //       return item.toString().toLowerCase().contains(query);
  //     }).toList();
  //   });
  // }

  void filterProducts() {
    final query = _searchcontroller.text.toLowerCase();

    setState(() {
      filteredProducts = products.where((item) {
        final name = item["name"].toString().toLowerCase();
        final category = item["category"].toString().toLowerCase();

        return name.contains(query) || category.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beige,
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
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          children: [
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
                controller: _searchcontroller,
                autofocus: true,
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
            Expanded(
              child: _searchcontroller.text.isEmpty
                  ? buildCategoryList() // When nothing typed
                  : filteredProducts.isEmpty
                  ? buildNoResults() // When typed but no match
                  : buildProductsGrid(), // When matches are found
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryList() {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 10, // horizontal space
        runSpacing: 12, // vertical space
        children: categories.map((category) {
          return GestureDetector(
            onTap: () {
              _searchcontroller.text = category;
              filterProducts();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                border: Border.all(color: Colors.pink.shade200, width: 1),
              ),
              child: Text(
                category,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.pink.shade400,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  GridView buildProductsGrid() {
    return GridView.builder(
      itemCount: filteredProducts.length,
      padding: EdgeInsets.all(12.w),
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.54,
      ),

      itemBuilder: (context, index) {
        var item = filteredProducts[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductScreen(product: item),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  blurRadius: 6,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // IMAGE
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  child: Image.network(
                    item["image"],
                    height: 150.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                // BODY
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
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox(height: 5),

                      // PRICE + ORIGINAL PRICE
                      Row(
                        children: [
                          Text(
                            "₹${item["price"]}",
                            style: GoogleFonts.montserrat(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            "₹${item["originalPrice"]}",
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 11.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),

                      // OFFER
                      Text(
                        item["offerPercentage"],
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox(height: 5),

                      // RATING
                      buildRatingStars(item["rating"], item["reviewcount"]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget buildNoResults() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.search_off, size: 80, color: Colors.grey.withOpacity(0.6)),
        SizedBox(height: 15),
        Text(
          "No results found!",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: 5),
        Text(
          "Try searching something else",
          style: TextStyle(fontSize: 14, color: Colors.grey[500]),
        ),
      ],
    ),
  );
}
