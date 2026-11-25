import 'package:omjaycargo/data/models/credit_bill_model.dart';
import '../../network/api_client.dart';
import '../../helpers/app_url.dart';

class CreditBillRepository {
  final ApiClient _apiClient = ApiClient();

  Future<CreditBillListResponse> creditBillList(String customerId,{String? startDate,String? fromDate,String? billNo,String? pageNo}) async {
    final body = {
      "customer_id": customerId,
      "start_date": startDate,
      "from_date": fromDate,
      "bill_no": billNo,
      "page_no": pageNo,
    };

    final data = await _apiClient.post(AppUrl.creditBillList, body);
    return CreditBillListResponse.fromJson(data);
  }
}
