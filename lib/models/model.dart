class Model {
  int? id;
  static const TABLE_NAME = 'models';
  final String nome, apelido, contactos;
  final double altura, cintura, anca, sapato;
  final List<String> trabalhos;
  // final List<String> contactos;

  Model({
    int? this.id,
    required this.nome,
    required this.apelido,
    required this.altura,
    required this.cintura,
    required this.anca,
    required this.sapato,
    required this.trabalhos,
    required this.contactos,
  });

  // Convert a Model into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'apelido': apelido,
      'altura': altura,
      'cintura': cintura,
      'anca': anca,
      'sapato': sapato,
      'trabalhos': trabalhos,
      'contactos': contactos,
    };
  }

  // Convert the List<Map<String, dynamic> into a List<Model>.
  static Future<List<dynamic>> mapsToListOfUser(
      List<Map<String, dynamic>> maps) async {
    return List.generate(
      maps.length,
      (i) => Model(
        id: maps[i]['id'],
        nome: maps[i]['nome'],
        apelido: maps[i]['apelido'],
        altura: maps[i]['altura'],
        cintura: maps[i]['cintura'],
        anca: maps[i]['anca'],
        sapato: maps[i]['sapato'],
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
