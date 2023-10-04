class Designer {
  int? id;
  int representante;
  static const TABLE_NAME = 'designers';
  final String nome, apelido, contactos;
  final List<String> trabalhos;

  // final List<String> contactos;

  Designer({
    int? this.id,
    required this.representante,
    required this.nome,
    required this.apelido,
    required this.trabalhos,
    required this.contactos,
  });

  // Convert a Model into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    if (id != null) {
      return {
        'id': id,
        'representante': representante,
        'nome': nome,
        'apelido': apelido,
        'trabalhos': trabalhos.toString(),
        'contactos': contactos,
      };
    }

    return {
      'representante': representante,
      'nome': nome,
      'apelido': apelido,
      'trabalhos': trabalhos.toString(),
      'contactos': contactos,
    };
  }

  // Convert the List<Map<String, dynamic> into a List<Model>.
  static Future<List<dynamic>> mapsToListOfUser(
      List<Map<String, dynamic>> maps) async {
    return List.generate(
      maps.length,
      (i) => Designer(
        representante: maps[i]['representante'],
        id: maps[i]['id'],
        nome: maps[i]['nome'],
        apelido: maps[i]['apelido'],
        trabalhos: maps[i]['trabalhos'],
        contactos: maps[i]['contactos'],
      ),
    );
  }

  // Implement toString to make it easier to see information about
  // each user when using the print statement.
  @override
  String toString() {
    return 'Model{id: $id, nome: $nome, apelido: $apelido}';
  }
}
