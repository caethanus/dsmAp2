import 'package:ap2/controller/noticia_controller.dart';
import 'package:ap2/injection/injection.dart';
import 'package:ap2/model/noticia.dart';
import 'package:ap2/widgets/noticia_card.dart';
import 'package:flutter/material.dart';

import '../api/api.dart';

class ListaPage extends StatefulWidget {
  const ListaPage({super.key});

  @override
  State<ListaPage> createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  bool pesquisando = false;
  bool mostrandoNoticiasEmAlta = true;

  final TextEditingController _searchController = TextEditingController();

  final controller = getIt.get<NoticiaController>();

  String pesquisa = 'country=us';

  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void retornaTopNoticias() async {
    final topNoticias = await controller.buscarNoticias(pesquisa, 'top-headlines?');
    setState(() {
      mostrandoNoticiasEmAlta = true;
      lista = topNoticias;
    });
  }

  void retornaLista() async {
    final noticias = await controller.buscarNoticias(pesquisa, 'everything?q=');
    setState(() {
      mostrandoNoticiasEmAlta = false;
      lista = noticias;
    });
  }

  void _togglePesquisa() async {
    final estavaPesquisando = pesquisando;
    setState(() {
      pesquisando = !pesquisando;
      if (!pesquisando) {
        _searchController.clear();
        pesquisa = 'country=us';
        mostrandoNoticiasEmAlta = true;
      }
    });
    if (estavaPesquisando && !pesquisando) {
      retornaTopNoticias();
    }
  }

  List<Noticia> lista = [];

  @override
  void initState() {
    super.initState();
    retornaTopNoticias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: pesquisando
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: InputDecoration(hintText: 'Pesquisar...', border: InputBorder.none),
                onSubmitted: (texto) async {
                  pesquisa = texto.trim();
                  retornaLista();
                },
              )
            : const Text('Now News!'),
        actions: [
          IconButton(
            icon: Icon(pesquisando ? Icons.close : Icons.search),
            onPressed: () {
              _togglePesquisa();
            },
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          children: [
            Text(
              mostrandoNoticiasEmAlta ? 'Top notícias em alta!' : 'Notícias para: $pesquisa',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) => Column(children: [NoticiaCard(noticia: lista[index])]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
