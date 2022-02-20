import 'package:dart_mongo_lite/dart_mongo_lite.dart';
import 'package:server/model/user.dart';

class UserRepo {
  late Collection db;

  UserRepo(db){
    this.db = db["users"];
  }

  User? getUserByID(String id){
      return db.findOneAs((v) => User.fromJson(v), filter: {'id':id});
  }

  

}
