import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_world/app/controller/home_logic.dart';

import '../../widgets/app_text_widget.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final controller = Get.put(HomeLogic());

  @override
  Widget build(BuildContext context) => Container(
        height: Get.height,
        width: Get.width,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: AppText(
                      label: "Sort and Filters",
                      softWrap: true,
                      textStyle: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.close,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Divider(height: 1.0, color: Colors.grey),
            Row(
              children: [
                Expanded(
                  child: Column(children: [
                    Container(
                      height: 80.0,
                      width: Get.width,
                      color: Colors.grey.shade500,
                      alignment: Alignment.center,
                      child: const AppText(
                        label: "Sort By",
                        softWrap: true,
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ]),
                ),
                Expanded(
                  child: Column(children: [
                    Container(
                      height: 80.0,
                      width: Get.width,
                      color: Colors.white,
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: controller.filterSearchController.value,
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.red),
                          prefixIcon: Icon(Icons.search),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: Colors.grey.shade800), //<-- SEE HERE
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Column(children: [
                    Obx(() {
                      return Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.setIndex(1);
                            },
                            child: Container(
                              height: 80.0,
                              width: Get.width,
                              color: controller.filterIndex == 1
                                  ? Colors.white
                                  : Colors.grey.shade500,
                              alignment: Alignment.center,
                              child: const AppText(
                                label: "Location",
                                softWrap: true,
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: controller.filterIndex == 1 ? true : false,
                            child: Container(
                              height: 80.0,
                              width: 4.0,
                              decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0))),
                            ),
                          ),
                        ],
                      );
                    }),
                  ]),
                ),
                Expanded(
                  child: Column(children: [
                    ///TODO
                    ///
                    SizedBox(
                      height: 100.0,
                      child: ListView.builder(
                          itemCount: controller.data.value.length,
                          itemBuilder: (context, i) {
                            return Obx(() {
                              return ListTile(
                                  title: Text(controller.data.value[i]),
                                  leading: Checkbox(
                                    value: controller.userChecked.value
                                        .contains(controller.data.value[i]),
                                    onChanged: (val) {
                                      controller.onSelected(
                                          val!, controller.data.value[i]);
                                    },
                                  )
                                  //you can use checkboxlistTile too
                                  );
                            });
                          }),
                    )
                  ]),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Column(children: [
                    Obx(() {
                      return Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.setIndex(2);
                            },
                            child: Container(
                              height: 80.0,
                              width: Get.width,
                              color: controller.filterIndex == 2
                                  ? Colors.white
                                  : Colors.grey.shade500,
                              alignment: Alignment.center,
                              child: const AppText(
                                label: "Training Name",
                                softWrap: true,
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: controller.filterIndex == 2 ? true : false,
                            child: Container(
                              height: 80.0,
                              width: 4.0,
                              decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0))),
                            ),
                          ),
                        ],
                      );
                    }),
                  ]),
                ),
                Expanded(
                  child: Column(children: [
                    ///TODO
                    ///
                    SizedBox(
                      height: 100.0,
                      child: ListView.builder(
                          itemCount: controller.data.value.length,
                          itemBuilder: (context, i) {
                            return Obx(() {
                              return ListTile(
                                  title: Text(controller.data.value[i]),
                                  leading: Checkbox(
                                    value: controller.userChecked.value
                                        .contains(controller.data.value[i]),
                                    onChanged: (val) {
                                      controller.onSelected(
                                          val!, controller.data.value[i]);
                                    },
                                  )
                                  //you can use checkboxlistTile too
                                  );
                            });
                          }),
                    )
                  ]),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Column(children: [
                    Obx(() {
                      return Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.setIndex(3);
                            },
                            child: Container(
                              height: 80.0,
                              width: Get.width,
                              color: controller.filterIndex == 3
                                  ? Colors.white
                                  : Colors.grey.shade500,
                              alignment: Alignment.center,
                              child: const AppText(
                                label: "Trainer",
                                softWrap: true,
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: controller.filterIndex == 3 ? true : false,
                            child: Container(
                              height: 80.0,
                              width: 4.0,
                              decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0))),
                            ),
                          ),
                        ],
                      );
                    }),
                  ]),
                ),
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ///TODO
                        ///
                        SizedBox(
                          height: 100.0,
                          child: ListView.builder(
                              itemCount: controller.data.value.length,
                              itemBuilder: (context, i) {
                                return Obx(() {
                                  return ListTile(
                                      title: Text(controller.data.value[i]),
                                      leading: Checkbox(
                                        value: controller.userChecked.value
                                            .contains(controller.data.value[i]),
                                        onChanged: (val) {
                                          controller.onSelected(
                                              val!, controller.data[i]);
                                        },
                                      )
                                      //you can use checkboxlistTile too
                                      );
                                });
                              }),
                        )
                      ]),
                )
              ],
            ),
          ],
        ),
      );
}
