import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DiarioPage extends StatefulWidget {
  @override
  _DiarioPageState createState() => _DiarioPageState();
}

class _DiarioPageState extends State<DiarioPage> {
  TextEditingController _controller = TextEditingController();
  List<String> _anotacoes = [];

  @override
  void initState() {
    super.initState();
    _carregarAnotacoes();
  }

  Future<void> _carregarAnotacoes() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _anotacoes = prefs.getStringList('diario_anotacoes') ?? [];
    });
  }

  Future<void> _salvarAnotacoes() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('diario_anotacoes', _anotacoes);
  }

  void _adicionarAnotacao() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _anotacoes.add(_controller.text);
        _controller.clear();
      });
      _salvarAnotacoes();
    }
  }

  void _removerAnotacao(int index) {
    setState(() {
      _anotacoes.removeAt(index);
    });
    _salvarAnotacoes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Diário do Jogador")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Nova anotação",
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _adicionarAnotacao,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _anotacoes.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title: Text(_anotacoes[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _removerAnotacao(index),
                    ),
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
