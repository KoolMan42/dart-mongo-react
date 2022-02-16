import 'package:uuid/uuid.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo {
  static const Uuid _uuid = Uuid();
  String id;

  String name;
  String isDone;

  Todo(this.name, [String? id, this.isDone = 'false']) : id = id ?? _uuid.v4();

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
