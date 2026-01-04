import 'package:coincap_app/models/app_config.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class HTTPService {
  final Dio dio = Dio();

  AppConfig? _appConfig;
  String? _base_url;

  HTTPService() {
    _appConfig = GetIt.instance.get<AppConfig>();
    _base_url = _appConfig!.COIN_API_BASE_URL;
  }

  Future<Response?> _get(String _path) async {
    try {
      String _url = '$_base_url$_path';
      Response response = await dio.get(_url);
      return response;
    } catch (e) {
      print("HTTPService: Error in GET request");
      print(e);
    }
  }
}
