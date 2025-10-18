import 'dart:convert';

class Noticia {
  String? title;
  String? description;
  String? url;
  String? urlToImage;

  Noticia({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
  });

  factory Noticia.fromJson(Map<String, dynamic> json) {
    return Noticia(
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
    );
  }
}
