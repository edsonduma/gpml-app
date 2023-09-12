class Agency {
  int? id;
  static const TABLE_NAME = 'agencies';
  final String nome;
  final String? foto, contactos;

  Agency({
    int? this.id,
    required this.nome,
    this.foto,
    this.contactos,
  });

  // Convert a Agency into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'foto': foto,
      'contactos': contactos,
    };
  }

  // Convert the List<Map<String, dynamic> into a List<Agency>.
  static Future<List<dynamic>> mapsToListOfUser(
      List<Map<String, dynamic>> maps) async {
    return List.generate(
      maps.length,
      (i) => Agency(
        id: maps[i]['id'],
        nome: maps[i]['nome'],
        foto: maps[i]['foto'],
        contactos: maps[i]['contactos'],
      ),
    );
  }

  // Implement toString to make it easier to see information about
  // each user when using the print statement.
  @override
  String toString() {
    return 'Agency{id: $id, nome: $nome, foto: $foto, contactos: $contactos}';
  }
}
