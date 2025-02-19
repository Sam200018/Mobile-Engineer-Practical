import 'package:dogs_we_love/data/repositories/dogsRepository.dart';
import 'package:dogs_we_love/ui/blocs/dogs/dogs_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupBlocs() {
  getIt.registerFactory<DogsBloc>(
    () => DogsBloc(dogsRepository: getIt.get<DogsRepository>())
  );
}
