import 'package:clear_tasks/features/todos/domain/model/todo.dart';
import 'package:flutter/material.dart';

class TodoListTile extends StatelessWidget {
  const TodoListTile({
    super.key,
    required this.todo,
    required this.onDelete,
    required this.onToggleComplete,
  });

  final Todo todo;
  final VoidCallback onDelete;
  final ValueChanged<bool?> onToggleComplete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: todo.isCompleted,
        onChanged: onToggleComplete,
      ),
      title: Text(
        todo.title,
        style: TextStyle(
          decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(todo.user),
          if (todo.description.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                'Description: ${todo.description}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          if (todo.labels.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text('Labels: ${todo.labels.join(', ')}'),
            ),
        ],
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: onDelete,
      ),
    );
  }
}
