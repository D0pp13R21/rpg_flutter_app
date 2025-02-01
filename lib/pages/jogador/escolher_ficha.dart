import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:rpg_flutter_app/database/fichas_database.dart';
import 'ficha_jogador.dart';

class EscolherFichaPage extends StatelessWidget {
  final Function(String) onFichaEscolhida;

  // Construtor com parâmetro obrigatório
  EscolherFichaPage({required this.onFichaEscolhida});

  // Função para salvar a ficha escolhida e invocar o callback
  Future<void> _salvarFichaEscolhida(
      Map<String, dynamic> ficha, BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('ficha_jogador_dados', jsonEncode(ficha));
    // Chama o callback passando, por exemplo, o nome da ficha escolhida
    onFichaEscolhida(ficha['nome']);
    // Navega para a tela da ficha do jogador
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => FichaJogadorPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fichas = FichasDatabase.fichasDisponiveis;
    return Scaffold(
      appBar: AppBar(title: Text("Escolha sua Ficha")),
      body: ListView.builder(
        itemCount: fichas.length,
        itemBuilder: (context, index) {
          final ficha = fichas[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: Image.asset(
                ficha['imagem'],
                width: 50,
                height: 50,
              ),
              title: Text(ficha['nome']),
              subtitle: Text(ficha['historia']),
              onTap: () => _salvarFichaEscolhida(ficha, context),
            ),
          );
        },
      ),
    );
  }
}
