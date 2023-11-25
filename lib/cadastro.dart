import 'package:flutter/material.dart';

class CadastroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cadastro',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF750815),
        iconTheme: IconThemeData(
          color: Colors.white, // Defina a cor da seta de voltar aqui
        ),
      ),
      body: Center(
        child: Text('Conteúdo da tela de cadastro'),
      ),
    );
  }
}
