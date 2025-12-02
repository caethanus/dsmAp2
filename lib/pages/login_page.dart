import 'package:flutter/material.dart';

import '../routes/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffb6bffd),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/images/logo_now_news.png',
                width: 160,
                height: 160,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 16,
                  children: [
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: 'Email',
                        fillColor: Colors.indigo,
                        filled: true,
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
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
                      onPressed: () => Navigator.pushReplacementNamed(context, listaNoticiaRoute),
                      child: Text('Login'),
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.indigoAccent,
                        minimumSize: Size(double.infinity, 68)
                      ),
                    ),
                    TextButton(onPressed: () => Navigator.pushNamed(context, cadastroRoute), child: Text("Não tem uma conta? Cadastre-se!"))
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
