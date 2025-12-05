import 'package:ap2/routes/routes.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffb6bffd),
        appBar: AppBar(backgroundColor: Color(0xffb6bffd)),
        body: Center(
          child: Column(
            children: [
              Image.asset('assets/images/logo_now_news.png', width: 160, height: 160),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 8,
                  children: [
                    TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: 'Nome completo',
                        fillColor: Colors.indigo,
                        filled: true,
                      ),
                    ),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: 'E-mail',
                        fillColor: Colors.indigo,
                        filled: true,
                      ),
                    ),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: 'Senha',
                        fillColor: Colors.indigo,
                        filled: true,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 8,
                  children: [
                    FilledButton(
                      onPressed: () {
                        //colocar função de criação de usuário do firebase, por ora, vou deixar apenas uma navegação
                        // para lembrarmos do fluxo
                        Navigator.pushReplacementNamed(context, listaNoticiaRoute);
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.indigoAccent,
                        minimumSize: Size(double.infinity, 68),
                      ),
                      child: Text('Cadastrar'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
