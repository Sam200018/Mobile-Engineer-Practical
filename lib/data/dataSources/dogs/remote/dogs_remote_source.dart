import 'dart:convert';

import 'package:dogs_we_love/model/dog.dart';
import 'package:http/http.dart' as http;

import '../../../configs/httpsConst.dart';

class DogsRemoteSource{


  Future<List<Dog>> getDogs() async {
    final response = await http.get(dogsEndpoint);

    if(response.statusCode == 200){
      final responseBody = jsonDecode(response.body) as List;
      final dogsList = responseBody.map((e) => Dog.fromJson(e)).toList();
      return dogsList;
    }else{
      throw Exception("Error al cargar data");
    }
  }

}