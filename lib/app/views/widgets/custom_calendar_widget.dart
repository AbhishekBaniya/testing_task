import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:provider/provider.dart';

import '../../providers/add_employee_data_provider.dart';
import 'app_text_widget.dart';
import 'custom_button_widget.dart';

class CustomCalender extends StatefulWidget {
  const CustomCalender({super.key, required this.isSelectedOldDate});
  final bool isSelectedOldDate;

  @override
  State<CustomCalender> createState() => _CustomCalenderState();
}

class _CustomCalenderState extends State<CustomCalender> {
  var _currentDate = DateTime(2019, 12, 31);
  var _currentDate2 = DateTime(2019, 12, 31);
  final _currentMonth = DateFormat('dd MMM yyyy').format(DateTime.now());
  //var _currentMonth = DateFormat.yMMM().format(DateTime(1000, 1, 1));
  //DateTime _targetDateTime = DateTime(2019, 2, 3);
  //var _targetDateTime = DateTime.now();
  final _targetDateTime = DateTime(2037, 12, 31);

  var selectedIndex = -1, selectedIndex2 = -1;

  @override
  Widget build(BuildContext context) => widget.isSelectedOldDate
      ? Container(
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
                      labelColor:
                          selectedIndex == 0 ? Colors.white : Colors.blue,
                      label: "Today",
                      onTap: () {
                        setState(() {
                          selectedIndex = 0;
                          if (selectedIndex2 == 0 || selectedIndex2 == 1) {
                            selectedIndex2 = -1;
                          }

                          ///TODO
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
                      labelColor:
                          selectedIndex == 1 ? Colors.white : Colors.blue,
                      label: "Next Monday",
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                          if (selectedIndex2 == 0 || selectedIndex2 == 1) {
                            selectedIndex2 = -1;
                          }

                          ///TODO
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

                          ///TODO
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

                          ///TODO
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
                      /* Row(
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
                    ),*/
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
                                    closeDialog();
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: AppButton(
                                  bgColor: const Color(0xff1DA1F2),
                                  labelColor: Colors.white,
                                  label: "Save",
                                  onTap: () {
                                    ///TODO
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
        )
      : Container(
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
                      labelColor:
                          selectedIndex == 0 ? Colors.white : Colors.blue,
                      label: "No Date",
                      onTap: () {
                        setState(() {
                          selectedIndex = 0;
                          if (selectedIndex2 == 0 || selectedIndex2 == 1) {
                            selectedIndex2 = -1;
                          }

                          ///TODO
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
                      labelColor:
                          selectedIndex == 1 ? Colors.white : Colors.blue,
                      label: "Today",
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                          if (selectedIndex2 == 0 || selectedIndex2 == 1) {
                            selectedIndex2 = -1;
                          }

                          ///TODO
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
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
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Icon(
                                      Icons.calendar_today,
                                      color: Colors.blue,
                                      size: 24.0,
                                    ),
                                    const SizedBox(
                                      width: 16.0,
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
                                  ],
                                ),
                              ),
                              //const Spacer(),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: AppButton(
                                    height: 40.0,
                                    bgColor: const Color(0xffEDF8FF),
                                    labelColor: const Color(0xff1DA1F2),
                                    label: "Cancel",
                                    onTap: () {
                                      closeDialog();
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: AppButton(
                                    height: 40.0,
                                    bgColor: const Color(0xff1DA1F2),
                                    labelColor: Colors.white,
                                    label: "Save",
                                    onTap: () {
                                      ///TODO
                                      /*context
                                        .read<AddEmployeeData>()
                                        .setEmployeeProfession(
                                        selectedValue: "object ${Random.secure()}");*/
                                    },
                                  ),
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
              getDates(date);
              var data = date.add(const Duration(days: 7 - 1));

              print("Testing $data");
            },

            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            scrollDirection: Axis.vertical,
            isScrollable: false,
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
            selectedDayTextStyle: const TextStyle(
              color: Colors.purple,
            ),
            daysHaveCircularBorder: null,
            leftButtonIcon: null,

            /*onCalendarChanged: (DateTime date) {
              setState(() {
                _targetDateTime = date;
                _currentMonth = DateFormat.yMMM().format(_targetDateTime);
              });
            },*/

            /*onDayLongPressed: (DateTime date) {
              print('long pressed date $date');
            },*/
          ),
        ],
      );

  void getDates(dynamic date) {
    widget.isSelectedOldDate ? _currentDate2 = date : _currentDate = date;

    widget.isSelectedOldDate
        ? context
            .read<AddEmployeeData>()
            .setFromDate(fromDate: _currentDate2.toString())
        : context
            .read<AddEmployeeData>()
            .setToDate(toDate: _currentDate.toString());
    print(_currentDate2);
    closeDialog();
    /*for (var event in events) {
                print(event.title);
              }*/
  }

  void closeDialog() => Navigator.pop(context);
}
