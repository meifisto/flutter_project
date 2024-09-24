import 'package:dio/dio.dart';

class UserService {
  final Dio _dio;

  UserService(this._dio);

  Future<List<dynamic>> getUsers() async {
    try {
      final response = await _dio.get('/users');
      return response.data;
    } catch (e) {
      throw Exception('Failed to load users');
    }
  }

  Future<dynamic> getUser(int id) async {
    try {
      final response = await _dio.get('/users/$id');
      return response.data;
    } catch (e) {
      throw Exception('Failed to load user');
    }
  }

  // Ajoutez d'autres méthodes pour créer, mettre à jour, supprimer des utilisateurs
}
