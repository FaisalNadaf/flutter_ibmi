import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';

double calculateBMI(double height, double weight) {
  return 703 * (weight / pow(height, 2));
}

Future<double> calculateBMIAsync(Dio dio) async {
  var result = await dio.get('https://jsonkeeper.com/b/AKFA');
  var data = result.data;
  var bmi = calculateBMI(
    (data['Sergio Ramos'][0] as num).toDouble(), // Convert to double
    (data['Sergio Ramos'][1] as num).toDouble(), // Convert to double
  );
  return bmi;
}
