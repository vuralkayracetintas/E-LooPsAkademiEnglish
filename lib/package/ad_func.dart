import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ing_app_1502/package/ad_helper.dart';

int maxFailedLoadAttempts = 3;
int interstitialLoadAttempts = 1;
bool isBottomBannerAdLoaded = false;
BannerAd? bottomBannerAd;
InterstitialAd? interstitialAd;

class myAdFunction {
  static void createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: AdHelper.interstitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            print('video reklam yuklendi');
            interstitialLoadAttempts = 0;
            interstitialAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('video reklam yuklenmedi');
            print('InterstitialAd failed to load: $error');
            interstitialLoadAttempts += 1;
            if (interstitialLoadAttempts <= maxFailedLoadAttempts) {
              createInterstitialAd();
            }
          },
        ));
  }

  static void showInterstitialAd() {
    if (interstitialAd != null) {
      interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
          onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        createInterstitialAd();
      }, onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        ad.dispose();
        createInterstitialAd();
      });
      interstitialAd!.show();
    }
  }
}
