class DashboardResponse {
  bool? result;
  String? message;
  DashBoardData? data;

  DashboardResponse({this.result, this.message, this.data});

  DashboardResponse.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    data = json['data'] != null ? new DashBoardData.fromJson(json['data']) : null;
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

class DashBoardData {
  int? bookingDetails;
  int? invoice;
  int? outstandingAmt;

  DashBoardData({this.bookingDetails, this.invoice, this.outstandingAmt});

  DashBoardData.fromJson(Map<String, dynamic> json) {
    bookingDetails = json['Booking_Details'];
    invoice = json['Invoice'];
    outstandingAmt = json['Outstanding_amt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Booking_Details'] = this.bookingDetails;
    data['Invoice'] = this.invoice;
    data['Outstanding_amt'] = this.outstandingAmt;
    return data;
  }
}
