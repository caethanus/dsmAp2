import 'package:ap2/api/api.dart';
import 'package:ap2/model/noticia.dart';
import 'package:flutter/cupertino.dart';

class NoticiaController {
  final Api api;

  NoticiaController({required this.api});

  Future<List<Noticia>> buscarNoticias(String pesquisa, String endpoint, {bool top = false}) async =>
      await api.getNoticias(pesquisa, endpoint);
}
