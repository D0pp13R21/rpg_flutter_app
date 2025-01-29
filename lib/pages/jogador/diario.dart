import 'package:flutter/material.dart';

class DiarioPage extends StatefulWidget {
  @override
  _DiarioPageState createState() => _DiarioPageState();
}

class _DiarioPageState extends State<DiarioPage> {
  List<String> entradasDiario = [];

  TextEditingController _controller = TextEditingController();

  void adicionarEntrada() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        entradasDiario.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void removerEntrada(int index) {
    setState(() {
      entradasDiario.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Diário do Jogador')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Nova Entrada',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: adicionarEntrada,
            child: Text('Adicionar'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: entradasDiario.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(entradasDiario[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => removerEntrada(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
