class RateCalculatorResponse {
  bool? result;
  String? message;
  List<RateCalculatorList>? data;

  RateCalculatorResponse({this.result, this.message, this.data});

  RateCalculatorResponse.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    if (json['data'] != null) {
      data = List<RateCalculatorList>.from(json['data'].map((v) => RateCalculatorList.fromJson(v)));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['result'] = result;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RateCalculatorList {
  String? status;
  String? message;
  int? courierCharge;
  int? podCharge;
  String? insurancePercentage;
  String? insuranceAmt;
  double? fuelSurchargePercentage;
  double? fuelSurchargeAmt;
  String? gSTType;
  int? finalWt;
  int? volumetricWt;
  int? productId;
  int? courierCompanyMinimumCharge;
  int? additional;
  int? cODCharge;
  int? customChargeTotalValue;
  int? customChargeAccordingToWtTotalValue;
  int? customChargeAccordingToSingleTime;
  String? sGSTPercentage;
  String? cGSTPercentage;
  int? iGSTPercentage;
  int? subTotal1;
  double? subTotal2;
  double? sGSTAmt;
  double? cGSTAmt;
  double? totalTax;
  int? iGSTAmt;
  int? totalBookingAmt;
  String? productName;

  RateCalculatorList({
    this.status,
    this.message,
    this.courierCharge,
    this.podCharge,
    this.insurancePercentage,
    this.insuranceAmt,
    this.fuelSurchargePercentage,
    this.fuelSurchargeAmt,
    this.gSTType,
    this.finalWt,
    this.volumetricWt,
    this.productId,
    this.courierCompanyMinimumCharge,
    this.additional,
    this.cODCharge,
    this.customChargeTotalValue,
    this.customChargeAccordingToWtTotalValue,
    this.customChargeAccordingToSingleTime,
    this.sGSTPercentage,
    this.cGSTPercentage,
    this.iGSTPercentage,
    this.subTotal1,
    this.subTotal2,
    this.sGSTAmt,
    this.cGSTAmt,
    this.totalTax,
    this.iGSTAmt,
    this.totalBookingAmt,
    this.productName,
  });

  RateCalculatorList.fromJson(Map<String, dynamic> json) {

    try{
      status = json['status'];
      message = json['message'];
      courierCharge = json['courier_charge'];
      podCharge = json['pod_charge'];
      insurancePercentage = json['insurance_percentage'];
      insuranceAmt = json['insurance_amt'];
      fuelSurchargePercentage = (json['fuel_surcharge_percentage'] != null)
          ? double.tryParse(json['fuel_surcharge_percentage'].toString())
          : 0.0;      fuelSurchargeAmt = (json['fuel_surcharge_amt'] ?? 0).toDouble();
      gSTType = json['GST_type'];
      finalWt = json['final_wt'];
      volumetricWt = json['volumetric_wt'];
      productId = json['product_id'];
      courierCompanyMinimumCharge = json['courier_company_minimum_charge'];
      additional = json['additional'];
      cODCharge = json['COD_charge'];
      customChargeTotalValue = json['custom_charge_total_value'];
      customChargeAccordingToWtTotalValue =
      json['custom_charge_according_to_wt_total_value'];
      customChargeAccordingToSingleTime =
      json['custom_charge_according_to_single_time'];
      sGSTPercentage = json['SGST_percentage'];
      cGSTPercentage = json['CGST_percentage'];
      iGSTPercentage = json['IGST_percentage'];
      subTotal1 = json['sub_total_1'];
      subTotal2 = (json['sub_total_2'] ?? 0).toDouble();
      sGSTAmt = (json['SGST_amt'] ?? 0).toDouble();
      cGSTAmt = (json['CGST_amt'] ?? 0).toDouble();
      totalTax = (json['total_tax'] ?? 0).toDouble();
      iGSTAmt = json['IGST_amt'];
      totalBookingAmt = json['total_booking_amt'];
      productName = json['product_name'];
    }catch (e, s) {
      print('❌ Error parsing Data.fromJson: $e');
      print('Stacktrace: $s');
    }


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['message'] = message;
    data['courier_charge'] = courierCharge;
    data['pod_charge'] = podCharge;
    data['insurance_percentage'] = insurancePercentage;
    data['insurance_amt'] = insuranceAmt;
    data['fuel_surcharge_percentage'] = fuelSurchargePercentage;
    data['fuel_surcharge_amt'] = fuelSurchargeAmt;
    data['GST_type'] = gSTType;
    data['final_wt'] = finalWt;
    data['volumetric_wt'] = volumetricWt;
    data['product_id'] = productId;
    data['courier_company_minimum_charge'] = courierCompanyMinimumCharge;
    data['additional'] = additional;
    data['COD_charge'] = cODCharge;
    data['custom_charge_total_value'] = customChargeTotalValue;
    data['custom_charge_according_to_wt_total_value'] =
        customChargeAccordingToWtTotalValue;
    data['custom_charge_according_to_single_time'] =
        customChargeAccordingToSingleTime;
    data['SGST_percentage'] = sGSTPercentage;
    data['CGST_percentage'] = cGSTPercentage;
    data['IGST_percentage'] = iGSTPercentage;
    data['sub_total_1'] = subTotal1;
    data['sub_total_2'] = subTotal2;
    data['SGST_amt'] = sGSTAmt;
    data['CGST_amt'] = cGSTAmt;
    data['total_tax'] = totalTax;
    data['IGST_amt'] = iGSTAmt;
    data['total_booking_amt'] = totalBookingAmt;
    data['product_name'] = productName;
    return data;
  }
}
