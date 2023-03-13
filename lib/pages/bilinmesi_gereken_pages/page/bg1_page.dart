import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ing_app_1502/package/ad_func.dart';
import 'package:ing_app_1502/package/ad_helper.dart';
import 'package:ing_app_1502/pages/decoration_pages/colors.dart';

class BG1Page extends StatefulWidget {
  const BG1Page({super.key});

  @override
  State<BG1Page> createState() => _BG1PageState();
}

class _BG1PageState extends State<BG1Page> {
  int interstitialLoadAttempts = 1;
  bool isBottomBannerAdLoaded = false;
  BannerAd? bottomBannerAd;
  InterstitialAd? interstitialAd;
  void createBottomBannerAd() {
    bottomBannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: AdHelper.bannerAdUnitId,
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() {
              print('-' * 10);
              print('banner bilinmesi gereken reklam calisiyor');
              isBottomBannerAdLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            print('bilinmesi gereken reklam yuklenemedi ${error}');
          },
        ),
        request: const AdRequest());
    bottomBannerAd!.load();
  }

  @override
  void initState() {
    super.initState();
    createBottomBannerAd();
    myAdFunction.createInterstitialAd();
  }

  @override
  void dispose() {
    super.dispose();

    bottomBannerAd?.dispose();
    interstitialAd?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: isBottomBannerAdLoaded
          ? SizedBox(
              height: bottomBannerAd!.size.height.toDouble(),
              width: bottomBannerAd!.size.width.toDouble(),
              child: AdWidget(ad: bottomBannerAd!),
            )
          : null,
      appBar: AppBar(
        title: const Text(
          'E-LooPsAkademi',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: kDeepPurple),
        ),
      ),
      body: ListView(children: [
        Column(
          children: [
            Image.asset("assets/ingsozluk/y1.jpg"),
            Image.asset("assets/ingsozluk/y2.jpg"),
            Image.asset("assets/ingsozluk/y3.jpg"),
            Image.asset("assets/ingsozluk/y4.jpg"),
            Image.asset("assets/ingsozluk/y5.jpg"),
            Image.asset("assets/ingsozluk/y6.jpg"),
            Image.asset("assets/ingsozluk/y7.jpg"),
            Image.asset("assets/ingsozluk/y8.jpg"),
            Image.asset("assets/ingsozluk/y9.jpg"),
            Image.asset("assets/ingsozluk/y10.jpg"),
            const SizedBox(height: 40)
          ],
        ),
      ]),
    );
  }
}
