import 'package:ap2/pages/lista_page.dart';
import 'package:ap2/utils/results.dart';
import 'package:flutter/material.dart';

import '../routes/routes.dart';
import '../services/firebase/auth/firebaseAuth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String errorMessage = "";
  bool triedLogin = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffb6bffd),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 75),
              Image.asset('assets/images/logo_now_news.png', width: 160, height: 160),
              SizedBox(height: 150),
              StreamBuilder<Results>(
                stream: widget._auth.resultsLogin,
                builder: (context, snapshot) {
                  ErrorResult result = ErrorResult(code: "");

                  if (snapshot.data is ErrorResult) {
                    result = snapshot.data as ErrorResult;
                    errorMessage = result.code;
                  }

                  if (snapshot.data is LoadingResult) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.data is SuccessResult) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => ListaPage()),
                      );
                    });
                  }

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          spacing: 16,
                          children: [
                            TextField(
                              controller: widget._emailController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.white),
                                hintText: 'Email',
                                fillColor: Colors.indigo,
                                filled: true,
                                errorText: triedLogin && widget._emailController.text.isEmpty
                                    ? "O email não pode estar vazio"
                                    : null,
                              ),
                            ),
                            TextField(
                              controller: widget._passwordController,
                              obscureText: true,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.white),
                                hintText: 'Senha',
                                fillColor: Colors.indigo,
                                filled: true,
                                errorText: triedLogin && widget._passwordController.text.isEmpty
                                    ? "A senha não pode estar vazia"
                                    : null,
                              ),
                            ),
                            if (errorMessage.isNotEmpty && triedLogin)
                              Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  errorMessage,
                                  style: TextStyle(color: Colors.redAccent, fontSize: 14),
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
                                setState(() => triedLogin = true);

                                if (widget._emailController.text.isEmpty ||
                                    widget._passwordController.text.isEmpty) {
                                  return;
                                }

                                widget._auth.signIn(
                                  widget._emailController.text,
                                  widget._passwordController.text,
                                );
                              },
                              style: FilledButton.styleFrom(
                                backgroundColor: Colors.indigoAccent,
                                minimumSize: Size(double.infinity, 68),
                              ),
                              child: Text('Login'),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pushReplacementNamed(context, cadastroRoute),
                              child: Text("Não tem uma conta? Cadastre-se!"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
