class Item {
  final String nome;
  final String descricao;
  final int valor;

  Item({required this.nome, required this.descricao, required this.valor});
}

List<Item> listaDeItens = [
  Item(
      nome: "Espada Longa",
      descricao: "Uma espada bem afiada, excelente para combate corpo a corpo.",
      valor: 50),
  Item(
      nome: "Poção de Cura",
      descricao: "Restaura 20 pontos de vida quando consumida.",
      valor: 25),
  Item(
      nome: "Escudo de Carvalho",
      descricao: "Aumenta a defesa contra ataques físicos.",
      valor: 40),
  Item(
      nome: "Amuleto da Sorte",
      descricao: "Dá um pequeno bônus nas jogadas de dado.",
      valor: 100),
  Item(
      nome: "Tocha",
      descricao: "Ilumina lugares escuros por até 3 horas.",
      valor: 5),
  Item(
      nome: "Arco de Caçador",
      descricao: "Um arco leve e preciso, ideal para ataques à distância.",
      valor: 70),
];
