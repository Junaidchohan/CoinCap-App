import 'package:coincap_app/models/app_config.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class HttpService {
  final Dio dio = Dio();

  AppConfig? _appConfig;
  String? _base_url;

  HttpService() {
    _appConfig = GetIt.instance.get<AppConfig>();
    _base_url = _appConfig!.COIN_API_BASE_URL;
    print(_base_url);
  }
}
