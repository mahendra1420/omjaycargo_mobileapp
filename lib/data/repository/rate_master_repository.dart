import 'package:omjaycargo/data/models/country_name_model.dart';
import 'package:omjaycargo/data/models/rate_calculator_model.dart';
import '../../network/api_client.dart';
import '../../helpers/app_url.dart';

class RateMasterRepository {
  final ApiClient _apiClient = ApiClient();

  Future<CountryNameResponse> countryName({String? search,String? zoneType}) async {
    final body = {
      "zone_type": zoneType,
      "search": search,
    };

    final data = await _apiClient.post(AppUrl.countryName, body);
    return CountryNameResponse.fromJson(data);
  }

  Future<RateCalculatorResponse> rateCalculator({String? customerId,String? zoneType,String? destinationCity,String? docType,String? weight}) async {
    final body = {
      "zone_type": zoneType,
      "customer_id": customerId,
      "destination_city": destinationCity,
      "doc_type": docType,
      "weight": weight,
    };

    final data = await _apiClient.post(AppUrl.rateCalculator, body);
    return RateCalculatorResponse.fromJson(data);
  }

}
