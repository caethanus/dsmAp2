import 'package:ap2/api/api.dart';
import 'package:ap2/model/noticia.dart';

class NoticiaController{
  final Api api;

  NoticiaController({required this.api});

  Future<List<Noticia>> buscarNoticias() async => await api.getNoticias();
}