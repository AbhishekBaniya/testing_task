import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddEmployeeData with ChangeNotifier, DiagnosticableTreeMixin {
  final _employeeNameController = TextEditingController();
  get employeeNameController => _employeeNameController;

  String? _employeeName;
  String? _profession = "Select Role";
  String? _toDate;
  String? _fromDate;

  String? get eName => _employeeName;
  String? get eProfession => _profession;
  String? get toDate => _toDate;
  String? get fromDate => _fromDate;

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

  void setToDate(dynamic eName) {
    _toDate = toDate;
    print(
        "Testing setToDate ========>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> $_toDate");
    notifyListeners();
  }

  void setFromDate(dynamic eName) {
    _fromDate = fromDate;
    print(
        "Testing setFromDate ========>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> $_fromDate");
    notifyListeners();
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
