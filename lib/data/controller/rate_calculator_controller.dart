import 'package:get/get.dart';
import 'package:omjaycargo/assets/app_colors.dart';
import 'package:omjaycargo/data/models/country_name_model.dart';
import 'package:omjaycargo/data/models/credit_bill_model.dart';
import 'package:omjaycargo/data/models/dashboard_model.dart';
import 'package:omjaycargo/data/models/rate_calculator_model.dart';
import 'package:omjaycargo/data/repository/credit_bill_repository.dart';
import 'package:omjaycargo/data/repository/dashboard_repository.dart';
import 'package:omjaycargo/data/repository/rate_master_repository.dart';
import '../../helpers/screen_constant.dart';


class RateMasterController extends GetxController {
  final RateMasterRepository _rateMasterRepository = RateMasterRepository();

  var isLoading = false.obs;
  var countryNameResponse = Rxn<CountryNameResponse>();
  var rateCalculatorResponse = Rxn<RateCalculatorResponse>();
  var errorMessage = ''.obs;

  Future<void> countryName(String search,String zoneType) async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await _rateMasterRepository.countryName(search: search,zoneType: zoneType);
      countryNameResponse.value = response;

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
  Future<void> rateCalculator(String search,String zoneType,String customerId,String docType,String weight) async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await _rateMasterRepository.rateCalculator(destinationCity: search,zoneType: zoneType,customerId:customerId ,docType: docType,weight: weight);
      rateCalculatorResponse.value = response;

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
