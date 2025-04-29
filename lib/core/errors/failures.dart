import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  
  factory ServerFailure.fromDioError(DioError dioError) {
  print('💥 DIO ERROR: ${dioError.toString()}');
  print('💥 DIO ERROR RESPONSE DATA: ${dioError.response?.data}');

  switch (dioError.type) {
    case DioErrorType.connectionTimeout:
    case DioErrorType.sendTimeout:
    case DioErrorType.receiveTimeout:
      return ServerFailure('Connection Timeout');
    case DioErrorType.badResponse:
      final statusCode = dioError.response?.statusCode;
      final path = dioError.requestOptions.path;
      
      if (statusCode == 400) {
        if (path.contains('login')) {
          return ServerFailure('Invalid email or password');
        } else if (path.contains('register')) {
          return ServerFailure('Email already registered.');
        }
      }

      final responseMessage = dioError.response?.data['message'] ?? 'Unexpected Error';
      return ServerFailure(responseMessage);
    case DioErrorType.cancel:
      return ServerFailure('Request Cancelled');
    case DioErrorType.connectionError:
      return ServerFailure('No Internet Connection');
    case DioErrorType.unknown:
    default:
      return ServerFailure('Unexpected Error, Please try again');
  }
}


}
