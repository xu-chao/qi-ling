import 'package:get/get.dart';

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
    //捐赠
    GetPage(
        name: RoutePath.kDonate,
        page: () => const DonatePage()
    ),
  ];
}
