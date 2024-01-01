import 'package:flutter/material.dart';
import 'package:hello_world/app/providers/add_employee_data_provider.dart';
import 'package:hello_world/app/views/home/add_data_form/add_data_form_page.dart';
import 'package:hello_world/app/views/widgets/app_parent_widget.dart';
import 'package:provider/provider.dart';

import '../../widgets/app_text_widget.dart';

class EmployeeListPage extends StatefulWidget {
  const EmployeeListPage({super.key, required this.title});

  final String title;

  @override
  State<EmployeeListPage> createState() => _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage> {
  final items = List<String>.generate(20, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    return AppParentWidget(
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
          //padding: const EdgeInsets.symmetric(horizontal: 16.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.shade400,
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: const AppText(
                  label: "Current employees",
                  textAlign: TextAlign.start,
                  textStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 16.0,
                  ),
                ),
              ),
              context.watch<AddEmployeeData>().getData?.length != null
                  ? Expanded(
                      child: ListView.builder(
                        itemCount:
                            context.watch<AddEmployeeData>().getData?.length,
                        itemBuilder: (BuildContext ctx, int index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Dismissible(
                            direction: DismissDirection.endToStart,
                            key: UniqueKey(),
                            onUpdate: (value) {
                              context.watch<AddEmployeeData>().getData;
                            },
                            onDismissed: (direction) {
                              context.read<AddEmployeeData>().deleteData(index);

                              //debugPrint(context.watch<AddEmployeeData>().getData.toString());
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      "Item ${context.watch<AddEmployeeData>().getData?[index]} dismissed")));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1.0, color: Colors.grey.shade400),
                                ),
                              ),
                              child: context
                                          .watch<AddEmployeeData>()
                                          .getData
                                          ?.length !=
                                      null
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6.0, vertical: 6.0),
                                          child: AppText(
                                            label:
                                                "${context.watch<AddEmployeeData>().getData?[index].eName}",
                                            textAlign: TextAlign.start,
                                            textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6.0, vertical: 6.0),
                                          child: AppText(
                                            label:
                                                "${context.watch<AddEmployeeData>().getData?[index].eRoll}",
                                            textAlign: TextAlign.start,
                                            textStyle: TextStyle(
                                              color: Colors.grey.shade400,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "${context.watch<AddEmployeeData>().getData?[index].fromDate}",
                                                style: TextStyle(
                                                    color:
                                                        Colors.grey.shade600),
                                              ),
                                              Text(
                                                "${context.watch<AddEmployeeData>().getData?[index].toDate}",
                                                style: TextStyle(
                                                    color:
                                                        Colors.grey.shade600),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : const LinearProgressIndicator(
                                      color: Colors.green),
                            ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 244.37,
                      width: 261.78,
                      child: Image.asset(
                        "assets/images/no_record.png",
                      ),
                    ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.shade400,
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: const AppText(
                  label: "Current employees",
                  textAlign: TextAlign.start,
                  textStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 16.0,
                  ),
                ),
              ),
              context.watch<AddEmployeeData>().getData?.length != null
                  ? Expanded(
                      child: ListView.builder(
                        itemCount:
                            context.watch<AddEmployeeData>().getData?.length,
                        itemBuilder: (BuildContext ctx, int index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Dismissible(
                            direction: DismissDirection.endToStart,
                            key: UniqueKey(),
                            onUpdate: (value) {
                              context.watch<AddEmployeeData>().getData;
                            },
                            onDismissed: (direction) {
                              context.read<AddEmployeeData>().deleteData(index);

                              //debugPrint(context.watch<AddEmployeeData>().getData.toString());
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      "Item ${context.watch<AddEmployeeData>().getData?[index]} dismissed")));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1.0, color: Colors.grey.shade400),
                                ),
                              ),
                              child: context
                                          .watch<AddEmployeeData>()
                                          .getData
                                          ?.length !=
                                      null
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6.0, vertical: 6.0),
                                          child: AppText(
                                            label:
                                                "${context.watch<AddEmployeeData>().getData?[index].eName}",
                                            textAlign: TextAlign.start,
                                            textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6.0, vertical: 6.0),
                                          child: AppText(
                                            label:
                                                "${context.watch<AddEmployeeData>().getData?[index].eRoll}",
                                            textAlign: TextAlign.start,
                                            textStyle: TextStyle(
                                              color: Colors.grey.shade400,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "${context.watch<AddEmployeeData>().getData?[index].fromDate}",
                                                style: TextStyle(
                                                    color:
                                                        Colors.grey.shade600),
                                              ),
                                              Text(
                                                "${context.watch<AddEmployeeData>().getData?[index].toDate}",
                                                style: TextStyle(
                                                    color:
                                                        Colors.grey.shade600),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : const LinearProgressIndicator(
                                      color: Colors.green),
                            ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 244.37,
                      width: 261.78,
                      child: Image.asset(
                        "assets/images/no_record.png",
                      ),
                    ),
            ],
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

  @override
  void initState() {
    context.read<AddEmployeeData>().loadData();
    super.initState();
  }
}
