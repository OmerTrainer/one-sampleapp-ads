import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class WebviewScreen extends StatefulWidget {
  final String url;
  final AdManagerBannerAd? bottomSheetAd;
  const WebviewScreen(
      {Key? key, required this.url, required this.bottomSheetAd})
      : super(key: key);

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  InAppWebViewSettings options = InAppWebViewSettings(
    useShouldOverrideUrlLoading: true,
    javaScriptCanOpenWindowsAutomatically: true,
    javaScriptEnabled: true,
    mediaPlaybackRequiresUserGesture: false,
    useHybridComposition: true,
    thirdPartyCookiesEnabled: true,
    allowsInlineMediaPlayback: true,
    sharedCookiesEnabled: true,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomSheet: widget.bottomSheetAd != null
            ? Container(
                color: const Color(0xFFD0D0D0),
                height: widget.bottomSheetAd?.sizes[0].height.toDouble() ?? 0,
                width: MediaQuery.of(context).size.width,
                child: AdWidget(ad: widget.bottomSheetAd!),
              )
            : null,
        body: InAppWebView(
          key: webViewKey,
          initialSettings: options,
          initialUrlRequest: URLRequest(url: WebUri(widget.url)),
        ),
      ),
    );
  }
}
