import 'package:dogs_we_love/data/configs/database_service.dart';
import 'package:dogs_we_love/data/dataSources/dogs/local/dogs_local_source.dart';
import 'package:dogs_we_love/data/dataSources/dogs/remote/dogs_remote_source.dart';
import 'package:dogs_we_love/data/repositories/dogsRepository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServices() {
  getIt.registerSingleton<DatabaseService>(DatabaseService());
  getIt.registerSingleton<DogsRemoteSource>(DogsRemoteSource());
  getIt.registerSingleton<DogsLocalSource>(
    DogsLocalSource(dbService: getIt.get<DatabaseService>()),
  );

  getIt.registerSingleton<DogsRepository>(
    DogsRepository(
      dogsLocalSource: getIt.get<DogsLocalSource>(),
      dogsRemoteSource: getIt.get<DogsRemoteSource>(),
    ),
  );
}
