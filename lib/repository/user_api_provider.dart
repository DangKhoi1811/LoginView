import 'dart:io';
import 'package:dio/dio.dart';
import '../constant/constant.dart';
import '../model/login_response.dart';
import '../model/fetch_data_exception.dart';

class UserApiProvider {
  final Dio _dio = Dio(BaseOptions(
      baseUrl: BaseUrl,
      connectTimeout: 15000,
      receiveTimeout: 15000,
      contentType: ContentType.json));

  Future<LoginResponse> login(String email, String password) async {
    Map<String, dynamic> params = {"email": email, "password": password};
    try {
      Response response = await _dio.post("/v2/users/login", data: params);
      return LoginResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      throw FetchDataException("Exception occured: $error ");
    }
  }

}
