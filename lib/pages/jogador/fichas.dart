import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'escolher_ficha.dart';
import 'ficha_jogador.dart';
import 'jogador_data.dart';

class FichasJogadorPage extends StatefulWidget {
  @override
  _FichasJogadorPageState createState() => _FichasJogadorPageState();
}

class _FichasJogadorPageState extends State<FichasJogadorPage> {
  String? fichaEscolhida; // Armazena o nome da ficha escolhida

  @override
  void initState() {
    super.initState();
    _carregarFichaEscolhida();
  }

  // Verifica se o jogador já escolheu uma ficha
  Future<void> _carregarFichaEscolhida() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      fichaEscolhida = prefs.getString('ficha_jogador');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ficha do Jogador")),
      body: Center(
        child: fichaEscolhida == null
            ? // Se não escolheu, abre a tela de escolher ficha
            EscolherFichaPage(
                onFichaEscolhida: (String ficha) {
                  setState(() {
                    fichaEscolhida = ficha;
                  });
                },
              )
            : // Se já escolheu, mostra a ficha do jogador
            FichaJogadorPage(),
      ),
    );
  }
}
