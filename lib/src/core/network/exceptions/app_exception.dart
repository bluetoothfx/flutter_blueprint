import 'base_exception.dart';

class AppException extends BaseException {
  final int code;
  final String message;

  AppException({required this.code, this.message = ""});
}
