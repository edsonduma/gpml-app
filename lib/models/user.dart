class User {
  int? id;
  static const TABLE_NAME = 'users';
  final String nome, email, password;

  User({
    int? this.id,
    required this.nome,
    required this.email,
    required this.password,
  });

  // Convert a User into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'password': password,
    };
  }

  // Convert the List<Map<String, dynamic> into a List<User>.
  static Future<List<dynamic>> mapsToListOfUser(
      List<Map<String, dynamic>> maps) async {
    return List.generate(
      maps.length,
      (i) => User(
        id: maps[i]['id'],
        nome: maps[i]['nome'],
        email: maps[i]['email'],
        password: maps[i]['password'],
      ),
    );
  }

  // Implement toString to make it easier to see information about
  // each user when using the print statement.
  @override
  String toString() {
    return 'User{id: $id, nome: $nome, email: $email}';
  }
}
