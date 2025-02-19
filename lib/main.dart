import 'package:dogs_we_love/di/setupBlocs.dart';
import 'package:dogs_we_love/dogsApp.dart';
import 'package:flutter/material.dart';

import 'di/setupServices.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServices();
  setupBlocs();

  runApp(const DogsApp());
}



