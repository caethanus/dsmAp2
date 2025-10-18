import 'package:ap2/model/noticia.dart';
import 'package:flutter/material.dart';

class NoticiaCard extends StatelessWidget {
  final Noticia noticia;

  const NoticiaCard({super.key, required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  spacing: 8,
                  children: [
                    Center(child: Image.network(noticia.urlToImage ?? '', width: 20, height: 10,)),
                    Text(noticia.title ?? '', maxLines: 1, style: TextStyle(fontSize: 20)),
                  ],
                ),
                Row(children: [Text(noticia.description ?? '', maxLines: 2, style: TextStyle(fontSize: 14)),
                FilledButton(onPressed: () {

                }, child: Text('Veja mais'))
                ]),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
