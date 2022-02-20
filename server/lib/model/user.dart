import 'package:json_annotation/json_annotation.dart';
import 'package:server/model/todo.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String name;
  String id;
  String hashedPassword;

  User(this.name, this.id, this.hashedPassword);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
