import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'escolher_ficha.dart';
import 'ficha_jogador.dart';

class FichasJogadorPage extends StatefulWidget {
  @override
  _FichasJogadorPageState createState() => _FichasJogadorPageState();
}

class _FichasJogadorPageState extends State<FichasJogadorPage> {
  bool fichaSelecionada = false;

  @override
  void initState() {
    super.initState();
    _verificarFicha();
  }

  Future<void> _verificarFicha() async {
    final prefs = await SharedPreferences.getInstance();
    String? fichaJson = prefs.getString('ficha_jogador_dados');
    setState(() {
      fichaSelecionada = fichaJson != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ficha do Jogador")),
      body: fichaSelecionada
          ? FichaJogadorPage()
          : EscolherFichaPage(
              onFichaEscolhida: (String fichaNome) {
                setState(() {
                  fichaSelecionada = true;
                });
              },
            ),
    );
  }
}
