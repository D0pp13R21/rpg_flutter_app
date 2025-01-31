class Monstro {
  final String nome;
  final String tipo;
  final String imagem;
  final String descricao;
  final Map<String, int> atributos;

  Monstro({
    required this.nome,
    required this.tipo,
    required this.imagem,
    required this.descricao,
    required this.atributos,
  });
}

List<Monstro> listaDeMonstros = [
  Monstro(
    nome: "Dragão Ancião",
    tipo: "Dragão",
    imagem: "assets/images/dragao.jpg",
    descricao:
        "Uma criatura imponente e temida, com séculos de sabedoria e poder destrutivo.",
    atributos: {
      "Força": 25,
      "Destreza": 14,
      "Constituição": 22,
      "Inteligência": 20,
      "Sabedoria": 18,
      "Carisma": 21
    },
  ),
  Monstro(
    nome: "Lobo Sombrio",
    tipo: "Fera",
    imagem: "assets/images/lobo.jpg",
    descricao:
        "Um predador furtivo que ataca na calada da noite com garras afiadas e sentidos aguçados.",
    atributos: {
      "Força": 14,
      "Destreza": 18,
      "Constituição": 12,
      "Inteligência": 8,
      "Sabedoria": 12,
      "Carisma": 10
    },
  ),
  Monstro(
    nome: "Espectro Assombrado",
    tipo: "Morto-Vivo",
    imagem: "assets/images/espectro.jpg",
    descricao:
        "O espírito de um guerreiro caído, condenado a vagar eternamente entre os vivos.",
    atributos: {
      "Força": 10,
      "Destreza": 16,
      "Constituição": 10,
      "Inteligência": 14,
      "Sabedoria": 16,
      "Carisma": 18
    },
  ),
];
