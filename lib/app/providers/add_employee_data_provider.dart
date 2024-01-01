import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/app/model/main_data_model.dart';
import 'package:hello_world/app/views/home/employee_list_page/employee_list_page.dart';

import '../database/db_provider.dart';
import '../model/employee_data_model.dart';

class AddEmployeeData with ChangeNotifier, DiagnosticableTreeMixin {
  final _employeeNameController = TextEditingController();
  get employeeNameController => _employeeNameController;
  final dbHelper = DatabaseHelper.instance;
  List<MainDataModel>? _mainData;

  String? _employeeName;
  String? _profession = "Select Role";
  String? _toDate = "Select Date";
  String? _fromDate = "Select Date";

  List<EmployeesModel>? _getData;

  String? get eName => _employeeName;
  String? get eProfession => _profession;
  String? get toDate => _toDate;
  String? get fromDate => _fromDate;

  List<EmployeesModel>? get getData => _getData;
  List<MainDataModel>? get getMainData => _mainData;

  void setEmployeeName(String eName) {
    _employeeName = eName;
    print(
        "Testing setEmployeeName ========>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> $_employeeName");
    notifyListeners();
  }

  void setEmployeeProfession({required dynamic selectedValue}) {
    _profession = selectedValue;
    print(
        "Testing setEmployeeProfession ========>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> $_profession");
    notifyListeners();
  }

  void setToDate({required dynamic toDate}) {
    _toDate = toDate.replaceAll('00:00:00.000', '');
    //print("Testing setToDate ========>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> $_toDate");
    notifyListeners();
  }

  void setFromDate({required dynamic fromDate}) {
    _fromDate = fromDate.replaceAll('00:00:00.000', '');
    // print("Testing setFromDate ========>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> $_fromDate");
    notifyListeners();
  }

  void addData({required BuildContext context}) async {
    var newNote = EmployeesModel(
      eName: "$eName",
      eRoll: "$eProfession",
      fromDate: "$toDate",
      toDate: "$fromDate",
      week: "null",
      createdAt: DateTime.now().toString(),
      isDone: true.toString(),
    );
    await dbHelper.insert(newNote);
    var count = await dbHelper.getCount();

    print("Testing $eName");

    final snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Data Inserted',
        message: 'Data Successfully Inserted Into DataBase',

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: ContentType.success,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);

    //newNote.id = id;
    _getData?.add(newNote);
    _mainData?.add(
        MainDataModel(title: "Current Employees", data: getData!.toList()));

    print(
        "Testing chal rahi h ================> ${getMainData?.map((e) => e.title)}");

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const EmployeeListPage(title: "Employee List")));
    loadData();
    print(getMainData?.length);
  }

  void loadData() async {
    List<EmployeesModel> notes = await dbHelper.getAllData();
    _getData = notes;
    print("data aa raha hai database se $_getData");
  }

  void loadOldData() async {
    /*List<Map> result = await dbHelper
        .rawQuery('SELECT * FROM my_table WHERE name=?', ['Mary']);*/

    List<EmployeesModel> notes = await dbHelper.getQueryData(
        query: 'SELECT * FROM my_table WHERE toDate=?');
    _getData = notes;
    print("data aa raha hai database se $_getData");
  }

  void deleteData(int index) async {
    await dbHelper.delete(_getData?.removeAt(index).id ?? 0);

    _getData?.removeAt(index);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('EmployeeName', _employeeName));
    properties.add(StringProperty('EmployeeProfession', _profession));
    properties.add(StringProperty('ToDate', _toDate));
    properties.add(StringProperty('FromDate', _fromDate));
  }
}
