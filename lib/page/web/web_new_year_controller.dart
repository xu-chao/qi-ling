import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class NewYearWebLoginController {
  InAppWebViewController? webViewController;
  final CookieManager cookieManager = CookieManager.instance();
  Future<void> onWebViewCreated(InAppWebViewController controller) async {
    webViewController = controller;
    webViewController!.loadFile(assetFilePath: "assets/html/flame/index.html");
    // webViewController!.loadUrl(
    //   urlRequest: URLRequest(
    //     url: Uri.parse("http://150.158.103.146/qiling/NewYear/"),
    //     // url: Uri.file(getAssetsPath("assets/html/flame/index.html")),
    //   ),
    // );
  }

  String getAssetsPath(String path) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return 'file:///android_asset/flutter_assets/' + path;
    } else {
      return 'file://Frameworks/App.framework/flutter_assets/' + path;
    }
  }

  void onLoadStop(InAppWebViewController controller, Uri? uri) async {
    if (uri == null) {
      return;
    }
  }
}
