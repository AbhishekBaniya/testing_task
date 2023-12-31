import 'package:flutter/material.dart';
import 'package:hello_world/app/providers/add_employee_data_provider.dart';
import 'package:provider/provider.dart';

import 'app/providers/counter_provider.dart';
import 'app/views/home/home_page.dart';

/*void main() {
  runApp(const MyApp());
}*/
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Counter(),
        ),
        ChangeNotifierProvider(create: (_) => AddEmployeeData()),
      ],
      child: const MyApp(),
    ),
  );
}
