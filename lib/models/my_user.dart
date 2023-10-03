class MyUser {
  int? id;
  static const TABLE_NAME = 'users';
  final String email, password;

  MyUser({
    int? this.id,
    required this.email,
    required this.password,
  });

  // Convert a MyUser into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    if (id != null) {
      return {
        'id': id,
        'email': email,
        'password': password,
      };
    }

    return {
      'email': email,
      'password': password,
    };
  }

  // Convert the List<Map<String, dynamic> into a List<MyUser>.
  static Future<List<dynamic>> mapsToListOfUser(
      List<Map<String, dynamic>> maps) async {
    return List.generate(
      maps.length,
      (i) => MyUser(
        id: maps[i]['id'],
        email: maps[i]['email'],
        password: maps[i]['password'],
      ),
    );
  }

  // Implement toString to make it easier to see information about
  // each user when using the print statement.
  @override
  String toString() {
    return 'MyUser{id: $id, email: $email}';
  }
}
