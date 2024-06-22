import 'dart:convert';
import 'package:flutter/services.dart';

class ApiService {
  Future<Map<String, dynamic>> get() async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/json/dummyData.json');
      final data = jsonDecode(jsonString);
      print(data);
      return data;
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
