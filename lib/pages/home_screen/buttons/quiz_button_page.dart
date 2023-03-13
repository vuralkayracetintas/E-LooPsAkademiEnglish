import 'package:flutter/material.dart';
import 'package:ing_app_1502/package/ad_func.dart';
import 'package:ing_app_1502/pages/quiz_page/quiz_main_page.dart';

class QuizButton extends StatelessWidget {
  const QuizButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        myAdFunction.showInterstitialAd();
        Navigator.push(context,
            (MaterialPageRoute(builder: (context) => const QuizMainPage())));
      },
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 0,
                offset: Offset(0, 3),
                blurRadius: 7,
              ),
            ],
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(25),
            color: Colors.white),
        margin: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Image(
              image: AssetImage("assets/gorsel/abcd.png"),
              height: 100,
              width: 150,
            ),
            Text(
              'QUIZ',
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
