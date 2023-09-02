class ToDo {
  int? id;
  String? text;
  bool isDone;

  ToDo({required this.text, this.isDone = false});

  ToDo.withId({required this.id, required this.text, this.isDone = false});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {'text': text, 'isDone': isDone == true ? 1 : 0};
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  static ToDo fromMap(Map<String, dynamic> map) {
    return ToDo.withId(id: map['id'], text: map['text'], isDone: map['isDone'] == 1 ? true: false);
  }
}
