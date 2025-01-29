import 'package:flutter/material.dart';

class FichasMestrePage extends StatelessWidget {
  final List<String> fichas = [
    'Personagem 1',
    'Personagem 2',
    'Personagem 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fichas de Personagens - Mestre')),
      body: ListView.builder(
        itemCount: fichas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(fichas[index]),
            trailing: Icon(Icons.visibility),
            onTap: () {
              // Aqui você pode navegar para uma tela de detalhes da ficha
            },
          );
        },
      ),
    );
  }
}
