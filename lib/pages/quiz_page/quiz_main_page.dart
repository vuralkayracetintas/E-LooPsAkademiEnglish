import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ing_app_1502/package/ad_func.dart';
import 'package:ing_app_1502/package/ad_helper.dart';
import 'package:ing_app_1502/pages/bilinmesi_gereken_pages/digital_egitim_web.dart';
import 'package:ing_app_1502/pages/decoration_pages/colors.dart';
import 'package:ing_app_1502/pages/quiz_page/ing1_pages/view/ing1_first_page.dart';
import 'package:ing_app_1502/pages/quiz_page/quiz_screen/quiz1_button.dart';
import 'package:ing_app_1502/pages/quiz_page/quiz_screen/quiz2_button.dart';
import 'package:ing_app_1502/pages/quiz_page/quiz_screen/quiz8_button.dart';

import '../bilinmesi_gereken_pages/tgds_web.dart';
import 'quiz_screen/quiz3_button.dart';
import 'quiz_screen/quiz4_button.dart';
import 'quiz_screen/quiz5_button.dart';
import 'quiz_screen/quiz6_button.dart';
import 'quiz_screen/quiz7_button.dart';
import 'quiz_screen/quiz9_button.dart';

class QuizMainPage extends StatefulWidget {
  const QuizMainPage({super.key});

  @override
  State<QuizMainPage> createState() => _QuizMainPageState();
}

class _QuizMainPageState extends State<QuizMainPage> {
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
                Align(
                    alignment: Alignment.centerRight,
                    child:
                        Image(image: AssetImage('assets/images/ogrenci.png'))),
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
                      const SizedBox(height: 20),
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
                        'Quiz🐧',
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
                      const Quiz1Button(),
                      const SizedBox(height: 20),
                      const Quiz2Button(),
                      const SizedBox(height: 20),
                      const Quiz3Button(),
                      const SizedBox(height: 20),
                      const Quiz4Button(),
                      const SizedBox(height: 20),
                      const Quiz5Button(),
                      const SizedBox(height: 20),
                      const Quiz6Button(),
                      const SizedBox(height: 20),
                      const Quiz7Button(),
                      const SizedBox(height: 20),
                      const Quiz8Button(),
                      const SizedBox(height: 20),
                      const Quiz9Button(),
                      const SizedBox(height: 50),
                      Text('E-LooPsAkademi, öğrenciler ne isterse onu yapar.',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: kDeepPurple)),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
