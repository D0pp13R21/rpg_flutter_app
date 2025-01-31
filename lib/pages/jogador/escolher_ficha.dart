import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rpg_flutter_app/database/fichas_database.dart'; // Arquivo onde estão as fichas
import 'package:rpg_flutter_app/pages/jogador/ficha_jogador.dart'; // Página da ficha do jogador

class EscolherFichaPage extends StatefulWidget {
  final Function(String)
      onFichaEscolhida; // Callback para atualizar no `fichas.dart`

  EscolherFichaPage({required this.onFichaEscolhida});

  @override
  _EscolherFichaPageState createState() => _EscolherFichaPageState();
}

class _EscolherFichaPageState extends State<EscolherFichaPage> {
  List<Map<String, dynamic>> fichas = FichasDatabase.fichasDisponiveis;

  Future<void> _salvarFichaEscolhida(String nomeFicha) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('ficha_jogador', nomeFicha);
    widget.onFichaEscolhida(nomeFicha);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Escolha sua Ficha")),
      body: ListView.builder(
        itemCount: fichas.length,
        itemBuilder: (context, index) {
          final ficha = fichas[index];
          return ListTile(
            leading: Image.asset(ficha['imagem'],
                width: 50, height: 50), // Exibe a imagem da ficha
            title: Text(ficha['nome']),
            subtitle: Text(ficha['historia']),
            onTap: () {
              _salvarFichaEscolhida(ficha['nome']);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => FichaJogadorPage()),
              );
            },
          );
        },
      ),
    );
  }
}
