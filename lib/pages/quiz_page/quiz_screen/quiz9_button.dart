import 'package:flutter/material.dart';
import 'package:ing_app_1502/package/ad_func.dart';
import 'package:ing_app_1502/pages/decoration_pages/colors.dart';
import 'package:ing_app_1502/pages/quiz_page/ing9_page.dart/view/ing9_first_page.dart';

class Quiz9Button extends StatelessWidget {
  const Quiz9Button({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(80),
        child: Container(
          width: constraint.maxWidth / 1 - 25,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                myAdFunction.showInterstitialAd();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Ing9FirstPage()));
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                        color: kBlueColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: kBlueColor),
                      ),
                      child: const Image(
                        image: AssetImage("assets/icons/2.png"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "True - False IX",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
