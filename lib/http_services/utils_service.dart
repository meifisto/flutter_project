import 'package:dio/dio.dart';

class UtilsService {
  final dio = Dio();

  UtilsService();

  Future<List<dynamic>> getCountries() async {
    try {
      final response = await dio.get("https://restcountries.com/v3.1/all");
      return response.data;
    } catch (e) {
      throw Exception('Failed to load sectors');
    }
  }
}
