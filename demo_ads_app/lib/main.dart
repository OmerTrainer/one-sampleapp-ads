import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ONE DEMO GOOGLE ADS APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AdManagerBannerAd? underMainArticleBanner;

  Future createUnderMainArticleBannerAd(String adUnitId) async {
    await AdManagerBannerAd(
      adUnitId: adUnitId,
      sizes: [AdSize.largeBanner],
      request: const AdManagerAdRequest(),
      listener: AdManagerBannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            underMainArticleBanner = ad as AdManagerBannerAd;
          });
        },
        onAdFailedToLoad: (ad, error) {
          setState(() {
            underMainArticleBanner = null;
          });
          print('Ad load failed (code=${error.code} message=${error.message})');
          ad.dispose();
        },
      ),
    ).load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(shrinkWrap: true, children: [
        Container(
          color: const Color(0xFFD0D0D0),
          height: underMainArticleBanner!.sizes[0].height.toDouble(),
          width: MediaQuery.of(context).size.width,
          child: AdWidget(ad: underMainArticleBanner!),
        )
      ]),
    );
  }
}
