import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart' show DateFormat;

import 'app_text_widget.dart';
import 'custom_button_widget.dart';

class CustomCalender extends StatefulWidget {
  const CustomCalender({super.key});

  @override
  State<CustomCalender> createState() => _CustomCalenderState();
}

class _CustomCalenderState extends State<CustomCalender> {
  var _currentDate = DateTime(2019, 2, 3);
  var _currentDate2 = DateTime(2019);
  var _currentMonth = DateFormat.yMMM().format(DateTime(1000, 1, 1));
  //DateTime _targetDateTime = DateTime(2019, 2, 3);
  //var _targetDateTime = DateTime.now();
  var _targetDateTime = DateTime(2022, 12, 31);

  var selectedIndex = -1, selectedIndex2 = -1;

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 24.0, bottom: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    height: 46.0,
                    bgColor: selectedIndex == 0
                        ? const Color(0xff1DA1F2)
                        : const Color(0xffEDF8FF),
                    labelColor: selectedIndex == 0 ? Colors.white : Colors.blue,
                    label: "Today",
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                        if (selectedIndex2 == 0 || selectedIndex2 == 1) {
                          selectedIndex2 = -1;
                        }
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: AppButton(
                    height: 46.0,
                    bgColor: selectedIndex == 1
                        ? const Color(0xff1DA1F2)
                        : const Color(0xffEDF8FF),
                    labelColor: selectedIndex == 1 ? Colors.white : Colors.blue,
                    label: "Next Monday",
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                        if (selectedIndex2 == 0 || selectedIndex2 == 1) {
                          selectedIndex2 = -1;
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    height: 46.0,
                    bgColor: selectedIndex2 == 0
                        ? const Color(0xff1DA1F2)
                        : const Color(0xffEDF8FF),
                    labelColor:
                        selectedIndex2 == 0 ? Colors.white : Colors.blue,
                    label: "Next Tuesday",
                    onTap: () {
                      setState(() {
                        selectedIndex2 = 0;
                        if (selectedIndex == 0 || selectedIndex == 1) {
                          selectedIndex = -1;
                        }
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: AppButton(
                    height: 46.0,
                    bgColor: selectedIndex2 == 1
                        ? const Color(0xff1DA1F2)
                        : const Color(0xffEDF8FF),
                    labelColor:
                        selectedIndex2 == 1 ? Colors.white : Colors.blue,
                    label: "After 1 week",
                    onTap: () {
                      setState(() {
                        selectedIndex2 = 1;
                        if (selectedIndex == 0 || selectedIndex == 1) {
                          selectedIndex = -1;
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24.0,
            ),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                setState(() {
                                  _targetDateTime = DateTime(
                                      _targetDateTime.year,
                                      _targetDateTime.month - 1);
                                  _currentMonth =
                                      DateFormat.yMMM().format(_targetDateTime);
                                });
                              });
                            },
                            child: Icon(
                              Icons.arrow_left,
                              size: 24.0,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ),
                        AppText(
                          label: _currentMonth,
                          softWrap: true,
                          textAlign: TextAlign.center,
                          textStyle: const TextStyle(
                            color: Color(0xff323238),
                            fontSize: 18.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _targetDateTime = DateTime(_targetDateTime.year,
                                    _targetDateTime.month + 1);
                                _currentMonth =
                                    DateFormat.yMMM().format(_targetDateTime);
                              });
                            },
                            child: Icon(
                              Icons.arrow_right,
                              size: 24.0,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: customCalendar(context)),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 80.0,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Divider(
                        height: 2.0,
                        thickness: 1.0,
                        color: Colors.grey.shade200),
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
                                  /*context
                                      .read<AddEmployeeData>()
                                      .setEmployeeProfession(
                                      selectedValue: "object ${Random.secure()}");*/
                                },
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget customCalendar(BuildContext context) => Stack(
        children: [
          Positioned(
            top: 10.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50.0,
              color: Colors.transparent,
            ),
          ),
          CalendarCarousel<Event>(
            onDayPressed: (date, events) {
              setState(() => _currentDate2 = date);
              for (var event in events) {
                print(event.title);
              }
            },

            weekendTextStyle: const TextStyle(
              color: Colors.deepPurpleAccent,
            ),
            thisMonthDayBorderColor: Colors.black,
            weekFormat: false,
            //      firstDayOfWeek: 4,
            //markedDatesMap: _markedDateMap,
            //height: 420.0,
            selectedDateTime: _currentDate2,
            targetDateTime: _targetDateTime,
            //customGridViewPhysics: NeverScrollableScrollPhysics(),

            todayButtonColor: Colors.blue,
            selectedDayTextStyle: TextStyle(
              color: Colors.purple,
            ),
            daysHaveCircularBorder: null,
            leftButtonIcon: null,

            onCalendarChanged: (DateTime date) {
              setState(() {
                _targetDateTime = date;
                _currentMonth = DateFormat.yMMM().format(_targetDateTime);
              });
            },

            onDayLongPressed: (DateTime date) {
              print('long pressed date $date');
            },
          ),
        ],
      );
}
