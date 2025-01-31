import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rpg_flutter_app/data/fichas_data.dart';

class JogadorFicha {
  String nome;
  String classe;
  String raca;
  String imagem;
  String historia;
  Map<String, int> atributos;

  JogadorFicha({
    required this.nome,
    required this.classe,
    required this.raca,
    required this.imagem,
    required this.historia,
    required this.atributos,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'classe': classe,
      'raca': raca,
      'imagem': imagem,
      'historia': historia,
      'atributos': atributos,
    };
  }

  factory JogadorFicha.fromMap(Map<String, dynamic> map) {
    return JogadorFicha(
      nome: map['nome'],
      classe: map['classe'],
      raca: map['raca'],
      imagem: map['imagem'],
      historia: map['historia'],
      atributos: Map<String, int>.from(map['atributos']),
    );
  }
}

class JogadorData {
  static Future<void> salvarFicha(JogadorFicha ficha) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('ficha_jogador', jsonEncode(ficha.toMap()));
  }

  static Future<JogadorFicha?> carregarFicha() async {
    final prefs = await SharedPreferences.getInstance();
    String? fichaJson = prefs.getString('ficha_jogador');
    if (fichaJson != null) {
      return JogadorFicha.fromMap(jsonDecode(fichaJson));
    }
    return null;
  }

  static Future<void> limparFicha() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('ficha_jogador');
  }
}
