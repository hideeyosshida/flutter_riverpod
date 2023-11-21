import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive/data/model/TodoModel.dart';
import 'package:flutter_responsive/screen/todo_screen/todo_item.dart';
import 'package:flutter_responsive/screen/todo_screen/todo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final todoListProvider = NotifierProvider<TodoList, List<TodoModel>>(TodoList.new);
class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListProvider);
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        children: [
          const Title(),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: 'What needs to be done?',
            ),
            onSubmitted: (value) {
                ref.read(todoListProvider.notifier).add(value);
                controller.clear();
            },
          ),
          const SizedBox(height: 42),
          if (todos.isNotEmpty) const Divider(height: 0),
          for (var i = 0; i < todos.length; i++) ...[
            if (i > 0) const Divider(height: 0),
            Dismissible(
              key: ValueKey(todos[i].id),
              onDismissed: (_) {
                ref.read(todoListProvider.notifier).remove(todos[i]);
              },
              child: TodoItem(todoModel: todos[i]),
            ),
          ],
        ],
      ),
    );
  }

}



class Title extends StatelessWidget {
  const Title({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'todos',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color.fromARGB(38, 5, 5, 232),
        fontSize: 100,
        fontWeight: FontWeight.w400,
        fontFamily: 'Helvetica Neue',
      ),
    );
  }
}