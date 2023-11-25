import 'package:flutter/material.dart';
import 'login.dart'; // Importe o arquivo da tela de login
import 'homepage.dart'; // Importe o arquivo da homepage

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Criar um MaterialColor personalizado com a cor desejada
    MaterialColor customColor = MaterialColor(
      0xFFFFD9DD,
      <int, Color>{
        50: Color(0xFFFFD9DD),
        100: Color(0xFFFFD9DD),
        200: Color(0xFFFFD9DD),
        300: Color(0xFFFFD9DD),
        400: Color(0xFFFFD9DD),
        500: Color(0xFFFFD9DD), // Esta cor é usada como a principal
        600: Color(0xFFFFD9DD),
        700: Color(0xFFFFD9DD),
        800: Color(0xFFFFD9DD),
        900: Color(0xFFFFD9DD),
      },
    );

    return MaterialApp(
      title: 'Ciclo Fácil',
      theme: ThemeData(
        primarySwatch: customColor, // Usar o MaterialColor personalizado
      ),
      home: AuthenticationWrapper(),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Adicione aqui a lógica para verificar se o usuário está logado
    // Por exemplo, você pode usar um provedor de estado ou um serviço de autenticação

    bool isUserLoggedIn = false; // Substitua por sua lógica de autenticação

    // ignore: dead_code
    if (isUserLoggedIn) {
      return HomePage();
    }else {
      return LoginPage();
    }
  }
}
