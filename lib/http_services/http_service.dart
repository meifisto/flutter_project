import 'package:dio/dio.dart';
import 'user_service.dart';
import 'sector_service.dart';
import 'utils_service.dart';

class HttpService {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.example.com/', // Remplacez par votre URL de base
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 3000),
    ),
  );

  static final UserService userService = UserService(dio);
  static final SectorService sectorService = SectorService(dio);
  static final UtilsService utilsService = UtilsService();
}
