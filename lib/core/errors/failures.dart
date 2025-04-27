import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure("Connection timeout with server.");
      case DioErrorType.sendTimeout:
        return ServerFailure("Send timeout with server.");
      case DioErrorType.receiveTimeout:
        return ServerFailure("Receive timeout with server.");
      case DioErrorType.badCertificate:
      case DioErrorType.badResponse:
        return ServerFailure("Received invalid status code: ${dioError.response?.statusCode}");
      case DioErrorType.cancel:
        return ServerFailure("Request to server was cancelled.");
      case DioErrorType.connectionError:
        return ServerFailure("Connection error occurred.");
      case DioErrorType.unknown:
      default:
        return ServerFailure("Unexpected error, please try again later.");
    }
  }
}