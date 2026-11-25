class LoginResponse {
  bool? result;
  String? message;
  Data? data;

  LoginResponse({this.result, this.message, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? customerName;
  String? email;
  String? mobileNo;
  String? accountCode;
  String? token;

  Data(
      {this.id,
        this.customerName,
        this.email,
        this.mobileNo,
        this.accountCode,
        this.token});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerName = json['customer_name'];
    email = json['email'];
    mobileNo = json['mobile_no'];
    accountCode = json['account_code'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_name'] = this.customerName;
    data['email'] = this.email;
    data['mobile_no'] = this.mobileNo;
    data['account_code'] = this.accountCode;
    data['token'] = this.token;
    return data;
  }
}
