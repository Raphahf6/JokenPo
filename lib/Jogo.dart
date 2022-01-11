import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage('images/padrao.png');
  var _resultado = 'Escolha uma opção abaixo';

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ['pedra', 'papel', 'tesoura'];
    var numero = Random().nextInt(opcoes.length);
    var escolhaApp = opcoes[numero];

    //Exibi a imagem escolhida pelo App
    switch (escolhaApp) {
      case 'pedra':
        setState(() {
          _imagemApp = AssetImage('images/pedra.png');
        });
        break;
      case 'papel':
        setState(() {
          _imagemApp = AssetImage('images/papel.png');
        });
        break;
      case 'tesoura':
        setState(() {
          _imagemApp = AssetImage('images/tesoura.png');
        });
        break;
    }

    //Validação do ganhador
    if ((escolhaUsuario == 'pedra' && escolhaApp == 'tesoura') ||
        (escolhaUsuario == 'papel' && escolhaApp == 'pedra') ||
        (escolhaUsuario == 'tesoura' && escolhaApp == 'papel')) {
      setState(() {
        _resultado = 'Você ganhou! :D';
      });
    } else if ((escolhaApp == 'pedra' && escolhaUsuario == 'tesoura') ||
        (escolhaApp == 'papel' && escolhaUsuario == 'pedra') ||
        (escolhaApp == 'tesoura' && escolhaUsuario == 'papel')) {
      setState(() {
        _resultado = 'Você perdeu! :/';
      });
    } else {
      setState(() {
        _resultado = 'Nossa, um empate!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JokenPo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //text
          //imagem
          //text resultador
          // Linha com 3 imagems
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha do app:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Image(
            image: _imagemApp,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _resultado,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () => _opcaoSelecionada('pedra'),
                  child: Image.asset('images/pedra.png', height: 100)),
              GestureDetector(
                  onTap: () => _opcaoSelecionada('papel'),
                  child: Image.asset('images/papel.png', height: 100)),
              GestureDetector(
                  onTap: () => _opcaoSelecionada('tesoura'),
                  child: Image.asset('images/tesoura.png', height: 100)),
              /*Image.asset('images/pedra.png', height: 100),
              Image.asset('images/papel.png', height: 100),
              Image.asset('images/tesoura.png', height: 100),
            */
            ],
          )
        ],
      ),
    );
  }
}
