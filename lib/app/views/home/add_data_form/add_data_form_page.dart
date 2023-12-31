import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_world/app/providers/add_employee_data_provider.dart';
import 'package:hello_world/app/views/widgets/app_parent_widget.dart';
import 'package:hello_world/app/views/widgets/custom_button_widget.dart';
import 'package:hello_world/app/views/widgets/custom_calendar_widget.dart';
import 'package:provider/provider.dart';

import '../../widgets/app_text_widget.dart';

class AddEmployeeDetailsPage extends StatefulWidget {
  const AddEmployeeDetailsPage({super.key, required this.title});

  final String title;

  @override
  State<AddEmployeeDetailsPage> createState() => _EmployeeDetailsPageState();
}

class _EmployeeDetailsPageState extends State<AddEmployeeDetailsPage> {
  @override
  Widget build(BuildContext context) => AppParentWidget(
        safeAreaTop: true,
        resizeToAvoidBottomInset: true,
        bgColor: Colors.white,
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
        bodyWidget: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 24.0,
              ),
              DottedBorder(
                color: Colors.grey.shade400,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: Container(
                    height: 40.0,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                        //FilteringTextInputFormatter.deny(RegExp('[abFeG]')),
                      ],
                      keyboardType: TextInputType.name,
                      controller: context
                          .watch<AddEmployeeData>()
                          .employeeNameController,
                      onChanged: (value) => context
                          .read<AddEmployeeData>()
                          .setEmployeeName(value),

                      //onEditingComplete: () => context.read<AddEmployeeData>().setEmployeeName("eName"),
                      cursorColor: Colors.blue,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal),
                      decoration: InputDecoration(
                        prefixIcon:
                            const Icon(Icons.person, color: Colors.blue),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(0),
                        ),
                        hintText: "Enter Employee Name",
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              InkWell(
                onTap: () => _modalBottomSheetMenu(),
                child: DottedBorder(
                  color: Colors.grey.shade400,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Container(
                      height: 40.0,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.work_outline, color: Colors.blue),
                          ),
                          Expanded(
                            child: AppText(
                              label: context
                                  .watch<AddEmployeeData>()
                                  .eProfession
                                  .toString(),
                              softWrap: false,
                              textStyle: TextStyle(
                                color: context
                                            .watch<AddEmployeeData>()
                                            .eProfession
                                            .toString() ==
                                        "Select Role"
                                    ? Colors.grey.shade400
                                    : Colors.black,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          const Icon(Icons.arrow_drop_down, color: Colors.blue),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        ///TODO
                        showFromDateDialog();
                      },
                      child: DottedBorder(
                        color: Colors.grey.shade400,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          child: Container(
                            height: 40.0,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.calendar_today_outlined,
                                      color: Colors.blue),
                                ),
                                Expanded(
                                  child: AppText(
                                    label: widget.title,
                                    softWrap: false,
                                    textStyle: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Icon(Icons.arrow_forward, color: Colors.blue),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        ///TODO
                      },
                      child: DottedBorder(
                        color: Colors.grey.shade400,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          child: Container(
                            height: 40.0,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.calendar_today_outlined,
                                      color: Colors.blue),
                                ),
                                Expanded(
                                  child: AppText(
                                    label: widget.title,
                                    softWrap: false,
                                    textStyle: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 80.0,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const Divider(
                  height: 2.0, thickness: 1.0, color: Color(0xffF2F2F2)),
              Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: AppButton(
                          bgColor: const Color(0xffEDF8FF),
                          labelColor: const Color(0xff1DA1F2),
                          label: "Cancel",
                          onTap: () {
                            print("object");
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: AppButton(
                          bgColor: const Color(0xff1DA1F2),
                          labelColor: Colors.white,
                          label: "Cancel",
                          onTap: () {
                            context
                                .read<AddEmployeeData>()
                                .setEmployeeProfession(
                                    selectedValue: "object ${Random.secure()}");
                          },
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      );

  @override
  void initState() {
    super.initState();
  }

  void _modalBottomSheetMenu() {
    final items = [
      'Product Designer',
      'Flutter Developer',
      'QA Tester',
      'Product Owner',
    ];

    showModalBottomSheet(
      context: context,
      builder: (builder) => Container(
          height: 200.0,
          color: Colors.transparent, //could change this to Color(0xFF737373),
          //so you don't have to change MaterialApp canvasColor
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0))),
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  ///TODO
                  context
                      .read<AddEmployeeData>()
                      .setEmployeeProfession(selectedValue: items[index]);
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50.0,
                  padding: const EdgeInsets.all(16.0),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide()),
                  ),
                  child: Center(
                    child: AppText(
                      label: items[index],
                      softWrap: true,
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }

  void showFromDateDialog() => showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            surfaceTintColor: Colors.white,
            //backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 16,
            child: const CustomCalender(),
          );
        },
      );
}
/*
AppTextField(
textInputFormatter: FilteringTextInputFormatter.allow(
RegExp('[a-zA-Z]'),
),
keyboardType: TextInputType.name,
textAlign: TextAlign.left,
decoration: InputDecoration(
prefix: Image.asset("assets/images/person.png"),
hintText: "Enter Employee Name",
hintStyle: TextStyle(
color: Colors.grey.shade400,
),
),
),*/
