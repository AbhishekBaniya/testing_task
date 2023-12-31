import 'package:flutter/material.dart';
import 'package:hello_world/app/views/home/add_data_form/add_data_form_page.dart';
import 'package:hello_world/app/views/widgets/app_parent_widget.dart';

import '../../widgets/app_text_widget.dart';

class EmployeeListPage extends StatefulWidget {
  const EmployeeListPage({super.key, required this.title});

  final String title;

  @override
  State<EmployeeListPage> createState() => _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage> {
  @override
  Widget build(BuildContext context) => AppParentWidget(
        safeAreaTop: true,
        resizeToAvoidBottomInset: true,
        bgColor: Colors.grey.shade300,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: Colors.blue),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: AppText(
              label: widget.title,
              softWrap: false,
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
        bodyWidget: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SizedBox(
              height: 244.37,
              width: 261.78,
              child: Image.asset(
                "assets/images/no_record.png",
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          key: const Key('increment_floatingActionButton'),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const AddEmployeeDetailsPage(title: "Add Employee Details"),
            ),
          ),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );
}
