import '../../network/api_client.dart';
import '../models/dashboard_model.dart';
import '../models/login_model.dart';
import '../../helpers/app_url.dart';

class DashboardRepository {
  final ApiClient _apiClient = ApiClient();

  Future<DashboardResponse> dashboard(String customerId) async {
    final body = {
      "customer_id": customerId,
    };

    final data = await _apiClient.post(AppUrl.dashBoard, body);
    return DashboardResponse.fromJson(data);
  }
}
