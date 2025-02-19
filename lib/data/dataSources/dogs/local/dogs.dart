import 'package:dogs_we_love/data/configs/database_service.dart';

import '../../../../model/dog.dart';

class DogsLocalSource {
  final DatabaseService dbService;

  const DogsLocalSource({required this.dbService});

  Future<List<Dog>?> getDogsInfo() async {
    final data = await dbService.selectAllDogs();
    if (data != null) {
      final dogsList =
          data
              .map(
                (e) => Dog(
                  dogName: e["dogName"],
                  description: e["description"],
                  age: e["age"],
                  image: e["image"],
                ),
              )
              .toList();
      return dogsList;
    }
    return null;
  }

  Future insertDogs(List<Dog> dogsList) async {


  }
}
