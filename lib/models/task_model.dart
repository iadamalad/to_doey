class Task {
  int id;
  String title;
  DateTime date;
  String priority;
  int status; //0 - task incomplete 1 - task complete

  Task(
      {this.title,
      this.date,
      this.priority,
      this.status}); //unnamed constructor
  Task.withId(
      {this.id,
      this.title,
      this.date,
      this.priority,
      this.status}); //named constructor

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    map['date'] = date.toIso8601String(); //can't save Type DateTime to sql
    map['priority'] = priority;
    map['status'] = status;
    return map;
  }

  //factory functions lets us return an object from a constructor
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task.withId(
        id: map['id'],
        title: map['title'],
        date: DateTime.parse(map['date']),
        priority: map['priority'],
        status: map['status']);
  }
}
