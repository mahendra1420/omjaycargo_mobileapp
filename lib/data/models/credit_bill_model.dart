class CreditBillListResponse {
  bool? result;
  String? message;
  List<Data>? data;

  CreditBillListResponse({this.result, this.message, this.data});

  CreditBillListResponse.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
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

class Data {
  int? id;
  int? customerId;
  String? customerGstNo;
  String? customerName;
  String? customerAddress;
  String? cityName;
  String? stateName;
  String? pinCode;
  int? customerCompanyId;
  int? billNo;
  String? billDate;
  String? startDate;
  String? endDate;
  int? totalProduct;
  int? totalPieces;
  double? totalWt;
  double? subTotal1;
  double? fuelSurchargeAmt;
  double? subTotal2;
  double? sGST;
  double? cGST;
  double? iGST;
  double? totalAmt;
  String? remark;
  int? billAdjusted;
  double? adjustedRemainAmt;
  int? createdBy;
  int? createdByCompanyId;
  int? updatedBy;
  int? isDelete;
  String? createdAt;
  String? updatedAt;
  int? companyId;
  String? companyName;
  String? address;
  String? area;
  String? pincode;
  String? phone1;
  String? phone2;
  String? email;
  String? logo;
  String? gSTNo;
  String? pANNo;
  String? cINNo;
  String? stempImage;
  String? pdfUrl;

  Data.fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'];
      customerId = json['customer_id'];
      customerGstNo = json['customer_gst_no'];
      customerName = json['customer_name'];
      customerAddress = json['customer_address'];
      cityName = json['city_name'];
      stateName = json['state_name'];
      pinCode = json['pin_code'];
      customerCompanyId = json['customer_company_id'];
      billNo = json['bill_no'];
      billDate = json['bill_date'];
      startDate = json['start_date'];
      endDate = json['end_date'];
      totalProduct = json['total_product'];
      totalPieces = json['total_pieces'];

      totalWt = _toDouble(json['total_wt'], 'total_wt');
      subTotal1 = _toDouble(json['sub_total_1'], 'sub_total_1');
      fuelSurchargeAmt = _toDouble(json['fuel_surcharge_amt'], 'fuel_surcharge_amt');
      subTotal2 = _toDouble(json['sub_total_2'], 'sub_total_2');
      sGST = _toDouble(json['SGST'], 'SGST');
      cGST = _toDouble(json['CGST'], 'CGST');
      iGST = _toDouble(json['IGST'], 'IGST');
      totalAmt = _toDouble(json['total_amt'], 'total_amt');
      adjustedRemainAmt = _toDouble(json['adjusted_remain_amt'], 'adjusted_remain_amt');

      remark = json['remark'];
      billAdjusted = json['bill_adjusted'];
      createdBy = json['created_by'];
      createdByCompanyId = json['created_by_company_id'];
      updatedBy = json['updated_by'];
      isDelete = json['is_delete'];
      createdAt = json['created_at'];
      updatedAt = json['updated_at'];
      companyId = json['company_id'];
      companyName = json['company_name'];
      address = json['address'];
      area = json['area'];
      pincode = json['pincode'];
      phone1 = json['phone1'];
      phone2 = json['phone2'];
      email = json['email'];
      logo = json['logo'];
      gSTNo = json['GST_no'];
      pANNo = json['PAN_no'];
      cINNo = json['CIN_no'];
      stempImage = json['stemp_image'];
      pdfUrl = json['pdf_url'];
    } catch (e, s) {
      print('❌ Error parsing Data.fromJson: $e');
      print('Stacktrace: $s');
    }
  }

  double? _toDouble(dynamic value, String field) {
    try {
      if (value == null) return null;
      if (value is double) return value;
      if (value is int) return value.toDouble();
      if (value is String) return double.tryParse(value);
      throw Exception('Unexpected type for $field: ${value.runtimeType}');
    } catch (e) {
      print('⚠️ Failed to parse field "$field" with value "$value" → $e');
      return null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['customer_id'] = customerId;
    data['customer_gst_no'] = customerGstNo;
    data['customer_name'] = customerName;
    data['customer_address'] = customerAddress;
    data['city_name'] = cityName;
    data['state_name'] = stateName;
    data['pin_code'] = pinCode;
    data['customer_company_id'] = customerCompanyId;
    data['bill_no'] = billNo;
    data['bill_date'] = billDate;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['total_product'] = totalProduct;
    data['total_pieces'] = totalPieces;
    data['total_wt'] = totalWt;
    data['sub_total_1'] = subTotal1;
    data['fuel_surcharge_amt'] = fuelSurchargeAmt;
    data['sub_total_2'] = subTotal2;
    data['SGST'] = sGST;
    data['CGST'] = cGST;
    data['IGST'] = iGST;
    data['total_amt'] = totalAmt;
    data['remark'] = remark;
    data['bill_adjusted'] = billAdjusted;
    data['adjusted_remain_amt'] = adjustedRemainAmt;
    data['created_by'] = createdBy;
    data['created_by_company_id'] = createdByCompanyId;
    data['updated_by'] = updatedBy;
    data['is_delete'] = isDelete;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['company_id'] = companyId;
    data['company_name'] = companyName;
    data['address'] = address;
    data['area'] = area;
    data['pincode'] = pincode;
    data['phone1'] = phone1;
    data['phone2'] = phone2;
    data['email'] = email;
    data['logo'] = logo;
    data['GST_no'] = gSTNo;
    data['PAN_no'] = pANNo;
    data['CIN_no'] = cINNo;
    data['stemp_image'] = stempImage;
    data['pdf_url'] = pdfUrl;
    return data;
  }
}
