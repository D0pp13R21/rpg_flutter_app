import 'package:flutter/material.dart';

class PersonagensPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Personagens Notáveis')),
      body: Center(
        child: Text('Lista de personagens importantes para a aventura.'),
      ),
    );
  }
}
