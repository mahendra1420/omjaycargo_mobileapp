class CounterBookingDetailsModel {
  List<BookinDetailsData>? data;
  bool? result;
  String? message;

  CounterBookingDetailsModel({this.data, this.result, this.message});

  CounterBookingDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <BookinDetailsData>[];
      json['data'].forEach((v) {
        data!.add(new BookinDetailsData.fromJson(v));
      });
    }
    result = json['result'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['result'] = this.result;
    data['message'] = this.message;
    return data;
  }
}

class BookinDetailsData {
  int? id;
  int? customerId;
  String? customerName;
  String? productName;
  String? destinationCity;
  String? destinationPincode;
  String? zoneType;
  int? productId;
  String? docType;
  String? barcodeNo;
  String? bookingDate;
  String? referenceNo;
  double? finalWt;
  double? weight;
  int? volumetricWt;
  int? hight;
  int? length;
  int? width;
  int? additional;
  int? pieces;
  String? paymentType;
  String? bankName;
  String? senderName;
  String? senderAddress;
  String? receiverName;
  String? receiverAddress;
  String? receiverCity;
  String? receiverPincode;
  String? receiverMobileNo;
  String? isCod;
  int? amt;
  int? isCodAdjusted;
  String? remark;
  String? sku;
  int? quantityPurchased;
  double? taxMode;
  int? declareValue;
  int? courierCharge;
  int? podCharge;
  int? cODCharge;
  String? insurancePercentage;
  int? insuranceAmt;
  int? subTotal1;
  int? fuelSurchargePercentage;
  double? fuelSurchargeAmt;
  double? subTotal2;
  String? sGSTPercentage;
  double? sGSTAmt;
  String? cGSTPercentage;
  double? cGSTAmt;
  String? iGSTPercentage;
  int? iGSTAmt;
  int? totalTax;
  int? totalBookingAmt;
  String? autoPrintWithSave;
  String? printWt;
  String? printAmount;
  String? billGenerate;
  String? pickupStatus;
  String? pickupDate;
  int? companyId;
  String? bookedBy;
  String? pdfUrl;

  BookinDetailsData(
      {this.id,
        this.customerId,
        this.customerName,
        this.productName,
        this.destinationCity,
        this.destinationPincode,
        this.zoneType,
        this.productId,
        this.docType,
        this.barcodeNo,
        this.bookingDate,
        this.referenceNo,
        this.finalWt,
        this.weight,
        this.volumetricWt,
        this.hight,
        this.length,
        this.width,
        this.additional,
        this.pieces,
        this.paymentType,
        this.bankName,
        this.senderName,
        this.senderAddress,
        this.receiverName,
        this.receiverAddress,
        this.receiverCity,
        this.receiverPincode,
        this.receiverMobileNo,
        this.isCod,
        this.amt,
        this.isCodAdjusted,
        this.remark,
        this.sku,
        this.quantityPurchased,
        this.taxMode,
        this.declareValue,
        this.courierCharge,
        this.podCharge,
        this.cODCharge,
        this.insurancePercentage,
        this.insuranceAmt,
        this.subTotal1,
        this.fuelSurchargePercentage,
        this.fuelSurchargeAmt,
        this.subTotal2,
        this.sGSTPercentage,
        this.sGSTAmt,
        this.cGSTPercentage,
        this.cGSTAmt,
        this.iGSTPercentage,
        this.iGSTAmt,
        this.totalTax,
        this.totalBookingAmt,
        this.autoPrintWithSave,
        this.printWt,
        this.printAmount,
        this.billGenerate,
        this.pickupStatus,
        this.pickupDate,
        this.companyId,
        this.bookedBy,
        this.pdfUrl});

