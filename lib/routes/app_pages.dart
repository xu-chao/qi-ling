import 'package:get/get.dart';

import '../page/web/web_new_year_controller.dart';
import '../page/web/web_new_year_page.dart';
import '../page/donate/donate_page.dart';
import 'route_path.dart';

class AppPages {
  AppPages._();
  static final routes = [
    // // 首页
    // GetPage(
    //   name: RoutePath.kIndex,
    //   page: () => const IndexedPage(),
    //   bindings: [
    //     BindingsBuilder.put(() => IndexedController()),
    //     //BindingsBuilder.put(() => HomeController()),
    //   ],
    // ),
    //哔哩哔哩Web登录
    GetPage(
      name: RoutePath.kNewYearWebLogin,
      page: () => const NewYearWebLoginPage(),
      bindings: [
        BindingsBuilder.put(() => NewYearWebLoginController()),
      ],
    ),
    //捐赠
    GetPage(
        name: RoutePath.kDonate,
        page: () => const DonatePage()
    ),
  ];
}
