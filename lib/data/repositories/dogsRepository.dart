import 'package:dogs_we_love/model/dog.dart';

import '../dataSources/dogs/local/dogs_local_source.dart';
import '../dataSources/dogs/remote/dogs_remote_source.dart';

class DogsRepository {
  final DogsLocalSource dogsLocalSource;
  final DogsRemoteSource dogsRemoteSource;

  DogsRepository({
    required this.dogsLocalSource,
    required this.dogsRemoteSource,
  });

  Future<List<Dog>> loadDogsInfo() async {
    try {
      var dogsList = await dogsLocalSource.getDogsInfo();
      if (dogsList.isNotEmpty) {
        return dogsList;
      } else {
        dogsList = await dogsRemoteSource.getDogs();
        dogsLocalSource.insertDogs(dogsList);
        return dogsList;
      }
    } catch (e) {
      rethrow;
    }
  }
}
