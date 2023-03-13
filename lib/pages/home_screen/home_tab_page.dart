import 'package:flutter/material.dart';

class HomeTabImage extends StatelessWidget {
  const HomeTabImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;
    return Stack(
      children: [
        const Image(
            //height: screenHeight * 0.3,
            //width: screenWidth,
            image: AssetImage('assets/images/ogrenci1.png')),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Yıllık Eğitim Maliyetin',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Colors.deepPurple,
                    fontSize: 20),
              ),
              Row(
                children: const [
                  Text(
                    '2.000 ₺ ',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    'Olsun',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.deepPurple),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Expanded(
                    child: Divider(),
                  ),
                  Text('VE'),
                  Expanded(child: Divider())
                ],
              ),
              const SizedBox(height: 30),
              Text(
                'Dilediğin Eğitim Kurumundan \n Dilediğin Eğitime Ulaş',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Colors.deepPurple,
                    fontSize: 20),
              )
            ],
          ),
        ),
      ],
    );
  }
}
