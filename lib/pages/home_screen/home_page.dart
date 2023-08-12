import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ing_app_1502/package/ad_func.dart';
import 'package:ing_app_1502/package/ad_helper.dart';
import 'package:ing_app_1502/package/notification_service.dart';
import 'package:ing_app_1502/pages/decoration_pages/colors.dart';
import 'package:ing_app_1502/pages/drawer_pages/drawer.dart';
import 'package:ing_app_1502/pages/home_screen/buttons/bilinmesi_gereken_button.dart';
import 'package:ing_app_1502/pages/home_screen/buttons/deneme_button.dart';
import 'package:ing_app_1502/pages/home_screen/buttons/digital_platform_button.dart';
import 'package:ing_app_1502/pages/home_screen/buttons/kisa_konu_button.dart';
import 'package:ing_app_1502/pages/home_screen/buttons/quiz_button_page.dart';
import 'package:ing_app_1502/pages/home_screen/home_tab_page.dart';

int maxFailedLoadAttempts = 3;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  void createBottomBannerAd() {}
}

class _HomePageState extends State<HomePage> {
  int interstitialLoadAttempts = 1;
  bool isBottomBannerAdLoaded = false;
  BannerAd? bottomBannerAd;
  InterstitialAd? interstitialAd;

  createBottomBannerAd() {
    bottomBannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: AdHelper.bannerAdUnitId,
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() {
              print('reklam calisiyor');
              isBottomBannerAdLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            print('banner reklam yuklenemedi ${error}');
          },
        ),
        request: const AdRequest());
    bottomBannerAd!.load();
  }

  // void createInterstitialAd() {
  //   InterstitialAd.load(
  //       adUnitId: AdHelper.interstitialAdUnitId,
  //       request: const AdRequest(),
  //       adLoadCallback: InterstitialAdLoadCallback(
  //         onAdLoaded: (InterstitialAd ad) {
  //           interstitialLoadAttempts = 0;
  //           interstitialAd = ad;
  //         },
  //         onAdFailedToLoad: (LoadAdError error) {
  //           print('InterstitialAd failed to load: $error');
  //           interstitialLoadAttempts += 1;
  //           if (interstitialLoadAttempts <= maxFailedLoadAttempts) {
  //             createInterstitialAd();
  //           }
  //         },
  //       ));
  // }

  // void showInterstitialAd() {
  //   if (interstitialAd != null) {
  //     interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
  //         onAdDismissedFullScreenContent: (InterstitialAd ad) {
  //       ad.dispose();
  //       createInterstitialAd();
  //     }, onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
  //       ad.dispose();
  //       createInterstitialAd();
  //     });
  //     interstitialAd!.show();
  //   }
  // }

  final service = FirebaseNotificationService();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin(); // TODO

  @override
  void initState() {
    super.initState();
    createBottomBannerAd();
    myAdFunction.createInterstitialAd();
    service.connectionNotification(); //TODO
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
                fontSize: 18, fontWeight: FontWeight.bold, color: kDeepPurple),
          ),
        ),
        drawer: const HomeDrawerPage(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const HomeTabImage(),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: .85,
                crossAxisSpacing: .1,
                mainAxisSpacing: 20,
                children: const [
                  DigitalPlatformButton(),
                  DenemeButton(),
                  BilinmesiGerekenButton(),
                  KisaKonuButton(),
                  QuizButton(),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
