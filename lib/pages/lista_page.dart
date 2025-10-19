import 'package:ap2/controller/noticia_controller.dart';
import 'package:ap2/injection/injection.dart';
import 'package:ap2/model/noticia.dart';
import 'package:ap2/widgets/noticia_card.dart';
import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  const ListaPage({super.key});

  @override
  State<ListaPage> createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  final controller = getIt.get<NoticiaController>();

  void retornaLista() async {
    final noticias = await controller.buscarNoticias();
    setState(() {
      lista = noticias;
    });
  }

  List<Noticia> lista = [];

  @override
  void initState() {
    super.initState();
    retornaLista();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notícias !!!!!')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => Column(children: [NoticiaCard(noticia: lista[index])]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
