enum ApiStatus {
  sincronizado,
  pendente,
  editando,
}

class BaseModel {
  BaseModel({
    required this.dataCriacao,
    required this.dataAlteracao,
  });

  final DateTime dataCriacao;
  final DateTime dataAlteracao;

  // Método para converter os campos base para Map
  Map<String, dynamic> get baseMap => {
        'data_criacao': dataCriacao.toIso8601String(),
        'data_alteracao': dataAlteracao.toIso8601String(),
      };

  // Construtor nomeado para criar um BaseModel a partir de um Map
  BaseModel.fromMap(Map<String, dynamic> map)
      : dataCriacao = DateTime.parse(map['data_criacao']),
        dataAlteracao = DateTime.parse(map['data_alteracao']);
}
