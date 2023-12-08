import 'dart:convert';
import 'package:ciclo_facil/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CadastroPage(),
    );
  }
}

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController dataNascimentoController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController =
      TextEditingController();

  final String url =
      "http://192.168.18.12/flutter/estudaYestuda/proj_ciclo/ciclo_facil/lib/usuario.php";

  Future<void> _salvarDados() async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'nome': nomeController.text,
          'dataNascimento': dataNascimentoController.text,
          'email': emailController.text,
          'senha': senhaController.text,
          'confirmarSenha': confirmarSenhaController.text,
        }),
      );

      if (response.statusCode == 200) {
        print('--Sucesso ao enviar dados!');
      } else {
        // Lógica de tratamento de erro
        print('--Erro na requisição HTTP: ${response.statusCode}');
      }
    } catch (e) {
      // Lógica de tratamento de exceções
      print('--Erro durante a requisição HTTP: $e');
    }
  }

//Parte principal e barra linear abaixo
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cadastro',
          style: TextStyle(
            color: Color(0xFF750815),
          ),
        ),
        backgroundColor: Color(0xFFFFD9DD),
        iconTheme: IconThemeData(
          color: Color(0xFF750815), // Defina a cor da seta de voltar aqui
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                CadastroScreen(
                  onNext: () {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                ),
                InformacoesCicloScreen(
                  onPrevious: () {
                    _pageController.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  onNext: () {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                ),
                PreferenciasScreen(
                  onPrevious: () {
                    _pageController.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          LinearProgressIndicator(
            value: (_currentPage + 1) / 3,
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFF5112C)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage > 0)
                  ElevatedButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    child: Text(
                      'Anterior',
                      style: TextStyle(color: Color(0xFF750815)),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFFD9DD),
                    ),
                  ),
                Spacer(), // Adicionado Spacer para ocupar o espaço entre os botões
                if (_currentPage < 2)
                  ElevatedButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    child: Text(
                      'Próximo',
                      style: TextStyle(color: Color(0xFF750815)),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFFD9DD),
                    ),
                  ),
                if (_currentPage == 2) // Check if it's the last screen
                  ElevatedButton(
                    onPressed: () {
                      _salvarDados();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Text(
                      'Salvar',
                      style: TextStyle(color: Color(0xFF750815)),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFFD9DD),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 133, 29, 41),
    );
  }
}

class CadastroScreen extends StatelessWidget {
  final VoidCallback onNext;

  CadastroScreen({required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              style: TextStyle(
                color: Color(0xFFFFD9DD),
              ),
              decoration: InputDecoration(
                labelText: 'Nome',
                labelStyle: TextStyle(
                  color: Color(0xFFFFD9DD),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFFFD9DD),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFFFD9DD),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            FormBuilderDateTimePicker(
              name: 'dataNascimento',
              inputType: InputType.date,
              format: DateFormat("dd/MM/yyyy"),
              style: TextStyle(
                color: Color(0xFFFFD9DD),
              ),
              decoration: InputDecoration(
                labelText: 'Data de Nascimento',
                labelStyle: TextStyle(
                  color: Color(0xFFFFD9DD),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFFFD9DD),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFFFD9DD),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              style: TextStyle(
                color: Color(0xFFFFD9DD),
              ),
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Color(0xFFFFD9DD),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFFFD9DD),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFFFD9DD),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              style: TextStyle(
                color: Color(0xFFFFD9DD),
              ),
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(
                  color: Color(0xFFFFD9DD),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFFFD9DD),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFFFD9DD),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              style: TextStyle(
                color: Color(0xFFFFD9DD),
              ),
              decoration: InputDecoration(
                labelText: 'Confirmar senha',
                labelStyle: TextStyle(
                  color: Color(0xFFFFD9DD),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFFFD9DD),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFFFD9DD),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InformacoesCicloScreen extends StatefulWidget {
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  InformacoesCicloScreen({required this.onPrevious, required this.onNext});

  @override
  _InformacoesCicloScreenState createState() => _InformacoesCicloScreenState();
}

class _InformacoesCicloScreenState extends State<InformacoesCicloScreen> {
  final List<String> regularidadeOptions = ['Regular', 'Irregular'];
  final List<String> contraceptivosOptions = ['Sim', 'Não'];
  final List<String> metodosContraceptivosOptions = [
    'DIU',
    'Implante Subdérmico',
    'Injeção Contraceptiva',
    'Pílula Anticoncepcional',
    'Preservativo',
    'Tabelinha'
  ];

