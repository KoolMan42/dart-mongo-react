import 'dart:convert';

import 'package:server/extentions/todo_accessor.dart';
import 'package:server/model/todo.dart';
import 'package:server/repo/todo_repo.dart';
import 'package:shelf_plus/shelf_plus.dart';

void main() => shelfRun(init);

Handler init() {
  var app = Router().plus;
  TodoRepo todoRepo = TodoRepo();
  final JsonEncoder encoder = JsonEncoder();
  app.get('/', () => "Hello World");

  app.get('/todos', () async {
    List<Map<String, dynamic>> data =
        todoRepo.getAllTodos().map((e) => e.toJson()).toList();
    return Response.ok(encoder.convert(data),
        headers: {'content-type': 'application/json'});
  });

  app.get('/todos/<id>', (Request request, String id) {
    Map<String, dynamic>? todo = todoRepo.getSingleTodo(id)?.toJson();

    if (todo != null) {
      return Response.ok(encoder.convert(todo),
          headers: {'content-type': 'application/json'});
    }

    return Response(404);
  });
  app.put('/todos', (Request request) async {
    Todo todo = await request.body.asTodo;

    if (todoRepo.updateTodo(todo)) {
      return Response.ok("Inserted");
    } else {
      return Response.notModified();
    }
  });
  app.post('/todos', (Request request) async {
    Todo todoToAdd = await request.body.asTodo;
    todoRepo.insertTodo(todoToAdd);
    return Response.ok('Accepted');
  });

  return app;
}
