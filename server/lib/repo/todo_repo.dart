import 'package:dart_mongo_lite/dart_mongo_lite.dart';
import 'package:server/model/todo.dart';

class TodoRepo {
  TodoRepo();

  var db = Database('./db.json');
  List<Todo> getAllTodos() {
    var todoCollection = db["todos"];

    return todoCollection.findAs((v) => Todo.fromJson(v)).toList();
  }

  Todo? getSingleTodo(String id) {
    var todoCollection = db["todos"];

    return todoCollection
        .findOneAs((v) => Todo.fromJson(v), filter: {"id": id});
  }

  bool updateTodo(Todo todo) {
    var todoCollection = db["todos"];
    return todoCollection.modify({'id': todo.id}, todo.toJson());
  }

  void insertTodo(Todo todo) {
    var todoCollection = db["todos"];
    todoCollection.insert(todo.toJson());
  }
}
