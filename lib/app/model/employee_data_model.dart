class Employee {
  final int? id;
  final String eName;
  final String eRoll;
  final String? fromDate, toDate, week;
  final DateTime createdAt;
  final bool isDone;

  Employee(
      {this.id,
      required this.eName,
      required this.eRoll,
      this.fromDate,
      this.toDate,
      this.week,
      required this.createdAt,
      required this.isDone});

  Employee.fromJsonMap(
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
