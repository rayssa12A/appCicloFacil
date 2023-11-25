import 'package:flutter/material.dart';
import 'homepage.dart'; // Importe a página de homepage
import 'cadastro.dart'; // Importe a página de cadastro

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 133, 29, 41),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              Container(
                height: 200, // Ajuste a altura conforme necessário
                // Inclua aqui o seu logo
                child: Image.network('public\\images\\logo_.png'),
              ),
              Text(
                'Ciclo Fácil',
                style: TextStyle(
                  fontFamily: 'Ephesis',
                  color: Color(0xFFFFECEE),
                  fontSize: 50,
                ),
              ),
              SizedBox(height: 10), // Espaçamento entre o logo e o nome_app
              // Nome do App
              SizedBox(height: 20),
              // Campo de Email
              TextFormField(
                style: TextStyle(
                  color: Color(0xFFFFD9DD), // Cor do texto do campo
                ),
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Color(
                        0xFFFFD9DD), // Cor do texto do rótulo quando em foco
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFFD9DD), // Cor da borda quando em foco
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color:
                          Color(0xFFFFD9DD), // Cor da borda quando fora de foco
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Campo de Senha
              TextFormField(
                style: TextStyle(
                  color: Color(0xFFFFD9DD), // Cor do texto do campo
                ),
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(
                    color: Color(
                        0xFFFFD9DD), // Cor do texto do rótulo quando em foco
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFFD9DD), // Cor da borda quando em foco
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color:
                          Color(0xFFFFD9DD), // Cor da borda quando fora de foco
                    ),
                  ),
                ),
                obscureText: true, // Para ocultar a senha
              ),
              SizedBox(height: 20),
              // Botão Entrar
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFFFD9DD), // Cor de fundo do botão
                ),
                child: Text(
                  'Entrar',
                  style: TextStyle(
                    color: Color(0xFF750815), // Cor do texto do botão
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Link para a página de Cadastro
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CadastroPage()),
                  );
                },
                child: Text(
                  'Não tem cadastro? Clique aqui para se cadastrar.',
                  style: TextStyle(
                    color: Color(0xFFFFD9DD), // Cor do texto do link
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
