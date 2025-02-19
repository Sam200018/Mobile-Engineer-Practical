import 'package:flutter/material.dart';

class ErrorComponent extends StatelessWidget {
  final String message;
  const ErrorComponent({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Error: $message"),);
  }
}
