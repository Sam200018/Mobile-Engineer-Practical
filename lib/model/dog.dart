import 'dart:convert';

class Dog {
  final String dogName;
  final String description;
  final int age;
  final String image;

  Dog({
    required this.dogName,
    required this.description,
    required this.age,
    required this.image,
  });

  Dog copyWith({
    String? dogName,
    String? description,
    int? age,
    String? image,
  }) =>
      Dog(
        dogName: dogName ?? this.dogName,
        description: description ?? this.description,
        age: age ?? this.age,
        image: image ?? this.image,
      );

  factory Dog.fromRawJson(String str) => Dog.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Dog.fromJson(Map<String, dynamic> json) => Dog(
    dogName: json["dogName"],
    description: json["description"],
    age: json["age"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "dogName": dogName,
    "description": description,
    "age": age,
    "image": image,
  };
}
