import 'package:flutter/material.dart';
import 'package:todo_reloaded/widgets/silverappbar.dart';
import 'package:todo_reloaded/widgets/todo_widget.dart';
import 'package:todo_reloaded/model/todo_model.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
    // SilverAppBar(
    //   text: 'Todo',
    //   bodylistview: TodoItem(
    //     todo: Todo(id: 'id', todoText: 'todoText'),
    //     ontoDoChange: () {},
    //     onDeleteitem: () {},
    //   ),
    //   hintsearchtext: 'Todo',
    // );
  }
}
