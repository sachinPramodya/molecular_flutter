part 'user.g.dart';

@JsonSerializable()
class User {
  String username;
  String password;

  User({this.username, this.password});
}

