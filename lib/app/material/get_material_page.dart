import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/data_filter/binding.dart';
import '../home/data_filter/data_filter_view.dart';
import '../manager/routes/app_pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        key: UniqueKey(),
        initialRoute: AppRoutes.INITIAL,
        initialBinding: AppBinding(),
        getPages: AppPages.pages,
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(useMaterial3: true),
        defaultTransition: Transition.native,
        enableLog: true,
        title: 'Flutter Demo',
        themeMode: ThemeMode.system,
        /*ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),*/

        home: const DataFilterPage(title: "GridView"),
      );
}
