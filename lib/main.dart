import 'package:ap2/injection/injection.dart';
import 'package:ap2/pages/lista_page.dart';
import 'package:ap2/widgets/noticia_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  mainModule();

  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: ListaPage()));
}
