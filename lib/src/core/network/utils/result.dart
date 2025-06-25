import 'package:flutter_blueprint/src/core/network/exceptions/app_exception.dart';

class Result<S, E extends AppException> {
  const Result();
}

final class Success<S, E extends AppException> extends Result<S, E> {
  const Success(this.value);

  final S value;
}

final class Failure<S, E extends AppException> extends Result<S, E> {
  const Failure(this.exception);

  final E exception;
}

extension ResultExtension<S, E extends AppException> on Result<S, E> {
  T fold<T>(T Function(S value) onSuccess, T Function(E error) onFailure) {
    if (this is Success<S, E>) {
      return onSuccess((this as Success<S, E>).value);
    } else {
      return onFailure((this as Failure<S, E>).exception);
    }
  }
}