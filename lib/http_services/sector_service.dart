import 'package:dio/dio.dart';

class SectorService {
  final Dio _dio;

  SectorService(this._dio);

  Future<List<dynamic>> getSectors() async {
    try {
      final response = await _dio.get('/sectors');
      return response.data;
    } catch (e) {
      throw Exception('Failed to load sectors');
    }
  }

  Future<dynamic> getSector(int id) async {
    try {
      final response = await _dio.get('/sectors/$id');
      return response.data;
    } catch (e) {
      throw Exception('Failed to load sector');
    }
  }

  // Ajoutez d'autres méthodes pour créer, mettre à jour, supprimer des secteurs
}
