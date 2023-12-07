import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:hello_world/app/presenter/pages/filter/filter.dart';
import 'package:hello_world/app/presenter/widgets/app_card_widget.dart';
import 'package:hello_world/app/presenter/widgets/app_parent_widget.dart';
import 'package:hello_world/app/presenter/widgets/app_text_widget.dart';

import '../../../controller/home_logic.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int _counter = 0;

  //final logic = Get.find<HomeLogic>();
  final logic = Get.put(HomeLogic());

  @override
  Widget build(BuildContext context) => AppParentWidget(
        safeAreaTop: true,
        bgColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Container(
            decoration: const BoxDecoration(color: Colors.red),
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: AppText(
                            label: widget.title,
                            softWrap: false,
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                            ),
                          ),
                        ),
                      ),
                      const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.menu,
                            size: 24.0,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bodyWidget: Container(
          height: Get.height,
          width: Get.width,
          //padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Stack(children: [
                Container(
                  color: Colors.red,
                  height: 250.0,
                  width: Get.width,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      label: "Highlights",
                      softWrap: false,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 100.0,
                  child: Container(
                    color: Colors.white,
                    height: 150.0,
                    width: Get.width,
                  ),
                ),
                Positioned(
                  top: 25.0,
                  child: getCarousel(),
                ),
              ]),
              getFilterButton(),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: getListVie(),
              ),
            ],
          ),
        ),
      );

  Widget getCarousel() => Container(
        color: Colors.transparent,
        width: Get.width,
        height: 160.0,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CarouselSlider(
          items: [
            //1st Image of Slider
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "data:image/jpeg;base64,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"),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      label: "Safe Scrum Master",
                      softWrap: false,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      label: "West Des, Moines, IA - 30 OCT . 31 OCT",
                      softWrap: false,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: AppText(
                              label: "Safe Scrum MAster",
                              softWrap: false,
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: AppText(
                            label: "West Des, Moines, IA - 30 OCT . 31 OCT",
                            softWrap: false,
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //2nd Image of Slider
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                image: const DecorationImage(
                  image: NetworkImage(
                      "data:image/jpeg;base64,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"),
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      label: "Safe Scrum Master",
                      softWrap: false,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      label: "West Des, Moines, IA - 30 OCT . 31 OCT",
                      softWrap: false,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: AppText(
                              label: "Safe Scrum MAster",
                              softWrap: false,
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: AppText(
                            label: "West Des, Moines, IA - 30 OCT . 31 OCT",
                            softWrap: false,
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //3rd Image of Slider
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                image: const DecorationImage(
                  image: NetworkImage(
                      "data:image/jpeg;base64,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"),
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      label: "Safe Scrum Master",
                      softWrap: false,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      label: "West Des, Moines, IA - 30 OCT . 31 OCT",
                      softWrap: false,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: AppText(
                              label: "Safe Scrum MAster",
                              softWrap: false,
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: AppText(
                            label: "West Des, Moines, IA - 30 OCT . 31 OCT",
                            softWrap: false,
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //4th Image of Slider
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                image: const DecorationImage(
                  image: NetworkImage(
                      "data:image/jpeg;base64,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"),
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      label: "Safe Scrum Master",
                      softWrap: false,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      label: "West Des, Moines, IA - 30 OCT . 31 OCT",
                      softWrap: false,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: AppText(
                              label: "Safe Scrum MAster",
                              softWrap: false,
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: AppText(
                            label: "West Des, Moines, IA - 30 OCT . 31 OCT",
                            softWrap: false,
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //5th Image of Slider
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                image: const DecorationImage(
                  image: NetworkImage(
                      "data:image/jpeg;base64,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"),
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      label: "Safe Scrum Master",
                      softWrap: false,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      label: "West Des, Moines, IA - 30 OCT . 31 OCT",
                      softWrap: false,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: AppText(
                              label: "Safe Scrum MAster",
                              softWrap: false,
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: AppText(
                            label: "West Des, Moines, IA - 30 OCT . 31 OCT",
                            softWrap: false,
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],

          //Slider Container properties
          options: CarouselOptions(
            height: 180.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 600),
            viewportFraction: 0.8,
          ),
        ),
      );

  Widget getFilterButton() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {
              ///TODO
              showModalBottomSheet(
                context: context,
                builder: (context) => FilterPage(),
              );
            },
            child: Container(
              width: 125.0,
              height: 46.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                  color: Colors.grey.shade500,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.sort, color: Colors.grey.shade500),
                  AppText(
                    label: "Filters",
                    softWrap: true,
                    textStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 24.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget getListVie() => Container(
        height: Get.height,
        width: Get.width,
        color: Colors.grey.shade100,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.center,
        child: AnimationLimiter(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: InkWell(
                      onTap: () {
                        ///TODO
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                            alignment: Alignment.center,
                            height: Get.height,
                            width: Get.width,
                            child: const Column(
                              children: [
                                SizedBox(
                                  height: 20.0,
                                ),
                                AppText(
                                  label: "Details For Current Page",
                                  softWrap: false,
                                  textStyle: TextStyle(
                                    color: Colors.red,
                                    fontSize: 28.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: AppText(
                                    label: "Date : Oct 11-13, 2023",
                                    softWrap: false,
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: AppText(
                                    label: "Timing : 08:30 am - 12:30 pm",
                                    softWrap: false,
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: AppText(
                                    label:
                                        "Location : Convention Hall, Greater Des Moines",
                                    softWrap: false,
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: AppText(
                                    label:
                                        "Name : Convention Hall, Greater Des Moines",
                                    softWrap: false,
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: AppCardWidget(
                        heightOfCard: 160.0,
                        widget: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Expanded(
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: AppText(
                                              label: "Oct 11-13, 2023",
                                              softWrap: false,
                                              textStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: AppText(
                                              label: "08:30 am - 12:30 pm",
                                              softWrap: false,
                                              textStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: AppText(
                                              label:
                                                  "Convention Hall, Greater Des Moines",
                                              softWrap: true,
                                              textStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12.0,
                                                  overflow: TextOverflow.clip),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const DottedLine(
                                      direction: Axis.vertical,
                                      alignment: WrapAlignment.center,
                                      lineLength: double.infinity,
                                      lineThickness: 1.0,
                                      dashLength: 3.0,
                                      dashColor: Colors.black,
                                      dashRadius: 0.0,
                                      dashGapLength: 4.0,
                                      dashGapColor: Colors.transparent,
                                      dashGapRadius: 1.0,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          const Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.0),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: AppText(
                                                  label: "Filling Fast",
                                                  softWrap: true,
                                                  textStyle: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 12.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.0),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: AppText(
                                                  label:
                                                      "Safe Scrum Master(4.6)",
                                                  softWrap: true,
                                                  textStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Row(
                                              children: [
                                                Stack(
                                                  children: [
                                                    Container(
                                                      height: 50.0,
                                                      width: 50.0,
                                                      margin:
                                                          const EdgeInsets.all(
                                                              6.0),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50.0),
                                                        image:
                                                            const DecorationImage(
                                                          image: NetworkImage(
                                                              "data:image/jpeg;base64,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"),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      top: 35.0,
                                                      right: 5,
                                                      child: Container(
                                                        height: 20.0,
                                                        width: 20.0,
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .grey.shade50,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50.0)),
                                                        child: const Icon(
                                                          Icons.cabin,
                                                          color:
                                                              Colors.redAccent,
                                                          size: 16.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: AppText(
                                                          label:
                                                              "Safe Scrum Master(4.6)",
                                                          softWrap: true,
                                                          textStyle: TextStyle(
                                                            color: Colors.black,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 10.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: AppText(
                                                          textAlign:
                                                              TextAlign.left,
                                                          label: "Safe Scrum ",
                                                          softWrap: true,
                                                          textStyle: TextStyle(
                                                            color: Colors.grey,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 8.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              height: 46.0,
                                              width: 115.0,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              alignment: Alignment.center,
                                              child: const AppText(
                                                label: "Enroll Now",
                                                softWrap: true,
                                                textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14.0,
                                                    overflow:
                                                        TextOverflow.clip),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
}

/*class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<HomeLogic>();
    final state = Get.find<HomeLogic>().state;

    return Container();
  }
}*/
