import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class InlineBannerAdWidget extends StatefulWidget {
  const InlineBannerAdWidget({super.key});

  @override
  State<InlineBannerAdWidget> createState() => _InlineBannerAdWidgetState();
}

class _InlineBannerAdWidgetState extends State<InlineBannerAdWidget> {
  late BannerAd _bannerAd;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/9214589741', // Test ID
      size: AdSize.mediumRectangle,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) => setState(() => _isLoaded = true),
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          debugPrint('Inline banner failed: $error');
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoaded) return const SizedBox(height: 60); // reserve space

    return Center(
      child: SizedBox(
        width: _bannerAd.size.width.toDouble(),
        //  width: 340.w,
        height: _bannerAd.size.height.toDouble(),
        child: AdWidget(ad: _bannerAd),
      ),
    );
  }

  //   @override
  // Widget build(BuildContext context) {
  //   if (_isLoaded) {
  //     return Center(
  //       child: SizedBox(
  //         width: _bannerAd.size.width.toDouble(),
  //         height: _bannerAd.size.height.toDouble(),
  //         child: AdWidget(ad: _bannerAd),
  //       ),
  //     );
  //   } else {
  //    // 👇 This runs when the ad is not loaded or failed
  //     return Container(
  //       height: 60,
  //       alignment: Alignment.center,
  //       child: SpinKitPouringHourGlassRefined(
  //       color: Colors.purple,
  //       // size: 50.0.sp,
  //     ),
  //     );
  //   }
  // }
}
