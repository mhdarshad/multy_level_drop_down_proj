import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:multy_level_drop_down/modle/cars.dart';

class CarsRepo{
  Future<Carss> readJson() async {
    final String response = await rootBundle.loadString('assets/carssjson.json');
   return Carss.fromJson(await json.decode(response));
  }
}
final cartrepo = CarsRepo();