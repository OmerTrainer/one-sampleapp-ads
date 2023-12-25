import 'package:demo_ads_app/article.dart';
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
  AdManagerBannerAd? aboveVideoSectionBanner;
  AdManagerBannerAd? underVideoSectionBanner;
  AdManagerBannerAd? underGlitchesSectionBanner;
  AdManagerBannerAd? bottomSheetAd;

  Future createUnderGlitchesBannerAd() async {
    await AdManagerBannerAd(
      adUnitId: '/6870/one_app/one_iphone_kubia_main',
      sizes: [AdSize.mediumRectangle],
      request: const AdManagerAdRequest(),
      listener: AdManagerBannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            underGlitchesSectionBanner = ad as AdManagerBannerAd;
          });
        },
        onAdFailedToLoad: (ad, error) {
          setState(() {
            underGlitchesSectionBanner = null;
          });
          print('Ad load failed (code=${error.code} message=${error.message})');
          ad.dispose();
        },
      ),
    ).load();
  }

  Future createAboveVideoSectionBannerAd() async {
    await AdManagerBannerAd(
      adUnitId: '/6870/one_app/one_doublestrip',
      sizes: [AdSize.largeBanner],
      request: const AdManagerAdRequest(),
      listener: AdManagerBannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            aboveVideoSectionBanner = ad as AdManagerBannerAd;
          });
        },
        onAdFailedToLoad: (ad, error) {
          setState(() {
            aboveVideoSectionBanner = null;
          });
          print('Ad load failed (code=${error.code} message=${error.message})');
          ad.dispose();
        },
      ),
    ).load();
  }

  Future createUnderVideoSectionBannerAd() async {
    await AdManagerBannerAd(
      adUnitId: '/6870/one_app/one_iphone_banners_new/ONE_Iphone_Banners_Store',
      sizes: [AdSize.banner],
      request: const AdManagerAdRequest(),
      listener: AdManagerBannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            underVideoSectionBanner = ad as AdManagerBannerAd;
          });
        },
        onAdFailedToLoad: (ad, error) {
          setState(() {
            underVideoSectionBanner = null;
          });
          print('Ad load failed (code=${error.code} message=${error.message})');
          ad.dispose();
        },
      ),
    ).load();
  }

  Future createUnderMainArticleBannerAd() async {
    await AdManagerBannerAd(
      adUnitId: '/6870/one_app/one_doublestrip_top',
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

  Future createBottomSheetAd() async {
    await AdManagerBannerAd(
      adUnitId: '/6870/ONE_APP/ONE_Iphone_Banners_New/ONE_Iphone_Banners_Main',
      sizes: [AdSize.banner, AdSize.fluid],
      request: const AdManagerAdRequest(),
      listener: AdManagerBannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            bottomSheetAd = ad as AdManagerBannerAd;
          });
        },
        onAdFailedToLoad: (ad, error) {
          setState(() {
            bottomSheetAd = null;
          });
          print('Ad load failed (code=${error.code} message=${error.message})');
          ad.dispose();
        },
      ),
    ).load();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createUnderMainArticleBannerAd();
    createAboveVideoSectionBannerAd();
    createUnderGlitchesBannerAd();
    createUnderVideoSectionBannerAd();
    createBottomSheetAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: bottomSheetAd != null
          ? Container(
              color: const Color(0xFFD0D0D0),
              height: bottomSheetAd?.sizes[0].height.toDouble() ?? 0,
              width: MediaQuery.of(context).size.width,
              child: AdWidget(ad: bottomSheetAd!),
            )
          : null,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          ...[
            SecondaryArticle(
                title: 'fsafas',
                imageUrl: 'https://photo.one.co.il/Image/GG/2,1/1700584.webp',
                authorName: 'yossi'),
            SecondaryArticle(
                title: 'fsafas',
                imageUrl: 'https://photo.one.co.il/Image/GG/2,1/1700584.webp',
                authorName: 'yossi'),
            SecondaryArticle(
                title: 'fsafas',
                imageUrl: 'https://photo.one.co.il/Image/GG/2,1/1700584.webp',
                authorName: 'yossi'),
            SecondaryArticle(
                title: 'fsafas',
                imageUrl: 'https://photo.one.co.il/Image/GG/2,1/1700584.webp',
                authorName: 'yossi'),
            SecondaryArticle(
                title: 'fsafas',
                imageUrl: 'https://photo.one.co.il/Image/GG/2,1/1700584.webp',
                authorName: 'yossi'),
          ],
          underMainArticleBanner != null
              ? Container(
                  color: const Color(0xFFD0D0D0),
                  height: underMainArticleBanner!.sizes[0].height.toDouble(),
                  width: MediaQuery.of(context).size.width,
                  child: AdWidget(ad: underMainArticleBanner!),
                )
              : const SizedBox.shrink(),
          Container(
            height: 300,
            color: Colors.amber,
          ),
          aboveVideoSectionBanner != null
              ? Container(
                  color: const Color(0xFFD0D0D0),
                  height: aboveVideoSectionBanner!.sizes[0].height.toDouble(),
                  width: MediaQuery.of(context).size.width,
                  child: AdWidget(ad: aboveVideoSectionBanner!),
                )
              : const SizedBox.shrink(),
          ...[
            SecondaryArticle(
                title: 'fsafas',
                imageUrl: 'https://photo.one.co.il/Image/GG/2,1/1700584.webp',
                authorName: 'yossi'),
            SecondaryArticle(
                title: 'fsafas',
                imageUrl: 'https://photo.one.co.il/Image/GG/2,1/1700584.webp',
                authorName: 'yossi'),
            SecondaryArticle(
                title: 'fsafas',
                imageUrl: 'https://photo.one.co.il/Image/GG/2,1/1700584.webp',
                authorName: 'yossi'),
            SecondaryArticle(
                title: 'fsafas',
                imageUrl: 'https://photo.one.co.il/Image/GG/2,1/1700584.webp',
                authorName: 'yossi'),
            SecondaryArticle(
                title: 'fsafas',
                imageUrl: 'https://photo.one.co.il/Image/GG/2,1/1700584.webp',
                authorName: 'yossi'),
          ],
          Container(
            height: 300,
            color: Colors.amber,
          ),
          ...[
            SecondaryArticle(
                title: 'fsafas',
                imageUrl: 'https://photo.one.co.il/Image/GG/2,1/1700584.webp',
                authorName: 'yossi'),
            SecondaryArticle(
                title: 'fsafas',
                imageUrl: 'https://photo.one.co.il/Image/GG/2,1/1700584.webp',
                authorName: 'yossi'),
            SecondaryArticle(
                title: 'fsafas',
                imageUrl: 'https://photo.one.co.il/Image/GG/2,1/1700584.webp',
                authorName: 'yossi'),
            SecondaryArticle(
                title: 'fsafas',
                imageUrl: 'https://photo.one.co.il/Image/GG/2,1/1700584.webp',
                authorName: 'yossi'),
            SecondaryArticle(
                title: 'fsafas',
                imageUrl: 'https://photo.one.co.il/Image/GG/2,1/1700584.webp',
                authorName: 'yossi'),
          ],
          underVideoSectionBanner != null
              ? Container(
                  color: const Color(0xFFD0D0D0),
                  height: underVideoSectionBanner!.sizes[0].height.toDouble(),
                  width: MediaQuery.of(context).size.width,
                  child: AdWidget(ad: underVideoSectionBanner!),
                )
              : const SizedBox.shrink(),
          Container(
            height: 300,
            color: Colors.amber,
          ),
          underGlitchesSectionBanner != null
              ? Container(
                  color: const Color(0xFFD0D0D0),
                  height:
                      underGlitchesSectionBanner!.sizes[0].height.toDouble(),
                  width: MediaQuery.of(context).size.width,
                  child: AdWidget(ad: underGlitchesSectionBanner!),
                )
              : const SizedBox.shrink(),
          Container(
            height: 300,
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}
