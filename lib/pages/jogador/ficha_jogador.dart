import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'escolher_ficha.dart';

class FichaJogadorPage extends StatefulWidget {
  @override
  _FichaJogadorPageState createState() => _FichaJogadorPageState();
}

class _FichaJogadorPageState extends State<FichaJogadorPage> {
  // Dados da ficha
  String? nome;
  String? historia;
  String? imagemPath;
  int? forca;
  int? agilidade;
  int? inteligencia;

  // Controladores para edição de texto
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _historiaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _carregarFicha();
  }

  // Carrega os dados salvos (ou os dados base, se ainda não houver)
  Future<void> _carregarFicha() async {
    final prefs = await SharedPreferences.getInstance();
    String? fichaJson = prefs.getString('ficha_jogador_dados');
    if (fichaJson != null) {
      Map<String, dynamic> ficha = jsonDecode(fichaJson);
      setState(() {
        nome = ficha['nome'];
        historia = ficha['historia'];
        imagemPath = ficha['imagem'];
        forca = ficha['forca'];
        agilidade = ficha['agilidade'];
        inteligencia = ficha['inteligencia'];
        _nomeController.text = nome ?? "";
        _historiaController.text = historia ?? "";
      });
    }
  }

  // Salva os dados atuais da ficha no SharedPreferences
  Future<void> _salvarFicha() async {
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> ficha = {
      'nome': nome,
      'historia': historia,
      'imagem': imagemPath,
      'forca': forca,
      'agilidade': agilidade,
      'inteligencia': inteligencia,
    };
    await prefs.setString('ficha_jogador_dados', jsonEncode(ficha));
  }

  // Exibe uma caixa de diálogo de confirmação e retorna true se o usuário confirmar
  Future<bool> _showConfirmationDialog(String title, String content) async {
    bool confirmado = false;
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  confirmado = false;
                },
                child: Text("Cancelar")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  confirmado = true;
                },
                child: Text("Confirmar")),
          ],
        );
      },
    );
    return confirmado;
  }

  // Permite escolher uma nova imagem (após confirmação)
  Future<void> _escolherImagem() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      bool confirm = await _showConfirmationDialog(
          "Alterar Imagem", "Deseja alterar a imagem da ficha?");
      if (confirm) {
        setState(() {
          imagemPath = pickedFile.path;
        });
        _salvarFicha();
      }
    }
  }

  // Atualiza um campo textual (nome ou história) após confirmação
  Future<void> _atualizarCampo(String campo, String novoValor) async {
    bool confirm = await _showConfirmationDialog(
        "Alterar $campo", "Deseja alterar o $campo para '$novoValor'?");
    if (confirm) {
      setState(() {
        if (campo == 'nome') {
          nome = novoValor;
          _nomeController.text = novoValor;
        } else if (campo == 'historia') {
          historia = novoValor;
          _historiaController.text = novoValor;
        }
      });
      _salvarFicha();
    }
  }

  // Atualiza um atributo (força, agilidade ou inteligência) após confirmação
  Future<void> _atualizarAtributo(String atributo, int novoValor) async {
    bool confirm = await _showConfirmationDialog(
        "Alterar $atributo", "Deseja alterar $atributo para $novoValor?");
    if (confirm) {
      setState(() {
        if (atributo == 'forca') {
          forca = novoValor;
        } else if (atributo == 'agilidade') {
          agilidade = novoValor;
        } else if (atributo == 'inteligencia') {
          inteligencia = novoValor;
        }
      });
      _salvarFicha();
    }
  }

  // Exibe uma janela com os detalhes completos da ficha (para consulta)
  void _mostrarDetalhesFicha() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Detalhes da Ficha"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nome: $nome", style: TextStyle(fontSize: 16)),
                SizedBox(height: 4),
                Text("História: $historia", style: TextStyle(fontSize: 16)),
                SizedBox(height: 4),
                Text("Força: $forca", style: TextStyle(fontSize: 16)),
                SizedBox(height: 4),
                Text("Agilidade: $agilidade", style: TextStyle(fontSize: 16)),
                SizedBox(height: 4),
                Text("Inteligência: $inteligencia",
                    style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text("Fechar")),
          ],
        );
      },
    );
  }

  // Permite mudar de ficha: confirma se deseja apagar os dados atuais e selecionar outra ficha
  Future<void> _mudarFicha() async {
    bool confirm = await _showConfirmationDialog("Mudar Ficha",
        "Ao mudar de ficha, os dados da ficha atual serão apagados. Deseja continuar?");
    if (confirm) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('ficha_jogador_dados');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                EscolherFichaPage(onFichaEscolhida: (String ficha) {})),
      );
    }
  }

  // Widget para edição dos atributos com botões de incremento e decremento
  Widget _buildAtributoEditor(String titulo, int valor, String atributo) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$titulo: $valor", style: TextStyle(fontSize: 18)),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                if (valor > 0) {
                  _atualizarAtributo(atributo, valor - 1);
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _atualizarAtributo(atributo, valor + 1),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (nome == null || historia == null || forca == null) {
      return Scaffold(
        appBar: AppBar(title: Text("Carregando ficha...")),
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Ficha do Jogador"),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: _mostrarDetalhesFicha,
          ),
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _mudarFicha,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Imagem da ficha (toca para alterar, com confirmação)
            GestureDetector(
              onTap: _escolherImagem,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: imagemPath != null
                    ? (File(imagemPath!).existsSync()
                        ? FileImage(File(imagemPath!))
                        : AssetImage(imagemPath!) as ImageProvider)
                    : AssetImage('assets/placeholder.png'),
              ),
            ),
            SizedBox(height: 16),
            // Campo para editar o nome, com botão para salvar (confirmação)
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _nomeController,
                    decoration: InputDecoration(labelText: "Nome"),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () =>
                      _atualizarCampo('nome', _nomeController.text),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Campo para editar a história, com botão para salvar (confirmação)
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _historiaController,
                    decoration: InputDecoration(labelText: "História"),
                    maxLines: 3,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () =>
                      _atualizarCampo('historia', _historiaController.text),
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(),
            // Edição dos atributos
            Text("Atributos",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            _buildAtributoEditor("Força", forca!, "forca"),
            _buildAtributoEditor("Agilidade", agilidade!, "agilidade"),
            _buildAtributoEditor("Inteligência", inteligencia!, "inteligencia"),
          ],
        ),
      ),
    );
  }
}
