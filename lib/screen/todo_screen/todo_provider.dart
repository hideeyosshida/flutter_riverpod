import 'package:flutter_responsive/data/model/TodoModel.dart';
import 'package:riverpod/riverpod.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class TodoList extends Notifier<List<TodoModel>> {
  @override
  List<TodoModel> build() {
    return [
      TodoModel(
          id: 'todo-0', description: 'Buy cookies', isCompleted: false),
      TodoModel(
          id: 'todo-1', description: 'Star Riverpod', isCompleted: false),
      TodoModel(
          id: 'todo-2', description: 'Have a walk', isCompleted: false),
    ];
  }

  void add(String description) {
    state = [
      ...state,
      TodoModel(
        id: _uuid.v4(),
        description: description,
        isCompleted: false,
      )
    ];
  }

  void remove(TodoModel todo){
    state = state.where((element) => element.id != todo.id).toList();
  }

  void edit(String id, String description){
    state = [
      for (final todo in state)
        if (todo.id == id)
          TodoModel(
            id: todo.id,
            isCompleted: todo.isCompleted,
            description: description,
          )
        else
          todo,
      ];
  }

  void toggle(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          TodoModel(
            id: todo.id,
            isCompleted: !todo.isCompleted,
            description: todo.description,
          )
        else
          todo,
    ];
  }
}
