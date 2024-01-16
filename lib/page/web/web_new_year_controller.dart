import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class NewYearWebLoginController {
  InAppWebViewController? webViewController;
  final CookieManager cookieManager = CookieManager.instance();
  void onWebViewCreated(InAppWebViewController controller) {
    webViewController = controller;
    webViewController!.loadUrl(
      urlRequest: URLRequest(
        url: Uri.parse("http://150.158.103.146/qiling/NewYear/"),
      ),
    );
  }

  void onLoadStop(InAppWebViewController controller, Uri? uri) async {
    if (uri == null) {
      return;
    }
  }
}
