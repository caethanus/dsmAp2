import 'package:ap2/controller/noticia_controller.dart';
import 'package:ap2/injection/injection.dart';
import 'package:ap2/model/noticia.dart';
import 'package:ap2/widgets/noticia_card.dart';
import 'package:flutter/material.dart';

import '../api/api.dart';

class ListaPage extends StatefulWidget {
  const ListaPage({super.key});
  final corpo = true;

  @override
  State<ListaPage> createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  bool pesquisando = false;
  final TextEditingController _searchController = TextEditingController();

  final controller = getIt.get<NoticiaController>();

  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
      appBar: AppBar(
        title: pesquisando
            ? TextField(
          controller: _searchController,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Pesquisar...',
            border: InputBorder.none,
          ),
          onSubmitted: (texto) async {
            search = texto.trim();

            // Atualiza instância da API com novo search
            getIt.unregister<Api>();
            getIt.registerLazySingleton<Api>(() => Api(
              search: search,
              baseUrl: baseUrl(search),
            ));

            // Recria controller dependente da Api
            getIt.unregister<NoticiaController>();
            getIt.registerLazySingleton<NoticiaController>(
                    () => NoticiaController(api: getIt<Api>()));

            // Busca a nova lista com o termo digitado
            final noticias = await getIt<NoticiaController>().buscarNoticias();
            setState(() {
              lista = noticias;
              pesquisando = false;
              _searchController.clear();
            });
          },
        )
            : const Text('Now News!'),
        actions: [
          IconButton(
            icon: Icon(pesquisando ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                pesquisando = !pesquisando;
                if (!pesquisando) {
                  _searchController.clear();
                }
              });
            },
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          children: [
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
