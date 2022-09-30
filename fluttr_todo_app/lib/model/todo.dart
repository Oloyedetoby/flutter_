class Todo {
  String id;
  String todoText;
  bool isDone;

  Todo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<Todo> todolist() {
    return [
      Todo(id: '01', todoText: "morning exercise", isDone: true),
      Todo(id: '02', todoText: "am going to the gim", isDone: false),
      Todo(id: '03', todoText: "try to eat breakfast if i wish", isDone: true),
      Todo(id: '04', todoText: "jumping from 7 storis building", isDone: false),
      Todo(id: '05', todoText: "morning exercise", isDone: false),
    ];
  }
}
