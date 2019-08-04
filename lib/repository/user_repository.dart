import '../model/login_response.dart';
import './user_api_provider.dart';

class UserRepository {
  final _userApiProvider = UserApiProvider();

  Future<LoginResponse> login(String email, String password) =>
      _userApiProvider.login(email, password);

}
