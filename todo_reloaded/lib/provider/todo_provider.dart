import 'package:flutter/cupertino.dart';
import 'package:todo_reloaded/model/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(id: '1', todoText: 'I want to live bro', isDone: true),
    Todo(id: '2', todoText: 'flappa is a grwat ge'),
    Todo(id: '3', todoText: 'flappa is arat pa glsoe'),
    Todo(id: '4', todoText: 'grat for the sup man  grwat ge'),
    Todo(id: '5', todoText: 'me am a i dont ge with the vibes ')
  ];

  List<Todo> get todos => _todos;
}
