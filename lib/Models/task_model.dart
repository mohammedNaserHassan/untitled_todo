class Task_model {
  int id;
  String taskName;
  bool isComplete;

  Task_model({this.id, this.taskName, this.isComplete});

  factory Task_model.fromMap(Map<String, dynamic> map) {
    return Task_model(
        id: map['id'],
        taskName: map['taskName'],
        isComplete: map['isComplete'] == 1 ? true : false);
  }

  Map<String, dynamic> toMap() {
    return {'taskName': taskName, 'isComplete': isComplete ? 1 : 0};
  }
}
