import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../../app/constants/api_endpoints.dart';
import '../../../domain/entity/auth_entity.dart';
import '../auth_data_source.dart';

class AuthRemoteDataSource implements IAuthDataSource {
  final Dio _dio;

  AuthRemoteDataSource(this._dio);

  @override
  Future<void> registerCustomer(AuthEntity customer) async {
    try {
      Response response = await _dio.post(
        ApiEndpoints.register,
        data: {
          "fname": customer.fName,
          "lname": customer.lName,
          "phone": customer.phone,
          "image": customer.image,
          "email": customer.email,
          "password": customer.password,
        },
      );

      if (response.statusCode == 201) {
        return;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<AuthEntity> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<String> loginCustomer(String email, String password) async {
    try {
      Response response = await _dio.post(
        ApiEndpoints.login,
        data: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        final str = response.data['token'];
        return str;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String> uploadProfilePicture(File file) async {
    try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap(
        {
          'profilePicture': await MultipartFile.fromFile(
            file.path,
            filename: fileName,
          ),
        },
      );

      Response response = await _dio.post(
        ApiEndpoints.uploadImage,
        data: formData,
      );

      if (response.statusCode == 200) {
        // Extract the image name from the response
        final str = response.data['data'];

        return str;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}
