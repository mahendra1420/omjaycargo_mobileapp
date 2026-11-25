class ServiceAvailbilityResponse {
  bool? result;
  String? message;
  List<Data>? data;

  ServiceAvailbilityResponse({this.result, this.message, this.data});

  ServiceAvailbilityResponse.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? productName;
  int? productId;
  int? id;
  int? oda;
  int? availability;
  String? docRate;
  String? nonDocRate;

  Data(
      {this.productName,
        this.productId,
        this.id,
        this.oda,
        this.availability,
        this.docRate,
        this.nonDocRate});

  Data.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    productId = json['product_id'];
    id = json['id'];
    oda = json['oda'];
    availability = json['availability'];
    docRate = json['doc_rate'];
    nonDocRate = json['non_doc_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_name'] = this.productName;
    data['product_id'] = this.productId;
    data['id'] = this.id;
    data['oda'] = this.oda;
    data['availability'] = this.availability;
    data['doc_rate'] = this.docRate;
    data['non_doc_rate'] = this.nonDocRate;
    return data;
  }
}
