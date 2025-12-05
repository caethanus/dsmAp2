import 'package:ap2/injection/injection.dart';
import 'package:ap2/pages/cadastro_page.dart';
import 'package:ap2/pages/lista_page.dart';
import 'package:ap2/pages/login_page.dart';
import 'package:ap2/routes/routes.dart';
import 'package:ap2/widgets/noticia_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  mainModule();

  runApp(MaterialApp(
    routes: {
      listaNoticiaRoute: (context) => ListaPage(),
      loginRoute: (context) => LoginPage(),
      cadastroRoute: (context) => CadastroPage(),
    },
    debugShowCheckedModeBanner: false,
    home: LoginPage()));
}
