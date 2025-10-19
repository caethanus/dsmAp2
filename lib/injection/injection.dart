import 'package:ap2/api/api.dart';
import 'package:ap2/chave_api.dart';
import 'package:ap2/controller/noticia_controller.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
const search = 'bitcoin';

const baseUrl = 'https://newsapi.org/v2/everything?q=$search&apiKey=$apiKey';

void mainModule() {
  noticiaModule();
}

void noticiaModule() {
  getIt.registerLazySingleton<Api>(() => Api(search: search, baseUrl: baseUrl));
  getIt.registerLazySingleton<NoticiaController>(() => NoticiaController(api: getIt<Api>()));
}
