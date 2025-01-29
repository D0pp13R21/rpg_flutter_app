import 'package:flutter/material.dart';

class ComoJogarPage extends StatelessWidget {
  final String textoExplicativo = '''
Este RPG é baseado em narrativas dinâmicas onde o Mestre guia os jogadores...
Aqui você encontrará dicas e regras sobre mecânicas, combates e desenvolvimento da história.
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Como Jogar')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            textoExplicativo,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
