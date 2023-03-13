import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ing_app_1502/package/ad_func.dart';
import 'package:ing_app_1502/package/ad_helper.dart';
import 'package:ing_app_1502/pages/decoration_pages/colors.dart';

class BG4Page extends StatefulWidget {
  const BG4Page({super.key});

  @override
  State<BG4Page> createState() => _BG4PageState();
}

class _BG4PageState extends State<BG4Page> {
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
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset("assets/ingsozluk/y30.jpg"),
                Image.asset("assets/ingsozluk/y31.jpg"),
                Image.asset("assets/ingsozluk/y32.jpg"),
                Image.asset("assets/ingsozluk/y33.jpg"),
                Image.asset("assets/ingsozluk/y34.jpg"),
                Image.asset("assets/ingsozluk/y35.jpg"),
                Image.asset("assets/ingsozluk/y36.jpg"),
                Image.asset("assets/ingsozluk/y37.jpg"),
                const SizedBox(height: 50.0),
              ],
            )
          ],
        ));
  }
}
