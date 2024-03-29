import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/generated/locale_keys.g.dart';
import 'package:mi_learning/services/rest_api/api.dart';
import 'package:mi_learning/services/rest_api/models/base_error.dart';

abstract class BaseApi extends Api {
  Failure mapExceptionToFailure(Object exception) {
    String? message;

    if (exception is DioError) {
      message = _dioErrorHandler(exception);
    } else if (exception is Exception) {
      message = exception.toString();
    }
    print('API error: $message');
    return Failure(message: message);
  }

  String? _dioErrorHandler(DioError exception) {
    String? message;
    switch (exception.type) {
      case DioErrorType.connectTimeout:
        break;
      case DioErrorType.sendTimeout:
        break;
      case DioErrorType.receiveTimeout:
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        message = exception.message;
        break;

      case DioErrorType.response:
        {
          if (exception.response?.data == null) {
            if (exception.response?.statusCode != null) {
              message = _handlingErrorOnStatusCode(exception);
            }
          } else {
            try {
              if (exception.response?.data is String) {
                message = exception.response?.data;
              } else {
                final Map<String, dynamic> payload = exception.response?.data;

                final error = BaseError.fromMap(payload);

                message = error.message;
              }
            } on Object {
              // On parse error
              // Do nothing
              message = tr(LocaleKeys.common_default_error);
            }
          }
        }
    }

    return message;
  }

  String? _handlingErrorOnStatusCode(DioError exception) {
    String? message;
    if (exception.response?.statusCode == 401) {
      message = tr(LocaleKeys.common);
    } else if (exception.response?.statusCode == 404) {
      message = tr(LocaleKeys.common);
    } else if (exception.response?.statusCode == 400) {
      print(exception.response);
      message = exception.response?.data?.toString();
    }

    return message;
  }
}
