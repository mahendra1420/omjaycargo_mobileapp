import 'package:get/get.dart';
import 'package:omjaycargo/assets/app_colors.dart';
import 'package:omjaycargo/helpers/helper.dart';
import '../models/account_ledger_model.dart';
import '../repository/account_ledger_repository.dart';

class AccountLedgerController extends GetxController {
  final AccountLedgerRepository _accountLedgerRepository = AccountLedgerRepository();

  var isLoading = false.obs;
  var accountLedgerResponse = Rxn<AccountLedgerResponse>();
  var errorMessage = ''.obs;

  Future<void> accountLedger(String customerId, String toDate, String fromDate) async {
    try {
      isLoading(true);
      errorMessage('');

      final response = await _accountLedgerRepository.accountLedger(customerId, toDate, fromDate);
      accountLedgerResponse.value = response;

      if (response.result == true) {
        final url = response.data?.url;
        if (url != null && url.isNotEmpty) {
          // ✅ Delay slightly to allow loader to hide first
          await Future.delayed(const Duration(milliseconds: 500));
          Helper.openPdfUrl(Get.context!, url);
        }

        Get.snackbar(
          'Success',
          'Fetched successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.successColor.withOpacity(0.8),
          colorText: AppColors.white,
          duration: const Duration(seconds: 2),
        );
      } else {
        Get.snackbar(
          'Failed',
          response.message ?? 'Unable to fetch data',
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
