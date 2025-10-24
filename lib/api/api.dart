import 'dart:convert';

import 'package:ap2/model/noticia.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../chave_api.dart';

class Api {
  Api();

  Future<List<Noticia>> getNoticias(String search, String endpoint, {bool top = false}) async {
    final response = await http.get(Uri.parse('https://newsapi.org/v2/$endpoint$search&apiKey=$apiKey'));

    try {
      if (response.statusCode == 200) {
        List jsonList = json.decode(response.body)['articles'];
        return jsonList.map((n) => Noticia.fromJson(n)).toList();
      }
      return [];
    } catch (e) {
      debugPrint(e.toString());
      return throw Exception('Deu ruim irmão');
    }
  }
}
