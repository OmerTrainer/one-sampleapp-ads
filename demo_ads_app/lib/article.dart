import 'package:demo_ads_app/webview_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SecondaryArticle extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String authorName;
  final String articleUrl;

  final AdManagerBannerAd? bottomSheetAd;

  final bool? isAd;
  final bool isVideo;
  const SecondaryArticle({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.authorName,
    required this.articleUrl,
    required this.bottomSheetAd,
    this.isVideo = false,
    this.isAd,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: ((context) =>
                WebviewScreen(url: articleUrl, bottomSheetAd: bottomSheetAd))));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.width * 0.262,
          color: isAd == null
              ? const Color(0xFFededed)
              : isAd!
                  ? const Color(0xFFD0D0D0)
                  : const Color(0xFFededed),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 374 / 192,
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Image.network(
                        imageUrl,
                        fit: BoxFit.fill,
                      ),
                      isVideo
                          ? Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.055,
                                width:
                                    MediaQuery.of(context).size.height * 0.055,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    stops: const [.5, .5],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.black.withOpacity(0.3),
                                      Colors.transparent, // top Right part
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 4,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.2,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 0.0),
                              child: Text(
                                isAd != null
                                    ? isAd!
                                        ? 'תוכן ממומן'
                                        : authorName
                                    : authorName,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
