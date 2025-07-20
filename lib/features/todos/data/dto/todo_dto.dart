import 'package:hive/hive.dart';

part 'todo_dto.g.dart';

@HiveType(typeId: 0)
class TodoDto extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final bool isCompleted;

  @HiveField(3)
  final String description;

  @HiveField(4)
  final String user;

  @HiveField(5)
  final List<String> labels;

  TodoDto({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.description,
    required this.user,
    required this.labels,
  });
}
