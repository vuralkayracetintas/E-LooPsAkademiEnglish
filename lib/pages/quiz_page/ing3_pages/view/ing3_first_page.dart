import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ing_app_1502/package/ad_func.dart';
import 'package:ing_app_1502/package/ad_helper.dart';
import 'package:ing_app_1502/pages/quiz_page/ing2_pages/view/play_quiz.dart';
import 'package:ing_app_1502/pages/quiz_page/ing3_pages/view/play_quiz.dart';

class Ing3FirstPage extends StatefulWidget {
  const Ing3FirstPage({super.key});

  @override
  State<Ing3FirstPage> createState() => _Ing3FirstPageState();
}

class _Ing3FirstPageState extends State<Ing3FirstPage> {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "E-LooPsAkademi",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Center(
              child: Text(
                "True - False",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Center(
              child: Text(
                "III",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 70),
            // GestureDetector(
            //   onTap: () {
            //     // Navigator.pushReplacement(context,
            //     //     MaterialPageRoute(builder: (context) => ing1PlayQuiz()));
            //   },
            //   child: Container(
            //     padding:
            //         const EdgeInsets.symmetric(vertical: 12, horizontal: 54),
            //     decoration: BoxDecoration(
            //         color: Colors.blue,
            //         borderRadius: BorderRadius.circular(24)),
            //     child: const Text(
            //       "Start",
            //       style: TextStyle(color: Colors.white, fontSize: 18),
            //     ),
            //   ),
            // ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 45),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24))),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ing3PlayQuiz(),
                  ),
                );
              },
              child: const Text(
                'Start',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              "Türkiye Geneli Online Testlere\nKatıl ve Başarını Gör",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red, fontSize: 18),
            ),
            const SizedBox(height: 50),
            const Text(
              "E-LooPsAkademi öğrenciler ne isterse onu yapar ❤",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
