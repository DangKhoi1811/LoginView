import 'dart:io';
import 'package:login/model/fetch_data_exception.dart';
import 'package:login/model/login_response.dart';
import 'package:login/repository/user_repository.dart';

class LoginBloc {
  final _userRepository = UserRepository();

  Future<LoginResponse> login(String email, String password) async {
    LoginResponse result;
    try {
      result =
      await _userRepository.login(email, password);
    }on FetchDataException catch (e) {
    }finally {
      await Future.delayed(
        Duration(milliseconds: 666),
      );
    }
    return result;
  }

}
