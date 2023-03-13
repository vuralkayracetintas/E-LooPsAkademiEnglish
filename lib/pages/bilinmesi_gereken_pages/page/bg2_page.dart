import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ing_app_1502/package/ad_func.dart';
import 'package:ing_app_1502/package/ad_helper.dart';
import 'package:ing_app_1502/pages/decoration_pages/colors.dart';

class BG2Page extends StatefulWidget {
  const BG2Page({super.key});

  @override
  State<BG2Page> createState() => _BG2PageState();
}

class _BG2PageState extends State<BG2Page> {
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
              print('asdasd');
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
                Image.asset("assets/ingsozluk/y11.jpg"),
                Image.asset("assets/ingsozluk/y12.jpg"),
                Image.asset("assets/ingsozluk/y13.jpg"),
                Image.asset("assets/ingsozluk/y14.jpg"),
                Image.asset("assets/ingsozluk/y15.jpg"),
                Image.asset("assets/ingsozluk/y16.jpg"),
                Image.asset("assets/ingsozluk/y17.jpg"),
                Image.asset("assets/ingsozluk/y18.jpg"),
                Image.asset("assets/ingsozluk/y19.jpg"),
                const SizedBox(height: 50.0),
              ],
            )
          ],
        ));
  }
}
