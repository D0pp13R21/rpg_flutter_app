class JogadorData {
  String nome;
  String imagem;
  String historia;

  JogadorData(
      {required this.nome, required this.imagem, required this.historia});

  // Converte para JSON para salvar no SharedPreferences
  Map<String, dynamic> toJson() => {
        'nome': nome,
        'imagem': imagem,
        'historia': historia,
      };

  // Constrói a ficha a partir do JSON
  factory JogadorData.fromJson(Map<String, dynamic> json) {
    return JogadorData(
      nome: json['nome'],
      imagem: json['imagem'],
      historia: json['historia'],
    );
  }
}
