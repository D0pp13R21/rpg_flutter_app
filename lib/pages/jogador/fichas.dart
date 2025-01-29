import 'package:flutter/material.dart';

class FichasJogadorPage extends StatelessWidget {
  final List<String> fichasJogador = [
    'Minha Ficha 1',
    'Minha Ficha 2',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Minhas Fichas')),
      body: ListView.builder(
        itemCount: fichasJogador.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(fichasJogador[index]),
            trailing: Icon(Icons.edit),
            onTap: () {
              // Aqui você pode adicionar uma navegação para editar fichas
            },
          );
        },
      ),
    );
  }
}
