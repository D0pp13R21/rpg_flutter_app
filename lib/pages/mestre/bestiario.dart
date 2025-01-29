import 'package:flutter/material.dart';

class BestiarioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bestiário')),
      body: Center(
        child: Text('Lista de criaturas para o RPG.'),
      ),
    );
  }
}
