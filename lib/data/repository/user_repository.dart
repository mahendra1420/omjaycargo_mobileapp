import '../../network/api_client.dart';
import '../models/login_model.dart';
import '../../helpers/app_url.dart';

class UserRepository {
  final ApiClient _apiClient = ApiClient();

  Future<LoginResponse> loginUser(String email, String password) async {
    final body = {
      "email": email,
      "password": password,
    };

    final data = await _apiClient.post(AppUrl.login, body);
    return LoginResponse.fromJson(data);
  }
}
