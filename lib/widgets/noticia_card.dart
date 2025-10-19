import 'package:ap2/model/noticia.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticiaCard extends StatelessWidget {
  final Noticia noticia;
  static const String imageNotFound =
      "https://ih1.redbubble.net/image.4905811447.8675/raf,360x360,075,t,fafafa:ca443f4786.jpg";

  const NoticiaCard({super.key, required this.noticia});

  @override
  Widget build(BuildContext context) {
    const String url404 = 'https://google.com/404';
    final Uri _url = Uri.parse(noticia.url ?? url404);

    Future<void> _launchUrl() async {
      if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch $_url');
      }
    }

    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 8,
              children: [
                Image.network(noticia.urlToImage ?? imageNotFound),
                Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      noticia.title ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(noticia.description ?? '', maxLines: 5, overflow: TextOverflow.ellipsis),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FilledButton(
                      onPressed: () {
                        _launchUrl();
                      },
                      child: Text('Saiba mais'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
