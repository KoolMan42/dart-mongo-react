import 'dart:convert';

import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:server/model/todo.dart';
import 'package:test/test.dart';
import 'package:test_process/test_process.dart';

void main() {
  final port = '8080';
  final host = 'http://localhost:$port';

  // setUp(() async {
  //   await TestProcess.start(
  //     'dart',
  //     ['run', 'bin/server.dart'],
  //     environment: {'PORT': port},
  //   );
  // });

  test('Root', () async {
    final response = await get(Uri.parse(host + '/'));
    expect(response.statusCode, 200);
    expect(response.body, 'Hello World');
  });

  test('Post to server', () async {
    final JsonEncoder encoder = JsonEncoder();
    Map<String, dynamic> todo = Todo('Testing!').toJson();

    // todo['isDone'] = (todo['isDone'] ? 'True' : 'False');

    final response = await post(Uri.parse(host + '/todos'), body: encoder.convert(todo));
    expect(response.statusCode, 200);
    expect(response.body, 'Accepted');
  });
  test('404', () async {
    final response = await get(Uri.parse(host + '/foobar'));
    expect(response.statusCode, 404);
  });
}
