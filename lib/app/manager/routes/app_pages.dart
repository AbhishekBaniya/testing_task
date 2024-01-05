import 'package:get/get.dart';

import '../../home/data_filter/binding.dart';
import '../../material/get_material_page.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => const MyApp(),
      title: "Home",
      binding: AppBinding(),
      popGesture: true,
      transitionDuration: Duration.zero,
      maintainState: true,
      transition: Transition.upToDown,
    ),
    //GetPage(name: Routes.APRESENTACAO, page:()=> ApresentacaoPage()),
  ];
}
