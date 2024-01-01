class EmployeesModel {
  final int? id;
  final dynamic eName;
  final dynamic eRoll;
  final dynamic fromDate, toDate, week;
  final dynamic? createdAt;
  final dynamic isDone;

  EmployeesModel(
      {this.id,
      required this.eName,
      required this.eRoll,
      required this.fromDate,
      required this.toDate,
      required this.week,
      this.createdAt,
      required this.isDone});

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'eName': eName,
        'eRoll': eRoll,
        'fromDate': fromDate,
        'toDate': toDate,
        'week': week,
        'isDone': isDone,
        //'createdAt': createdAt.millisecondsSinceEpoch.toString(),
        'createdAt': createdAt,
      };

  factory EmployeesModel.fromMap(Map<String, dynamic> map) => EmployeesModel(
        id: map['id'],
        eName: map['eName'],
        eRoll: map['eRoll'],
        fromDate: map['fromDate'],
        toDate: map['toDate'],
        week: map['week'],
        createdAt: map['createdAt'],
        isDone: map['isDone'],
      );

  EmployeesModel.fromJsonMap(
    Map<String, dynamic> map,
  )   : id = map['id'] as int,
        eName = map['eName'] as String,
        eRoll = map['eRoll'] as String,
        fromDate = map['fromDate'] as String,
        toDate = map['toDate'] as String,
        week = map['week'] as String,
        isDone = map['isDone'] == 1,
        createdAt =
            DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int);

  Map<String, dynamic> toJsonMap() => {
        'id': id,
        'eName': eName,
        'eRoll': eRoll,
        'fromDate': fromDate,
        'toDate': toDate,
        'week': week,
        'isDone': isDone ? 1 : 0,
        'createdAt': createdAt.millisecondsSinceEpoch,
      };
}
