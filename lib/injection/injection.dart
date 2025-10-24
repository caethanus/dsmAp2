import 'package:ap2/api/api.dart';
import 'package:ap2/chave_api.dart';
import 'package:ap2/controller/noticia_controller.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void mainModule() {
  noticiaModule();
}

void noticiaModule() {
  // Remove instâncias antigas antes de registrar de novo
  if (getIt.isRegistered<Api>()) {
    getIt.unregister<Api>();
  }
  if (getIt.isRegistered<NoticiaController>()) {
    getIt.unregister<NoticiaController>();
  }

  // Registra de novo com o valor atualizado
  getIt.registerLazySingleton<Api>(() => Api());

  getIt.registerLazySingleton<NoticiaController>(() => NoticiaController(api: getIt<Api>()));
}
