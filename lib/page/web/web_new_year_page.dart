import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:qiling/page/web/web_new_year_controller.dart';

class NewYearWebLoginPage extends GetView<NewYearWebLoginController> {
  const NewYearWebLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("总喜欢做一些傻事去表达自己"),
      ),
      body: InAppWebView(
        onWebViewCreated: controller.onWebViewCreated,
        onLoadStop: controller.onLoadStop,
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            userAgent:
                "Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1 Edg/118.0.0.0",
            useShouldOverrideUrlLoading: true,
          ),
        ),
        shouldOverrideUrlLoading: (webController, navigationAction) async {
          return NavigationActionPolicy.ALLOW;
        },
      ),
    );
  }
}
