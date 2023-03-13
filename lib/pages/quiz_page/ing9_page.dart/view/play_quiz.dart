import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ing_app_1502/package/ad_func.dart';
import 'package:ing_app_1502/package/ad_helper.dart';
import 'package:ing_app_1502/pages/quiz_page/ing9_page.dart/data/data.dart';
import 'package:ing_app_1502/pages/quiz_page/ing9_page.dart/model/model.dart';
import 'package:ing_app_1502/pages/quiz_page/ing9_page.dart/view/result.dart';

class ing9PlayQuiz extends StatefulWidget {
  const ing9PlayQuiz({super.key});

  @override
  State<ing9PlayQuiz> createState() => _ing9PlayQuizState();
}

class _ing9PlayQuizState extends State<ing9PlayQuiz>
    with SingleTickerProviderStateMixin {
  List<Ing9QuestionModel> questions = <Ing9QuestionModel>[];
  int index = 0;
  int points = 0;
  int correct = 0;
  int incorrect = 0;

  late AnimationController controller;

  late Animation animation;

  double beginAnim = 0.0;

  double endAnim = 1.0;
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

    questions = getQuestions();
    createBottomBannerAd();
    myAdFunction.createInterstitialAd();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween(begin: beginAnim, end: endAnim).animate(controller)
      ..addListener(() {
        setState(() {
          // Change here any Animation object value.
        });
      });

    startProgress();

    animation.addStatusListener((AnimationStatus animationStatus) {
      if (animationStatus == AnimationStatus.completed) {
        if (index < questions.length - 1) {
          index++;
          resetProgress();
          startProgress();
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Quiz9Result(
                        score: points,
                        totalQuestion: questions.length,
                        correct: correct,
                        incorrect: incorrect,
                        notattempted: 0,
                      )));
        }
      }
    });
  }

  startProgress() {
    controller.forward();
  }

  stopProgress() {
    controller.stop();
  }

  resetProgress() {
    controller.reset();
  }

  void nextQuestion() {
    if (index < questions.length - 1) {
      index++;
      resetProgress();
      startProgress();
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Quiz9Result(
                    score: points,
                    totalQuestion: questions.length,
                    correct: correct,
                    incorrect: incorrect,
                    notattempted: 0,
                  )));
    }
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
        iconTheme: const IconThemeData(color: Colors.deepPurple),
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "E-LooPsAkademi",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 80),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "${index + 1}/${questions.length}",
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Question",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "$points",
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Point",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              questions[index].getQuestion() + "",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            LinearProgressIndicator(
              value: animation.value,
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(110, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          )),
                      onPressed: () {
                        isTrue();
                      },
                      child: const Text(
                        'True',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          minimumSize: Size(110, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          )),
                      onPressed: () {
                        isFalse();
                      },
                      child: const Text(
                        'False',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void isTrue() {
    if (questions[index].getAnswer() == "True") {
      setState(() {
        points = points + 10;
        nextQuestion();
        correct++;
      });
    } else {
      setState(() {
        points = points - 5;
        nextQuestion();
        incorrect++;
      });
    }
  }

  void isFalse() {
    if (questions[index].getAnswer() == "False") {
      setState(() {
        points = points + 10;
        nextQuestion();
        correct++;
      });
    } else {
      setState(() {
        points = points - 5;
        nextQuestion();
        incorrect++;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
    bottomBannerAd?.dispose();
    interstitialAd?.dispose();
  }
}
