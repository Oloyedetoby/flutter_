import 'package:flutter/material.dart';
import 'package:fluttr_todo_app/contantt/colorss.dart';
import 'package:fluttr_todo_app/model/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  // ignore: prefer_typing_uninitialized_variables
  final Function ontoDoChange;
  final Function onDeleteitem;

  const TodoItem(
      {Key? key,
      required this.todo,
      required this.ontoDoChange,
      required this.onDeleteitem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        onTap: () {
          ontoDoChange(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28.0),
        ),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Text(
          todo.todoText,
          style: TextStyle(
              fontSize: 15,
              color: tdBlack,
              decoration: todo.isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            onPressed: () {
              onDeleteitem(todo.id);
            },
            icon: const Icon(Icons.delete),
            iconSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
