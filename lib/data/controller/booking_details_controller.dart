import 'package:get/get.dart';
import 'package:omjaycargo/assets/app_colors.dart';
import 'package:omjaycargo/data/models/booking_details_model.dart';
import 'package:omjaycargo/data/repository/booking_details_repository.dart';

class CounterBookingDetailsController extends GetxController {
  final CounterBookingDetailsRepository _repository = CounterBookingDetailsRepository();

  var isLoading = false.obs;
  var isLoadingMore = false.obs;
  var hasMoreData = true.obs;
  var pageNo = 1;
  var counterBookingDetailsResponse = Rxn<CounterBookingDetailsModel>();
  var bookingList = <BookinDetailsData>[].obs;
  var errorMessage = ''.obs;

  Future<void> bookingDetails(
      String customerId, {
        String? startDate,
        String? toDate,
        String? search,
        bool isLoadMore = false,
      }) async {
    try {
      if (isLoadMore) {
        if (isLoadingMore.value || !hasMoreData.value) return;
        isLoadingMore(true);
        pageNo++;
      } else {
        isLoading(true);
        pageNo = 1;
        bookingList.clear();
        hasMoreData(true);
      }

      final response = await _repository.bookingDetails(
        customerId,
        startDate: startDate ?? '',
        toDate: toDate ?? '',
        search: search ?? '',
        pageNo: pageNo.toString(),
      );

      if (response.result == true) {
        final newData = response.data ?? [];
        if (newData.isEmpty) {
          hasMoreData(false);
        } else {
          bookingList.addAll(newData);
        }
        counterBookingDetailsResponse.value = response;
      } else {
        hasMoreData(false);
        final msg = (response.message is List)
            ? (response.message as List).join(', ')
            : (response.message?.toString() ?? 'Unknown error');
        Get.snackbar('Failed', msg,
            backgroundColor: AppColors.errorColor.withOpacity(0.8),
            colorText: AppColors.white);
      }
    } catch (e) {
      errorMessage(e.toString());
      Get.snackbar('Error', e.toString(),
          backgroundColor: AppColors.errorColor.withOpacity(0.8),
          colorText: AppColors.white);
    } finally {
      isLoading(false);
      isLoadingMore(false);
    }
  }
}
