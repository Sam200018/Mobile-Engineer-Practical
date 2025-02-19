import 'package:dogs_we_love/model/dog.dart';
import 'package:dogs_we_love/ui/components/dog_profile_component.dart';
import 'package:flutter/material.dart';

class DogsComponent extends StatelessWidget {
  final List<Dog> dogsList;

  const DogsComponent({super.key, required this.dogsList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dogsList.length,
      itemBuilder: (context, index) {
        final item = dogsList[index];

        return DogProfileComponent(
          dogName: item.dogName,
          description: item.description,
          age: item.age,
          image: item.image,
        );
      },
    );
  }
}
