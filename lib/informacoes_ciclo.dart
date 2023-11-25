import 'package:flutter/material.dart';

class InformacoesCiclo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cadastro 2',
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Conteúdo da tela de cadastro 2'),
            SizedBox(
                height: 20.0), // Adicione um espaço entre o texto e o botão
            ElevatedButton(
              onPressed: () {
                //Lógica para transição de página
              },
              child: Text('Próximo'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF750815), // Cor da barra inferior
        child: Container(
          height: 50.0, // Altura desejada da barra inferior
          child: Center(
            child: Text(
              'Barra inferior',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
