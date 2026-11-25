import 'package:get/get.dart';
import 'package:omjaycargo/assets/app_colors.dart';
import 'package:omjaycargo/data/models/dashboard_model.dart';
import 'package:omjaycargo/data/repository/dashboard_repository.dart';
import '../../helpers/screen_constant.dart';

class DashboardController extends GetxController {
  final DashboardRepository _dashboardRepository = DashboardRepository();

  var isLoading = false.obs;
  var dashBoardResponse = Rxn<DashboardResponse>();
  var errorMessage = ''.obs;

  Future<void> dashboard(String customerId) async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await _dashboardRepository.dashboard(customerId);
      dashBoardResponse.value = response;

      // ✅ Normalize message type
      final msg = (response.message is List)
          ? (response.message as List).join(', ')
          : (response.message?.toString() ?? '');

      if (response.result == true) {
        Get.snackbar(
          'Success',
          msg.isNotEmpty ? msg : 'Login successful',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.successColor.withOpacity(0.8),
          colorText: AppColors.white,
          duration: const Duration(seconds: 2),
        );

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
