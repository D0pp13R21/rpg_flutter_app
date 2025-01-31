class FichasDatabase {
  // Lista de fichas disponíveis para o jogador e mestre
  static List<Map<String, dynamic>> fichasDisponiveis = [
    {
      'nome': 'Guerreiro',
      'imagem': 'assets/images/guerreiro.jpg', // Caminho da imagem
      'historia': 'Um guerreiro forte e destemido.',
      'forca': 10,
      'agilidade': 7,
      'inteligencia': 5,
    },
    {
      'nome': 'Mago',
      'imagem': 'assets/images/feiticeira.png',
      'historia': 'Mestre das artes arcanas.',
      'forca': 3,
      'agilidade': 6,
      'inteligencia': 10,
    },
    {
      'nome': 'Ladino',
      'imagem': 'assets/images/ladina.png',
      'historia': 'Um mestre da furtividade e enganação.',
      'forca': 5,
      'agilidade': 10,
      'inteligencia': 6,
    },
  ];
}
