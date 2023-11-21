import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive/data/model/TodoModel.dart';
import 'package:flutter_responsive/screen/todo_screen/todo_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoItem extends ConsumerWidget {
  const TodoItem({super.key, required this.todoModel});
  final TodoModel todoModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Material(
      color: Colors.white,
      elevation: 6,
      child: ListTile(
        leading: Checkbox(
          value: todoModel.isCompleted,
          onChanged: (value){
            ref.read(todoListProvider.notifier).toggle(todoModel.id);
            if(value == true){
              ref.read(todoListProvider.notifier).remove(todoModel);
            }
          },
        ),
        title: Text(todoModel.description),
      ),
    );
  }
}