import 'package:flutter/material.dart';
import 'fichas.dart';
import 'diario.dart';
import 'dados.dart';

class JogadorHomePage extends StatelessWidget {
  final List<Map<String, dynamic>> opcoesJogador = [
    {'titulo': 'Fichas', 'pagina': FichasJogadorPage()},
    {'titulo': 'Diário', 'pagina': DiarioPage()},
    {'titulo': 'Dados', 'pagina': DadosPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Jogador - Opções')),
      body: ListView.builder(
        itemCount: opcoesJogador.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(opcoesJogador[index]['titulo']),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => opcoesJogador[index]['pagina']),
              );
            },
          );
        },
      ),
    );
  }
}
