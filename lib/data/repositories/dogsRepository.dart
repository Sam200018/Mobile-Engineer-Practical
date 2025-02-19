import 'package:dogs_we_love/model/dog.dart';

import '../dataSources/dogs/local/dogs.dart';
import '../dataSources/dogs/remote/dogs.dart';

class DogsRepository {
  final DogsLocalSource dogsLocalSource;
  final DogsRemoteSource dogsRemoteSource;

  DogsRepository({
    required this.dogsLocalSource,
    required this.dogsRemoteSource,
  });

  Future<List<Dog>?> loadDogsInfo() async {
    try {
      var dogsList = await dogsLocalSource.getDogsInfo();
      if (dogsList != null && dogsList.isNotEmpty) {
        return dogsList;
      } else {
        dogsList = await dogsRemoteSource.getDogs();
        dogsLocalSource.insertDogs(dogsList!);
        return dogsList;
      }
    } catch (e) {
        print("Error: $e");
      rethrow;
    }
  }
}
