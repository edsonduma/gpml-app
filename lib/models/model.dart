class Model {
  int? id;
  int representante;
  static const TABLE_NAME = 'models';
  final String nome, apelido, genero, contactos;
  final double altura, cintura, anca, sapato;
  final List<String> trabalhos;

  // final List<String> contactos;

  Model({
    int? this.id,
    required this.representante,
    required this.nome,
    required this.apelido,
    required this.genero,
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
    if (id != null) {
      return {
        'id': id,
        'representante': representante,
        'nome': nome,
        'apelido': apelido,
        'genero': genero,
        'altura': altura,
        'cintura': cintura,
        'anca': anca,
        'sapato': sapato,
        'trabalhos': trabalhos.toString(),
        'contactos': contactos,
      };
    }

    return {
      'representante': representante,
      'nome': nome,
      'apelido': apelido,
      'genero': genero,
      'altura': altura,
      'cintura': cintura,
      'anca': anca,
      'sapato': sapato,
      'trabalhos': trabalhos.toString(),
      'contactos': contactos,
    };
  }

  // Convert the List<Map<String, dynamic> into a List<Model>.
  static Future<List<dynamic>> mapsToListOfUser(
      List<Map<String, dynamic>> maps) async {
    return List.generate(
      maps.length,
      (i) => Model(
        representante: maps[i]['representante'],
        id: maps[i]['id'],
        nome: maps[i]['nome'],
        apelido: maps[i]['apelido'],
        genero: maps[i]['genero'],
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
