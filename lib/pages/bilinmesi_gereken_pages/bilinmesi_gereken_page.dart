// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ing_app_1502/package/ad_func.dart';
import 'package:ing_app_1502/package/ad_helper.dart';
import 'package:ing_app_1502/pages/home_screen/home_page.dart';
import 'package:ing_app_1502/pages/bilinmesi_gereken_pages/bg1.dart';
import 'package:ing_app_1502/pages/bilinmesi_gereken_pages/bg3.dart';
import 'package:ing_app_1502/pages/bilinmesi_gereken_pages/bg4.dart';
import 'package:ing_app_1502/pages/bilinmesi_gereken_pages/bg5.dart';
import 'package:ing_app_1502/pages/bilinmesi_gereken_pages/tgds_web.dart';
import 'package:ing_app_1502/pages/decoration_pages/colors.dart';

import 'digital_egitim_web.dart';
import 'bg2.dart';

class BilinmesiGerekenPage extends StatefulWidget {
  const BilinmesiGerekenPage({
    Key? key,
  }) : super(key: key);

  @override
  State<BilinmesiGerekenPage> createState() => _BilinmesiGerekenPageState();
}

class _BilinmesiGerekenPageState extends State<BilinmesiGerekenPage> {
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
    var size = MediaQuery.of(context).size;
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
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple),
          ),
        ),
        body: Stack(
          children: [
            Column(
              children: const [
                Image(image: AssetImage('assets/images/ogrenci.png')),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Image(
                        image: AssetImage("assets/images/eloopslogo.png"),
                        height: 80,
                        width: 250,
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "Dilediğin Eğitim Kurumundan\n",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: size.width * .6,
                        child: const Text(
                          "Dilediğin Eğitime Kolayca Ulaşmana  ve Yıllık Eğitim Maliyetini %70  Oranında Düşürmene Olanak Sağlıyor",
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Bilinmesi Gerekenler🚀',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const TGDSWeb(),
                      const SizedBox(height: 20),
                      const DigitalEgitimWeb(),
                      const SizedBox(height: 20),
                      const BG1Ui(),
                      const SizedBox(height: 20),
                      const BG2Ui(),
                      const SizedBox(height: 20),
                      const BG3Ui(),
                      const SizedBox(height: 20),
                      const BG4Ui(),
                      const SizedBox(height: 20),
                      const BG5Ui(),
                      const SizedBox(height: 50),
                      Text('E-LooPsAkademi, öğrenciler ne isterse onu yapar.',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: kDeepPurple)),
                      const SizedBox(height: 100)
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
