import 'package:dio/dio.dart';

abstract class Failure {
  final String errMsg;
  const Failure(this.errMsg);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMsg);
  factory ServerFailure.fromDioError(DioException dioerror) {
    switch (dioerror.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with apiserver');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with apiserver');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with apiserver');
      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate with apiserver');
      case DioExceptionType.badResponse:
        return ServerFailure.fromRespose(
            dioerror.response!.statusCode, dioerror.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(' Request to api has been canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('No internet Connection');
      case DioExceptionType.unknown:
        if (dioerror.message!.contains('SocketException')) {
          return ServerFailure('No internet connection');
        }
        return ServerFailure('Unexpected Error , try again');
      //  default:
      //  ServerFailure('Opps There was an error , try again!');
    }
  }
  factory ServerFailure.fromRespose(int? StatusCode, dynamic respose) {
    if (StatusCode == 400 ||
        StatusCode == 401 ||
        StatusCode == 403 ||
        StatusCode == 405 ||
        StatusCode == 422) {
      return ServerFailure(respose.toString());
    } else if (StatusCode == 404) {
      return ServerFailure('Not Found');
    } else if (StatusCode == 500) {
      return ServerFailure('Server Error,try later');
    } else {
      return ServerFailure(respose.toString());
    }
  }
}
