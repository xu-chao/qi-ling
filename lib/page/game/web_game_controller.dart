import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class GameWebController {
  InAppWebViewController? webViewController;
  final CookieManager cookieManager = CookieManager.instance();
  Future<void> onWebViewCreated(InAppWebViewController controller) async {
    webViewController = controller;
    webViewController!.loadUrl(
      urlRequest: URLRequest(
        url: Uri.parse("https://aidn.jp/mikutap/"),
      ),
    );
  }

  void onLoadStop(InAppWebViewController controller, Uri? uri) async {
    if (uri == null) {
      return;
    }
  }
}
