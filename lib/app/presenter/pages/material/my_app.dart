import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //actionIconTheme: ActionIconThemeData(backButtonIconBuilder: ),
        //brightness: Brightness.dark,
        bannerTheme:
            const MaterialBannerThemeData(backgroundColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Trainings'),
    );
  }
}
