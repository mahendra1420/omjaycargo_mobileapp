import 'dart:convert';
import 'package:omjaycargo/data/models/account_ledger_model.dart';
import '../../network/api_client.dart';
import '../../helpers/app_url.dart';

class AccountLedgerRepository {
  final ApiClient _apiClient = ApiClient();

  Future<AccountLedgerResponse> accountLedger(String customerId, String toDate, String fromDate) async {
    final body = {
      "customer_id": customerId,
      "to_date": toDate,
      "from_date": fromDate
    };

    final response = await _apiClient.post(AppUrl.accountLedger, body);

    // ✅ Some APIs return a string — handle that safely
    if (response is String) {
      try {
        final decoded = jsonDecode(response);
        return AccountLedgerResponse.fromJson(decoded);
      } catch (e) {
        throw Exception("Invalid JSON response: $response");
      }
    } else if (response is Map<String, dynamic>) {
      return AccountLedgerResponse.fromJson(response);
    } else {
      throw Exception("Unexpected response type: ${response.runtimeType}");
    }
  }
}