  BookinDetailsData.fromJson(Map<String, dynamic> json) {
    try{
      id = json['id'];
      customerId = json['customer_id'];
      customerName = json['customer_name'];
      productName = json['product_name'];
      destinationCity = json['destination_city'];
      destinationPincode = json['destination_pincode'];
      zoneType = json['zone_type'];
      productId = json['product_id'];
      docType = json['doc_type'];
      barcodeNo = json['barcode_no'];
      bookingDate = json['booking_date'];
      referenceNo = json['reference_no'];
      finalWt = (json['final_wt'] is int)
          ? (json['final_wt'] as int).toDouble()
          : (json['final_wt'] as num?)?.toDouble();

      weight = (json['weight'] is int)
          ? (json['weight'] as int).toDouble()
          : (json['weight'] as num?)?.toDouble();

      fuelSurchargeAmt = (json['fuel_surcharge_amt'] is int)
          ? (json['fuel_surcharge_amt'] as int).toDouble()
          : (json['fuel_surcharge_amt'] as num?)?.toDouble();
      hight = json['hight'];
      length = json['length'];
      width = json['width'];
      additional = json['additional'];
      pieces = json['pieces'];
      paymentType = json['payment_type'];
      bankName = json['bank_name'];
      senderName = json['sender_name'];
      senderAddress = json['sender_address'];
      receiverName = json['receiver_name'];
      receiverAddress = json['receiver_address'];
      receiverCity = json['receiver_city'];
      receiverPincode = json['receiver_pincode'];
      receiverMobileNo = json['receiver_mobile_no'];
      isCod = json['is_cod'];
      amt = json['amt'];
      isCodAdjusted = json['is_cod_adjusted'];
      remark = json['remark'];
      sku = json['sku'];
      quantityPurchased = json['quantity_purchased'];
      taxMode = json['tax_mode'];
      declareValue = json['declare_value'];
      courierCharge = json['courier_charge'];
      podCharge = json['pod_charge'];
      cODCharge = json['COD_charge'];
      insurancePercentage = json['insurance_percentage']?.toString();
      insuranceAmt = (json['insurance_amt'] as num?)?.toInt();
      subTotal1 = (json['sub_total_1']as num?)?.toInt();
      fuelSurchargePercentage = json['fuel_surcharge_percentage'];
      fuelSurchargeAmt = json['fuel_surcharge_amt'];
      subTotal2 = json['sub_total_2'];
      sGSTPercentage = json['SGST_percentage'];
      sGSTAmt = json['SGST_amt'];
      cGSTPercentage = json['CGST_percentage'];
      cGSTAmt = json['CGST_amt'];
      iGSTPercentage = json['IGST_percentage'];
      iGSTAmt = json['IGST_amt'];
      totalTax = json['total_tax'];
      totalBookingAmt = json['total_booking_amt'];
      autoPrintWithSave = json['auto_print_with_save'];
      printWt = json['print_wt'];
      printAmount = json['print_amount'];
      billGenerate = json['bill_generate'];
      pickupStatus = json['pickup_status'];
      pickupDate = json['pickup_date'];
      companyId = json['company_id'];
      bookedBy = json['booked_by'];
      pdfUrl = json['pdf_url'];
    }catch(e, s){
      print('❌ Error parsing Data.fromJson: $e');
      print('Stacktrace: $s');    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['customer_name'] = this.customerName;
    data['product_name'] = this.productName;
    data['destination_city'] = this.destinationCity;
    data['destination_pincode'] = this.destinationPincode;
    data['zone_type'] = this.zoneType;
    data['product_id'] = this.productId;
    data['doc_type'] = this.docType;
    data['barcode_no'] = this.barcodeNo;
    data['booking_date'] = this.bookingDate;
    data['reference_no'] = this.referenceNo;
    data['final_wt'] = this.finalWt;
    data['weight'] = this.weight;
    data['volumetric_wt'] = this.volumetricWt;
    data['hight'] = this.hight;
    data['length'] = this.length;
    data['width'] = this.width;
    data['additional'] = this.additional;
    data['pieces'] = this.pieces;
    data['payment_type'] = this.paymentType;
    data['bank_name'] = this.bankName;
    data['sender_name'] = this.senderName;
    data['sender_address'] = this.senderAddress;
    data['receiver_name'] = this.receiverName;
    data['receiver_address'] = this.receiverAddress;
    data['receiver_city'] = this.receiverCity;
    data['receiver_pincode'] = this.receiverPincode;
    data['receiver_mobile_no'] = this.receiverMobileNo;
    data['is_cod'] = this.isCod;
    data['amt'] = this.amt;
    data['is_cod_adjusted'] = this.isCodAdjusted;
    data['remark'] = this.remark;
    data['sku'] = this.sku;
    data['quantity_purchased'] = this.quantityPurchased;
    data['tax_mode'] = this.taxMode;
    data['declare_value'] = this.declareValue;
    data['courier_charge'] = this.courierCharge;
    data['pod_charge'] = this.podCharge;
    data['COD_charge'] = this.cODCharge;
    data['insurance_percentage'] = this.insurancePercentage;
    data['insurance_amt'] = this.insuranceAmt;
    data['sub_total_1'] = this.subTotal1;
    data['fuel_surcharge_percentage'] = this.fuelSurchargePercentage;
    data['fuel_surcharge_amt'] = this.fuelSurchargeAmt;
    data['sub_total_2'] = this.subTotal2;
    data['SGST_percentage'] = this.sGSTPercentage;
    data['SGST_amt'] = this.sGSTAmt;
    data['CGST_percentage'] = this.cGSTPercentage;
    data['CGST_amt'] = this.cGSTAmt;
    data['IGST_percentage'] = this.iGSTPercentage;
    data['IGST_amt'] = this.iGSTAmt;
    data['total_tax'] = this.totalTax;
    data['total_booking_amt'] = this.totalBookingAmt;
    data['auto_print_with_save'] = this.autoPrintWithSave;
    data['print_wt'] = this.printWt;
    data['print_amount'] = this.printAmount;
    data['bill_generate'] = this.billGenerate;
    data['pickup_status'] = this.pickupStatus;
    data['pickup_date'] = this.pickupDate;
    data['company_id'] = this.companyId;
    data['booked_by'] = this.bookedBy;
    data['pdf_url'] = this.pdfUrl;
    return data;
  }
}
