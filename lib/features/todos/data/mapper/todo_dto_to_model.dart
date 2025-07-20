import 'package:clear_tasks/features/todos/data/dto/todo_dto.dart';
import 'package:clear_tasks/features/todos/domain/model/todo.dart';

extension TodoDtoMapper on TodoDto {
  Todo toModel() {
    return Todo(
      id: id,
      title: title,
      isCompleted: isCompleted,
      description: description,
      user: user,
      labels: labels,
    );
  }
}
