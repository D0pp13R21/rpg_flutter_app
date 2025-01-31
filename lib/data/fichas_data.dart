class Ficha {
  final String nome;
  final String classe;
  final String raca;
  final String imagem;
  final String historia;
  final Map<String, int> atributos;

  Ficha({
    required this.nome,
    required this.classe,
    required this.raca,
    required this.imagem,
    required this.historia,
    required this.atributos,
  });
}

List<Ficha> listaDeFichas = [
  Ficha(
    nome: "Aldric, o Bravo",
    classe: "Guerreiro",
    raca: "Humano",
    imagem: "assets/images/guerreiro.jpg",
    historia:
        "Aldric cresceu em um vilarejo atacado por bandidos. Jurou proteger os inocentes e se tornou um guerreiro lendário.",
    atributos: {
      "Força": 18,
      "Destreza": 12,
      "Constituição": 16,
      "Inteligência": 10,
      "Sabedoria": 11,
      "Carisma": 14
    },
  ),
  Ficha(
    nome: "Selene, a Feiticeira",
    classe: "Maga",
    raca: "Elfa",
    imagem: "assets/images/feiticeira.png",
    historia:
        "Selene descobriu sua magia ao ler pergaminhos antigos. Agora busca conhecimento arcano para desvendar segredos místicos.",
    atributos: {
      "Força": 8,
      "Destreza": 14,
      "Constituição": 12,
      "Inteligência": 18,
      "Sabedoria": 15,
      "Carisma": 13
    },
  ),
  Ficha(
    nome: "Throg, o Imbatível",
    classe: "Bárbaro",
    raca: "Orc",
    imagem: "assets/images/barbaro.jpg",
    historia:
        "Temido nos campos de batalha, Throg luta com fúria incontrolável e deseja se tornar o maior guerreiro da história.",
    atributos: {
      "Força": 20,
      "Destreza": 10,
      "Constituição": 18,
      "Inteligência": 8,
      "Sabedoria": 10,
      "Carisma": 12
    },
  ),
];
