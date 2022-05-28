import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:mi_learning/config/local_keys.dart';
import 'package:mi_learning/services/local/local_store.dart';

class JWTInterceptor extends Interceptor {
  final LocalStore _store = LocalStore.instance;
  final Logger _logger = Logger();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = _store.get<String>(LocalStoreKeys.accessToken);

    if (token == null) {
      // TODO no token found
    } else {
      options.headers.putIfAbsent('Authorization', () => 'Bearer ' + token);
    }

    super.onRequest(options, handler);
  }
}