  String? selectedRegularidade;
  String? selectedContraceptivos;
  String? selectedMetodoContraceptivo;

  // Campos adicionados
  TextEditingController ultimaMenstruacaoController = TextEditingController();
  TextEditingController dataPrevistaMenstruacaoController =
      TextEditingController();
  TextEditingController duracaoCicloController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButtonFormField<String>(
            value: selectedRegularidade,
            items: regularidadeOptions.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(
                  option,
                  style: TextStyle(
                    color: Color(0xFFFFD9DD),
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedRegularidade = value;
              });
            },
            dropdownColor: Color.fromARGB(255, 204, 66, 82),
            decoration: InputDecoration(
              labelText: 'Seu ciclo é regular ou irregular?',
              labelStyle: TextStyle(
                color: Color(0xFFFFD9DD),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFFFD9DD),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFFFD9DD),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          DropdownButtonFormField<String>(
            value: selectedContraceptivos,
            items: contraceptivosOptions.map((String option) {
              return DropdownMenuItem<String>(
                  value: option,
                  child: Text(
                    option,
                    style: TextStyle(
                      color: Color(0xFFFFD9DD),
                    ),
                  ));
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedContraceptivos = value;
                // Resetar o método contraceptivo selecionado quando a opção 'Não' for escolhida
                selectedMetodoContraceptivo = null;
              });
            },
            dropdownColor: Color.fromARGB(255, 204, 66, 82),
            decoration: InputDecoration(
              labelText: 'Utiliza métodos contraceptivos?',
              labelStyle: TextStyle(
                color: Color(0xFFFFD9DD),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFFFD9DD),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFFFD9DD),
                ),
              ),
            ),
          ),
          if (selectedContraceptivos == 'Sim') ...[
            SizedBox(height: 15),
            DropdownButtonFormField<String>(
              value: selectedMetodoContraceptivo,
              items: metodosContraceptivosOptions.map((String option) {
                return DropdownMenuItem<String>(
                    value: option,
                    child: Text(
                      option,
                      style: TextStyle(
                        color: Color(0xFFFFD9DD),
                      ),
                    ));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedMetodoContraceptivo = value;
                });
              },
              dropdownColor: Color.fromARGB(255, 204, 66, 82),
              decoration: InputDecoration(
                labelText: 'Escolha o método contraceptivo',
                labelStyle: TextStyle(
                  color: Color(0xFFFFD9DD),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFFFD9DD),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFFFD9DD),
                  ),
                ),
              ),
            ),
          ],
          SizedBox(height: 15),
          Column(
            children: [
              FormBuilderDateTimePicker(
                name: 'ultimaMenstruacao',
                inputType: InputType.date,
                format: DateFormat("dd/MM/yyyy"),
                controller: ultimaMenstruacaoController,
                style: TextStyle(
                  color: Color(0xFFFFD9DD),
                ),
                decoration: InputDecoration(
                  labelText: 'Data da Última Menstruação',
                  labelStyle: TextStyle(
                    color: Color(0xFFFFD9DD),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFFD9DD),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFFD9DD),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              FormBuilderDateTimePicker(
                name: 'dataPrevistaMenstruacao',
                inputType: InputType.date,
                format: DateFormat("dd/MM/yyyy"),
                controller: dataPrevistaMenstruacaoController,
                style: TextStyle(
                  color: Color(0xFFFFD9DD),
                ),
                decoration: InputDecoration(
                  labelText: 'Data Prevista para a Próxima Menstruação',
                  labelStyle: TextStyle(
                    color: Color(0xFFFFD9DD),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFFD9DD),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFFD9DD),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: duracaoCicloController,
                style: TextStyle(
                  color: Color(0xFFFFD9DD),
                ),
                decoration: InputDecoration(
                  labelText: 'Duração do Ciclo Menstrual (em dias)',
                  labelStyle: TextStyle(
                    color: Color(0xFFFFD9DD),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFFD9DD),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFFD9DD),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

class PreferenciasScreen extends StatelessWidget {
  final VoidCallback onPrevious;

  PreferenciasScreen({required this.onPrevious});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Página em desenvolvimento '),
          SizedBox(height: 15),
          // Adicione um botão "Salvar" no canto inferior direito
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
            ),
          ),
        ],
      ),
    );
  }
}
