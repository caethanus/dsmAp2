import 'dart:convert';

import 'package:ap2/model/noticia.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  final String baseUrl;

  final String search;

  Api({required this.search, required this.baseUrl});

  Future<List<Noticia>> getNoticias() async {
    final response = await http.get(Uri.parse(baseUrl));

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
