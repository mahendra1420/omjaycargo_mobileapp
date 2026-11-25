import 'package:get/get.dart';
import 'package:omjaycargo/assets/app_colors.dart';
import '../models/login_model.dart';
import '../repository/user_repository.dart';
import '../../helpers/screen_constant.dart';
import '../shared_preference.dart';

class UserController extends GetxController {
  final UserRepository _repository = UserRepository();

  var isLoading = false.obs;
  var loginResponse = Rxn<LoginResponse>();
  var errorMessage = ''.obs;

  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter email and password',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.errorColor.withOpacity(0.8),
        colorText: AppColors.white,
      );
      return;
    }

    try {
      isLoading(true);
      errorMessage('');
      final response = await _repository.loginUser(email, password);
      loginResponse.value = response;

      final msg = (response.message is List)
          ? (response.message as List).join(', ')
          : (response.message?.toString() ?? '');

      if (response.result == true) {
        final userData = response.data;

        if (userData != null) {
          PreferenceManager.setIsUserLoggedIn(true);
          PreferenceManager.setUserId(userData.id ?? 0);
          PreferenceManager.setFirstName(userData.customerName ?? '');
          PreferenceManager.setEmail(userData.email ?? '');
          PreferenceManager.setPhoneNumber(userData.mobileNo ?? '');
          PreferenceManager.setAccessToken(userData.token ?? '');
          PreferenceManager.setAgentCode(userData.accountCode?? '');

        }
        print('UserId: ${await PreferenceManager.getUserId()}');
        print('Name: ${await PreferenceManager.getFirstName()}');
        print('Email: ${await PreferenceManager.getEmail()}');
        print('Phone: ${await PreferenceManager.getPhoneNumber()}');
        print('token: ${await PreferenceManager.getAccessToken()}');

        Get.snackbar(
          'Success',
          msg.isNotEmpty ? msg : 'Login successful',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.successColor.withOpacity(0.8),
          colorText: AppColors.white,
          duration: const Duration(seconds: 2),
        );

        Get.offAllNamed(AppScreen.dashboard);
      } else {
        Get.snackbar(
          'Login Failed',
          msg.isNotEmpty ? msg : 'Invalid credentials',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.errorColor.withOpacity(0.8),
          colorText: AppColors.white,
        );
      }
    } catch (e) {
      errorMessage(e.toString());
      Get.snackbar(
        'Error',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.errorColor.withOpacity(0.8),
        colorText: AppColors.white,
      );
    } finally {
      isLoading(false);
    }
  }
}
