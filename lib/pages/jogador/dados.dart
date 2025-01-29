import 'package:flutter/material.dart';
import 'dart:math';

class DadosPage extends StatefulWidget {
  @override
  _DadosPageState createState() => _DadosPageState();
}

class _DadosPageState extends State<DadosPage> {
  int? resultadoDado;
  final List<int> tiposDeDados = [4, 6, 8, 10, 12, 20, 100];

  void rolarDado(int lados) {
    setState(() {
      resultadoDado = Random().nextInt(lados) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rolar Dados')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (resultadoDado != null)
            Text(
              'Resultado: $resultadoDado',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: tiposDeDados.length,
              itemBuilder: (context, index) {
                int dado = tiposDeDados[index];
                return ListTile(
                  title: Text('Rolar D$dado'),
                  trailing: Icon(Icons.casino),
                  onTap: () => rolarDado(dado),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
