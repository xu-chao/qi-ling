import 'package:get/get.dart';

import '../page/donate/donate_page.dart';
import '../page/game/web_game_controller.dart';
import '../page/game/web_game_page.dart';
import '../page/love/love_page.dart';
import '../page/web/web_new_year_controller.dart';
import '../page/web/web_new_year_page.dart';
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
    //本地html页面
    GetPage(
      name: RoutePath.kNewYearWeb,
      page: () => const NewYearWebPage(),
      bindings: [
        BindingsBuilder.put(() => NewYearWebController()),
      ],
    ),
    //音游页面
    GetPage(
      name: RoutePath.kGameWeb,
      page: () => const GameWebPage(),
      bindings: [
        BindingsBuilder.put(() => GameWebController()),
      ],
    ),
    //Love
    GetPage(
      name: RoutePath.kLove,
      page: () => const LovePage()
    ),
    //捐赠
    GetPage(
        name: RoutePath.kDonate,
        page: () => const DonatePage()
    ),
  ];
}
