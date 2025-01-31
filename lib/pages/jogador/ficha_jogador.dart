import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rpg_flutter_app/database/fichas_database.dart';
import 'package:rpg_flutter_app/pages/jogador/escolher_ficha.dart';

class FichaJogadorPage extends StatefulWidget {
  @override
  _FichaJogadorPageState createState() => _FichaJogadorPageState();
}

class _FichaJogadorPageState extends State<FichaJogadorPage> {
  Map<String, dynamic>? fichaJogador;
  String? nomeFicha;

  @override
  void initState() {
    super.initState();
    _carregarFicha();
  }

  Future<void> _carregarFicha() async {
    final prefs = await SharedPreferences.getInstance();
    final nome = prefs.getString('ficha_jogador');

    if (nome != null) {
      setState(() {
        nomeFicha = nome;
        fichaJogador = FichasDatabase.fichasDisponiveis.firstWhere(
          (ficha) => ficha['nome'] == nome,
          orElse: () => {},
        );
      });
    }
  }

  Future<void> _removerFicha() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('ficha_jogador');
    setState(() {
      fichaJogador = null;
      nomeFicha = null;
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              EscolherFichaPage(onFichaEscolhida: (ficha) {})),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (fichaJogador == null) {
      return Scaffold(
        appBar: AppBar(title: Text("Ficha do Jogador")),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(nomeFicha ?? "Sem Ficha")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(fichaJogador!['imagem'], width: 100, height: 100),
            Text("Nome: ${fichaJogador!['nome']}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("História: ${fichaJogador!['historia']}"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _removerFicha,
              child: Text("Trocar Ficha"),
            ),
          ],
        ),
      ),
    );
  }
}
