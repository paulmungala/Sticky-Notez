const String tableUser = 'user';

//model for UserFields
class UserFields {
  static const String id = '_id';
  static const String email = 'email';
  static const String password = 'password';
}

class User {
  final int? id;
  final String email;
  final String password;

  const User({
    this.id,
    required this.email,
    required this.password,
  });

  //to turn to JSON
  Map<String, Object?> toJson() => {
    UserFields.id: id,
    UserFields.email: email,
    UserFields.password: password,
  };

  //copy
  User copy({
    int? id,
    String? email,
    String? password,
  }) => 
      User(
        id: id ?? this.id,
        email: email ?? this.email,
        password: password ?? this.password, 
        );
}
