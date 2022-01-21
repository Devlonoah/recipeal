import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:recipeal/theme/colors.dart';

class WebViewPage extends StatefulWidget {
  static String id = "WebViewPage";
  const WebViewPage({Key? key}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  FlutterWebviewPlugin? flutterWebViewPlugin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // if (Platform.isAndroid) WebView.platform = AndroidWebView();

    flutterWebViewPlugin = FlutterWebviewPlugin();
  }

  @override
  Widget build(BuildContext context) {
    final dataPassed = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      body: SafeArea(
        child: WebviewScaffold(
          appBar: AppBar(),
          url: dataPassed,
          initialChild: Center(
            child: SpinKitFadingCircle(
              color: kkPink,
            ),
          ),
        ),
      ),
    );
  }
}
