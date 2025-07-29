import 'package:clear_tasks/core/domain/model/splitted_list_to_string.dart';
import 'package:clear_tasks/features/todos/domain/model/todo.dart';
import 'package:flutter/material.dart';

class TodoListTile extends StatelessWidget {
  const TodoListTile({
    super.key,
    required this.todo,
    required this.onDelete,
    required this.onToggleComplete,
    this.onTap,
  });

  final Todo todo;
  final VoidCallback onDelete;
  final ValueChanged<bool?> onToggleComplete;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        onTap: onTap,
        leading: Checkbox.adaptive(
          value: todo.isCompleted,
          onChanged: onToggleComplete,
        ),
        title: Text(
          todo.user,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4.0),
            Text(
              todo.title,
              style: TextStyle(
                fontSize: 18,
                decoration:
                    todo.isCompleted ? TextDecoration.lineThrough : null,
              ),
            ),
            if (todo.description.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  todo.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            if (todo.labels.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  todo.labels.joinToString(),
                  style: const TextStyle(fontWeight: FontWeight.w300),
                ),
              ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.grey),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
