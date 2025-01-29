import 'package:flutter/material.dart';

class ItensPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Itens e Recompensas')),
      body: Center(
        child: Text('Lista de itens e recompensas para o jogo.'),
      ),
    );
  }
}
