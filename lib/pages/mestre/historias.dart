import 'package:flutter/material.dart';

class HistoriasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Histórias para o RPG')),
      body: Center(
        child: Text('Lista de histórias para a campanha.'),
      ),
    );
  }
}
