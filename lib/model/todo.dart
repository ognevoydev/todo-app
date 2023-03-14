class ToDo {
  int? id;
  String? text;
  bool isDone;

  ToDo({required this.id, required this.text, this.isDone = false});

  static List<ToDo> todoList() {
    return [
      ToDo(id: 1, text: "ToDo 1", isDone: true),
      ToDo(id: 2, text: "ToDo 2", isDone: true),
      ToDo(id: 3, text: "ToDo 3"),
      ToDo(id: 4, text: "ToDo 4"),
      ToDo(id: 5, text: "ToDo 5"),
      ToDo(id: 6, text: "ToDo 6", isDone: true),
      ToDo(id: 7, text: "ToDo 7"),
      ToDo(id: 8, text: "ToDo 8", isDone: true),
    ];
  }
}
