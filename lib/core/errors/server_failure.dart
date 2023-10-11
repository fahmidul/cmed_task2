import 'package:dio/dio.dart';
import '../utils/strings.dart';
import 'failure.dart';

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  factory ServerFailure.fromDiorError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure(AppStrings.connectionTimeout);
      case DioExceptionType.sendTimeout:
        return const ServerFailure(AppStrings.sendTimeout);
      case DioExceptionType.receiveTimeout:
        return const ServerFailure(AppStrings.receiveTimeout);
      case DioExceptionType.badCertificate:
        return const ServerFailure(AppStrings.badCertificate);
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return const ServerFailure(AppStrings.cancelServer);
      case DioExceptionType.connectionError:
        return const ServerFailure(AppStrings.connectionError);
      case DioExceptionType.unknown:
        return const ServerFailure(AppStrings.unknownError);
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return const ServerFailure(AppStrings.notFoundError);
    } else if (statusCode == 500) {
      return const ServerFailure(AppStrings.serverError);
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return const ServerFailure(AppStrings.serverError);
    } else {
      return const ServerFailure(AppStrings.unknownError);
    }
  }
}
