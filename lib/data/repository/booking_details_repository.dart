import 'package:omjaycargo/data/models/booking_details_model.dart';

import '../../network/api_client.dart';
import '../../screen/counter_booking_details.dart';
import '../models/dashboard_model.dart';
import '../models/login_model.dart';
import '../../helpers/app_url.dart';

class CounterBookingDetailsRepository {
  final ApiClient _apiClient = ApiClient();

  Future<CounterBookingDetailsModel> bookingDetails(
      String customerId, {
        String? startDate,
        String? toDate,
        String? search,
        String? pageNo,
      }) async {
    final body = {
      "customer_id": customerId,
      "start_date": startDate ?? '',
      "to_date": toDate ?? '',
      "search": search ?? '',
      "page_no": pageNo ?? '1',
    };

    final data = await _apiClient.post(AppUrl.fetchBookingDetails, body);
    return CounterBookingDetailsModel.fromJson(data);
  }
}
