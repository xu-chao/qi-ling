/// This widget displays User's image when it is collapsed;
/// It displays name too, when expanded.
///
/// It resides on the Right-Bottom Section.

import 'package:flutter/material.dart';
// 将html字符串解析为dom的库
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import '../main.dart';
import '../routes/route_path.dart';

Widget userCard() {
  late InAppWebViewController inAppWebViewController;
  return AnimatedContainer(
    // Right Bottom  Widget
    duration: normal,
    height: rCollapsed,
    width: leftActive ? rCollapsed : rExpanded,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        AnimatedContainer(
          // User Name
          duration: normal,
          height: rCollapsed,
          width: leftActive ? 0 : rExpanded - rCollapsed,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          alignment: Alignment.centerLeft,
          child: AnimatedOpacity(
            duration: fast,
            opacity: leftActive ? 0 : 1,
            child: const Text(
              '你是对的人',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
            ),
          ),
        ),
        Container(
          height: rCollapsed,
          width: rCollapsed,
          padding: const EdgeInsets.all(20),
          child: InkWell(
            child: Container(
              // User Pic
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(50),
                image: const DecorationImage(
                    image: AssetImage('assets/images/qiling.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            onTap: (){
              Get.toNamed(RoutePath.kNewYearWebLogin);
              // InAppWebView(
              //   initialUrlRequest: URLRequest(url: Uri.parse('http://150.158.103.146/qiling/NewYear/')),
              //   onLoadStop: (controller, url) async {
              //     // 加载完成
              //     inAppWebViewController = controller;
              //     print("加载地址：$url");
              //     var html = await controller.getHtml();
              //     debugPrint("html是：${html.toString().trim()}");
              //   },
              // );
            },
          )
        ),
      ],
    ),
  );
}
