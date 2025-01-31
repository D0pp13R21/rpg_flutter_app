import 'package:flutter/material.dart';
import 'fichas.dart';
import 'como_jogar.dart';
import 'dados.dart';
import 'bestiario.dart';
import 'personagens.dart';
import 'itens.dart';
import 'teologia.dart';
import 'historias.dart';

class MestreHomePage extends StatelessWidget {
  final List<Map<String, dynamic>> opcoesMestre = [
    {'titulo': 'Fichas', 'pagina': FichasPage()},
    {'titulo': 'Como Jogar', 'pagina': ComoJogarPage()},
    {'titulo': 'Dados', 'pagina': DadosPage()},
    {'titulo': 'Bestiário', 'pagina': BestiarioPage()},
    {'titulo': 'Personagens Notáveis', 'pagina': PersonagensPage()},
    {'titulo': 'Itens e Recompensas', 'pagina': ItensPage()},
    {'titulo': 'Teologia', 'pagina': TeologiaPage()},
    {'titulo': 'Histórias', 'pagina': HistoriasPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mestre - Opções')),
      body: ListView.builder(
        itemCount: opcoesMestre.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(opcoesMestre[index]['titulo']),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => opcoesMestre[index]['pagina']),
              );
            },
          );
        },
      ),
    );
  }
}
