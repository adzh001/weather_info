import 'package:dio/dio.dart';

class CatchException {
  String? message;
  CatchException({this.message});
  static CatchException convertException(dynamic error) {
    if (error is DioError && error.error is CatchException) {
      return error.error;
    }
    if (error is DioError) {
      print(error);
      if (error.type == DioErrorType.connectTimeout) {
        print('CONNECTION_ERROR');
        return CatchException(
            message: 'Привышено время обработки запроса. Повторите позднее');
      } else if (error.type == DioErrorType.receiveTimeout) {
        print('RECIVE_ERROR');
        return CatchException(
            message: 'Привышено время обработки запроса. Повторите позднее');
      } else if (error.response == null) {
        print('NO_INTERNET');
        return CatchException(message: 'Нет интернет соеденения');
      } else if (error.response!.statusCode == 401) {
        print('401 - AUTH ERROR');
        return CatchException(message: 'Ошибка обновления токена');
      } else if (error.response!.statusCode == 409) {
        return CatchException(message: error.response!.data["message"]);
      } else {
        return CatchException(message: 'Такого города нет');
      }
    }
    if (error is CatchException) {
      return error;
    } else {
      return CatchException(message: 'Произошла системаная ошибка');
    }
  }
}
