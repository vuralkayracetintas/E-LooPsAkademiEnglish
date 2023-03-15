import 'package:flutter/material.dart';
import 'package:ing_app_1502/package/url.dart';
import 'package:ing_app_1502/pages/drawer_pages/ataturk.dart';

class HomeDrawerPage extends StatefulWidget {
  const HomeDrawerPage({super.key});

  @override
  State<HomeDrawerPage> createState() => _HomeDrawerPageState();
}

class _HomeDrawerPageState extends State<HomeDrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Image.asset(
            "assets/gorsel/abcd.png",
            width: 150,
            height: 150,
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            title: const Text(
              'Mustafa Kemal Atatürk',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Ataturk()));
            },
          ),
          ListTile(
            title: const Text('Diğer Uygulamalar'),
            onTap: () {
              launched = launchInBrowser(appler);
            },
          ),
          ListTile(
            title: const Text('Eğitim İçerikleri Tümü -Web-'),
            onTap: () {
              launched = launchInBrowser(icerikler);
            },
          ),
          ListTile(
            title: const Text('Eğitim Kurumları -Web-'),
            onTap: () {
              launched = launchInBrowser(egitmenler);
            },
          ),
          // ListTile(
          //   title: const Text('Bizi Davet Edin'),
          //   onTap: () {
          //     launched = launchInBrowser(bizidavet);
          //   },
          // ),
          ListTile(
            title: const Text('Instagram'),
            onTap: () {
              launched = launchInBrowser(instagram);
            },
          ),
          // ListTile(
          //   title: const Text('Discord'),
          //   onTap: () {
          //     launched = launchInBrowser(dc);
          //   },
          // ),
          // ListTile(
          //   title: const Text('İletişim'),
          //   onTap: () {
          //     launched = launchInBrowser(iletisim);
          //   },
          // ),

          ListTile(
            title: const Text(
              'Ingilizce YDT',
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
