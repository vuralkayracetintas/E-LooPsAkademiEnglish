import 'package:flutter/material.dart';
import 'package:ing_app_1502/package/ad_func.dart';
import 'package:ing_app_1502/pages/decoration_pages/colors.dart';
import 'package:ing_app_1502/pages/kisa_konular/kisa_konular_pages/kisa_konu1_page.dart';

class KisaKonu1Ui extends StatefulWidget {
  const KisaKonu1Ui({super.key});

  @override
  State<KisaKonu1Ui> createState() => _KisaKonu1UiState();
}

class _KisaKonu1UiState extends State<KisaKonu1Ui> {
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
                        builder: (context) => const KisaKonu1Page()));
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
                        image: AssetImage("assets/icons/3.png"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Kısa Konular I",
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
