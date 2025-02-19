import 'package:flutter/material.dart';

class DogProfileComponent extends StatelessWidget {
  final String dogName;
  final String description;
  final int age;
  final String image;

  const DogProfileComponent({
    required this.dogName,
    required this.description,
    required this.age,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              image,
              height: 210,
              width: 125,
              fit: BoxFit.fill,
              errorBuilder: (context, object, stackTrace) {
                return const Center(child: Icon(Icons.error));
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
          SizedBox(
            width: 235,
            height: 190,
            child: Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dogName,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xFF333333),
                      ),
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF666666),
                      ),
                    ),
                    Text(
                      '${age.toString()} years',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
