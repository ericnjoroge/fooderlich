import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../models/models.dart';

class WebViewScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
        name: FooderlichPages.externalLink,
        key: ValueKey(FooderlichPages.externalLink),
        child: const WebViewScreen());
  }

  const WebViewScreen({Key? key}) : super(key: key);

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  void initState() {
    super.initState();
    //Enable Hybrid Composition
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('akenyandev.co.ke'),
      ),
      body: const WebView(
        initialUrl: 'https://akenyandev.co.ke',
      ),
    );
  }
}
