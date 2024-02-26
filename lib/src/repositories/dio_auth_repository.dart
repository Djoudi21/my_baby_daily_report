import 'package:dio/dio.dart';
import '../models/auth/register_response_data.dart';
import '../models/auth/register_response_data_error.dart';
import '../repositories/interfaces/auth_repository.dart';
import '../utils/constants.dart';
import '../models/auth/login_response_data.dart';
import '../models/auth/login_response_data_error.dart';
import 'package:fpdart/fpdart.dart';

final dio = Dio();

class DioAuthRepository implements AuthRepository {
  @override
  Future<Either<LoginResponseDataError, LoginResponseData>> login(
      email, password) async {
    final data = {
      'data': {
        'email': email,
        'password': password,
      }
    };
    var url = '${ApiConstants.baseUrl!}/${ApiConstants.loginEndpoint!}';
    try {
      final response = await dio.post(url, data: data);
      // Parse the response data into a LoginResponse object
      return right(LoginResponseData.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          var responseData = e.response!.data;
          if (responseData is Map<String, dynamic>) {
            // Check if the error response contains the expected keys
            final int? status = responseData['status'];
            final String? message = responseData['message'];
            if (status != null && message != null) {
              // Construct and return Left with LoginResponseDataError
              return left(LoginResponseDataError(
                  responseData['status'], responseData['message']));
            }
          }
        }
      }
      // Return a Left with a default error in case of unexpected errors
      return left(LoginResponseDataError(-1, 'Unknown error occurred'));
    }
  }

  @override
  Future<Either<RegisterResponseDataError, RegisterResponseData>> register(
      String email, String password) async {
    final data = {
      'data': {
        'email': email,
        'password': password,
      }
    };
    var url = '${ApiConstants.baseUrl!}/${ApiConstants.registerEndpoint!}';
    try {
      final response = await dio.post(url, data: data);
      // Parse the response data into a LoginResponse object
      return right(RegisterResponseData.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          var responseData = e.response!.data;
          if (responseData is Map<String, dynamic>) {
            // Check if the error response contains the expected keys
            final int? status = responseData['status'];
            final String? message = responseData['message'];
            if (status != null && message != null) {
              // Construct and return Left with LoginResponseDataError
              return left(RegisterResponseDataError(
                  responseData['status'], responseData['message']));
            }
          }
        }
      }
      // Return a Left with a default error in case of unexpected errors
      return left(RegisterResponseDataError(-1, 'Unknown error occurred'));
    }
  }
}
