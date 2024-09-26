import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';

double calculateBMI(double height, double weight) {
  return 703 * (weight / pow(height, 2));
}

Future<double> calculateBMIAsync(Dio _dio) async {
  var _result = await _dio.get('https://jsonkeeper.com/b/AKFA');
  var _data = _result.data;
  var _bmi = calculateBMI(
    (_data['Sergio Ramos'][0] as num).toDouble(), // Convert to double
    (_data['Sergio Ramos'][1] as num).toDouble(), // Convert to double
  );
  return _bmi;
}
