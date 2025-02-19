import 'package:dogs_we_love/ui/views/home.dart';
import 'package:flutter/material.dart';

class DogsApp extends StatelessWidget {
  const DogsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dogs App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFF8F8F8),),
      ),
      home: const Home(),
    );
  }
}
