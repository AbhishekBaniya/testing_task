import 'package:hello_world/app/model/employee_data_model.dart';

class MainDataModel {
  String? title;
  List<EmployeesModel> data;

  MainDataModel({this.title, required this.data});

  Map<String, dynamic> toMap() => <String, dynamic>{
        'title': title,
        'data': data,
      };

  factory MainDataModel.fromMap(Map<String, dynamic> map) => MainDataModel(
        title: map['title'],
        data: map['data'],
      );
}
