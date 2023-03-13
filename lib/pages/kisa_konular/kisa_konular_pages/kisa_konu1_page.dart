import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ing_app_1502/package/ad_func.dart';
import 'package:ing_app_1502/package/ad_helper.dart';
import 'package:ing_app_1502/pages/decoration_pages/colors.dart';

class KisaKonu1Page extends StatefulWidget {
  const KisaKonu1Page({super.key});

  @override
  State<KisaKonu1Page> createState() => _KisaKonu1PageState();
}

class _KisaKonu1PageState extends State<KisaKonu1Page> {
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
                Image.asset("assets/inganlatim/i1.jpg"),
                Image.asset("assets/inganlatim/i2.jpg"),
                Image.asset("assets/inganlatim/i3.jpg"),
                Image.asset("assets/inganlatim/i4.jpg"),
                Image.asset("assets/inganlatim/i5.jpg"),
                Image.asset("assets/inganlatim/i6.jpg"),
                Image.asset("assets/inganlatim/i7.jpg"),
                Image.asset("assets/inganlatim/i8.jpg"),
                const SizedBox(height: 50.0),
              ],
            )
          ],
        ));
  }
}
