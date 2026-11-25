import 'package:get/get.dart';
import 'package:omjaycargo/assets/app_colors.dart';
import 'package:omjaycargo/data/models/service_availbility_model.dart';
import 'package:omjaycargo/data/repository/service_availbility_repository.dart';

class ServiceAvailbilityController extends GetxController {
  final ServiceAvailbilityRepository _serviceAvailbilityRepository = ServiceAvailbilityRepository();

  var isLoading = false.obs;
  var serviceAvailbilityResponse = Rxn<ServiceAvailbilityResponse>();
  var errorMessage = ''.obs;

  Future<void> serviceAvailbility(String customerId,String pinCode) async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await _serviceAvailbilityRepository.serviceAvailbility(customerId,pinCode);
      serviceAvailbilityResponse.value = response;

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
