class AccountLedgerResponse {
  bool? result;
  String? message;
  Data? data;

  AccountLedgerResponse({this.result, this.message, this.data});

  AccountLedgerResponse.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];

    if (json['data'] is Map<String, dynamic>) {
      data = Data.fromJson(json['data']);
    } else {
      data = null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['result'] = result;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? url;

  Data({this.url});

  Data.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['url'] = url;
    return data;
  }
}
