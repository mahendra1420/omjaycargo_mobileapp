import 'package:omjaycargo/data/models/credit_bill_model.dart';
import 'package:omjaycargo/data/models/service_availbility_model.dart';
import '../../network/api_client.dart';
import '../../helpers/app_url.dart';

class ServiceAvailbilityRepository {
  final ApiClient _apiClient = ApiClient();

  Future<ServiceAvailbilityResponse> serviceAvailbility(String customerId,String? pinCode) async {
    final body = {
      "customer_id": customerId,
      "pincode": pinCode,
    };
    final data = await _apiClient.post(AppUrl.servicesAvailability, body);
    return ServiceAvailbilityResponse.fromJson(data);
  }
}
