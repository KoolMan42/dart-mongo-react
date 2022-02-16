import 'package:server/model/todo.dart';
import 'package:shelf_plus/shelf_plus.dart';

extension TodoAccessor on RequestBodyAccessor {
  Future<Todo> get asTodo async => Todo.fromJson(await asJson);
}