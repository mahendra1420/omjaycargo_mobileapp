// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome !`
  String get welcome {
    return Intl.message('Welcome !', name: 'welcome', desc: '', args: []);
  }

  /// `Login with your email and password`
  String get login_with_your_email_and_password {
    return Intl.message(
      'Login with your email and password',
      name: 'login_with_your_email_and_password',
      desc: '',
      args: [],
    );
  }

  /// `Email ID`
  String get email_id {
    return Intl.message('Email ID', name: 'email_id', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Forgot Password ?`
  String get forgot_password {
    return Intl.message(
      'Forgot Password ?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `submit`
  String get submit {
    return Intl.message('submit', name: 'submit', desc: '', args: []);
  }

  /// `Entre your Email ID`
  String get hint_entre_your_email_id {
    return Intl.message(
      'Entre your Email ID',
      name: 'hint_entre_your_email_id',
      desc: '',
      args: [],
    );
  }

  /// `Entre your Password`
  String get hint_entre_your_password {
    return Intl.message(
      'Entre your Password',
      name: 'hint_entre_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Entre your Pincode`
  String get hint_entre_your_pincode {
    return Intl.message(
      'Entre your Pincode',
      name: 'hint_entre_your_pincode',
      desc: '',
      args: [],
    );
  }

  /// `Booking Details`
  String get booking_details {
    return Intl.message(
      'Booking Details',
      name: 'booking_details',
      desc: '',
      args: [],
    );
  }

  /// `Invoice`
  String get invoice {
    return Intl.message('Invoice', name: 'invoice', desc: '', args: []);
  }

  /// `Rate Calculator`
  String get rate_calculator {
    return Intl.message(
      'Rate Calculator',
      name: 'rate_calculator',
      desc: '',
      args: [],
    );
  }

  /// `Account Ledger`
  String get account_ledger {
    return Intl.message(
      'Account Ledger',
      name: 'account_ledger',
      desc: '',
      args: [],
    );
  }

  /// `Complaint Service`
  String get complaint_service {
    return Intl.message(
      'Complaint Service',
      name: 'complaint_service',
      desc: '',
      args: [],
    );
  }

  /// `Service Availability`
  String get service_availability {
    return Intl.message(
      'Service Availability',
      name: 'service_availability',
      desc: '',
      args: [],
    );
  }

  /// `Service Availability List`
  String get service_availability_list {
    return Intl.message(
      'Service Availability List',
      name: 'service_availability_list',
      desc: '',
      args: [],
    );
  }

  /// `Outstanding Amount`
  String get outstanding_amount {
    return Intl.message(
      'Outstanding Amount',
      name: 'outstanding_amount',
      desc: '',
      args: [],
    );
  }

  /// `Counter Booking`
  String get counter_booking {
    return Intl.message(
      'Counter Booking',
      name: 'counter_booking',
      desc: '',
      args: [],
    );
  }

  /// `barcode No.`
  String get barcode_no {
    return Intl.message('barcode No.', name: 'barcode_no', desc: '', args: []);
  }

  /// `Date`
  String get date {
    return Intl.message('Date', name: 'date', desc: '', args: []);
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Receiver Name`
  String get receiver_name {
    return Intl.message(
      'Receiver Name',
      name: 'receiver_name',
      desc: '',
      args: [],
    );
  }

  /// `Action`
  String get action {
    return Intl.message('Action', name: 'action', desc: '', args: []);
  }

  /// `Filter`
  String get filter {
    return Intl.message('Filter', name: 'filter', desc: '', args: []);
  }

  /// `Start Date`
  String get start_date {
    return Intl.message('Start Date', name: 'start_date', desc: '', args: []);
  }

  /// `End Date`
  String get end_date {
    return Intl.message('End Date', name: 'end_date', desc: '', args: []);
  }

  /// `Apply`
  String get apply {
    return Intl.message('Apply', name: 'apply', desc: '', args: []);
  }

  /// `Clear`
  String get clear {
    return Intl.message('Clear', name: 'clear', desc: '', args: []);
  }

  /// `SEARCH`
  String get search {
    return Intl.message('SEARCH', name: 'search', desc: '', args: []);
  }

  /// `Search`
  String get hint_search {
    return Intl.message('Search', name: 'hint_search', desc: '', args: []);
  }

  /// `Payment Type`
  String get payment_type {
    return Intl.message(
      'Payment Type',
      name: 'payment_type',
      desc: '',
      args: [],
    );
  }

  /// `Zone Type`
  String get zone_type {
    return Intl.message('Zone Type', name: 'zone_type', desc: '', args: []);
  }

  /// `Product`
  String get product {
    return Intl.message('Product', name: 'product', desc: '', args: []);
  }

  /// `Reference No.`
  String get reference_no {
    return Intl.message(
      'Reference No.',
      name: 'reference_no',
      desc: '',
      args: [],
    );
  }

  /// `Length`
  String get length {
    return Intl.message('Length', name: 'length', desc: '', args: []);
  }

  /// `Height`
  String get height {
    return Intl.message('Height', name: 'height', desc: '', args: []);
  }

  /// `Width`
  String get width {
    return Intl.message('Width', name: 'width', desc: '', args: []);
  }

  /// `Pieces`
  String get pieces {
    return Intl.message('Pieces', name: 'pieces', desc: '', args: []);
  }

  /// `Recv. Mob. No.`
  String get recv_mob_no {
    return Intl.message(
      'Recv. Mob. No.',
      name: 'recv_mob_no',
      desc: '',
      args: [],
    );
  }

  /// `Sender Name`
  String get sender_name {
    return Intl.message('Sender Name', name: 'sender_name', desc: '', args: []);
  }

  /// `Sender Address`
  String get sender_address {
    return Intl.message(
      'Sender Address',
      name: 'sender_address',
      desc: '',
      args: [],
    );
  }

  /// `Customer Name`
  String get customer_name {
    return Intl.message(
      'Customer Name',
      name: 'customer_name',
      desc: '',
      args: [],
    );
  }

  /// `Dest. Country Pincode`
  String get dest_country_pincode {
    return Intl.message(
      'Dest. Country Pincode',
      name: 'dest_country_pincode',
      desc: '',
      args: [],
    );
  }

  /// `Doc Type`
  String get doc_type {
    return Intl.message('Doc Type', name: 'doc_type', desc: '', args: []);
  }

  /// `Booking Date`
  String get booking_date {
    return Intl.message(
      'Booking Date',
      name: 'booking_date',
      desc: '',
      args: [],
    );
  }

  /// `Weight(kg)`
  String get weight_kg {
    return Intl.message('Weight(kg)', name: 'weight_kg', desc: '', args: []);
  }

  /// `Additional`
  String get additional {
    return Intl.message('Additional', name: 'additional', desc: '', args: []);
  }

  /// `Recv. Pincode`
  String get recv_pincode {
    return Intl.message(
      'Recv. Pincode',
      name: 'recv_pincode',
      desc: '',
      args: [],
    );
  }

  /// `Is COD`
  String get is_cod {
    return Intl.message('Is COD', name: 'is_cod', desc: '', args: []);
  }

  /// `Receiver Address`
  String get receiver_address {
    return Intl.message(
      'Receiver Address',
      name: 'receiver_address',
      desc: '',
      args: [],
    );
  }

  /// `Remark`
  String get remark {
    return Intl.message('Remark', name: 'remark', desc: '', args: []);
  }

  /// `Counter Booking View`
  String get counter_booking_view {
    return Intl.message(
      'Counter Booking View',
      name: 'counter_booking_view',
      desc: '',
      args: [],
    );
  }

  /// `APPLIED RATE/CHARGES`
  String get applied_rate_charges {
    return Intl.message(
      'APPLIED RATE/CHARGES',
      name: 'applied_rate_charges',
      desc: '',
      args: [],
    );
  }

  /// `Declared Value`
  String get declared_value {
    return Intl.message(
      'Declared Value',
      name: 'declared_value',
      desc: '',
      args: [],
    );
  }

  /// `Courier Charge`
  String get courier_charge {
    return Intl.message(
      'Courier Charge',
      name: 'courier_charge',
      desc: '',
      args: [],
    );
  }

  /// `P.O.D. Charge`
  String get pod_charge {
    return Intl.message(
      'P.O.D. Charge',
      name: 'pod_charge',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Charge`
  String get delivery_charge {
    return Intl.message(
      'Delivery Charge',
      name: 'delivery_charge',
      desc: '',
      args: [],
    );
  }

  /// `COF%`
  String get cof {
    return Intl.message('COF%', name: 'cof', desc: '', args: []);
  }

  /// `COF amt`
  String get cof_amt {
    return Intl.message('COF amt', name: 'cof_amt', desc: '', args: []);
  }

  /// `Total Custom Charge`
  String get total_custom_charge {
    return Intl.message(
      'Total Custom Charge',
      name: 'total_custom_charge',
      desc: '',
      args: [],
    );
  }

  /// `Sub Total 1:-`
  String get sub_total_1 {
    return Intl.message(
      'Sub Total 1:-',
      name: 'sub_total_1',
      desc: '',
      args: [],
    );
  }

  /// `Sub Total 2:-`
  String get sub_total_2 {
    return Intl.message(
      'Sub Total 2:-',
      name: 'sub_total_2',
      desc: '',
      args: [],
    );
  }

  /// `Fuel Surcharge%%`
  String get fuel_surcharge {
    return Intl.message(
      'Fuel Surcharge%%',
      name: 'fuel_surcharge',
      desc: '',
      args: [],
    );
  }

  /// `Fuel Surcharge Amt%`
  String get fuel_surcharge_amt {
    return Intl.message(
      'Fuel Surcharge Amt%',
      name: 'fuel_surcharge_amt',
      desc: '',
      args: [],
    );
  }

  /// `S.GST%`
  String get s_gst {
    return Intl.message('S.GST%', name: 's_gst', desc: '', args: []);
  }

  /// `C.GST%`
  String get c_gst {
    return Intl.message('C.GST%', name: 'c_gst', desc: '', args: []);
  }

  /// `I.GST%`
  String get i_gst {
    return Intl.message('I.GST%', name: 'i_gst', desc: '', args: []);
  }

  /// `S.GST amt`
  String get s_gst_amt {
    return Intl.message('S.GST amt', name: 's_gst_amt', desc: '', args: []);
  }

  /// `C.GST amt`
  String get c_gst_amt {
    return Intl.message('C.GST amt', name: 'c_gst_amt', desc: '', args: []);
  }

  /// `I.GST amt`
  String get i_gst_amt {
    return Intl.message('I.GST amt', name: 'i_gst_amt', desc: '', args: []);
  }

  /// `Total Tax`
  String get total_tax {
    return Intl.message('Total Tax', name: 'total_tax', desc: '', args: []);
  }

  /// `Credit Bill List`
  String get credit_bill_list {
    return Intl.message(
      'Credit Bill List',
      name: 'credit_bill_list',
      desc: '',
      args: [],
    );
  }

  /// `Bill No.`
  String get bill_no {
    return Intl.message('Bill No.', name: 'bill_no', desc: '', args: []);
  }

  /// `Is Voucher Created :`
  String get is_voucher_created {
    return Intl.message(
      'Is Voucher Created :',
      name: 'is_voucher_created',
      desc: '',
      args: [],
    );
  }

  /// `Bill Amount :`
  String get bill_amount {
    return Intl.message(
      'Bill Amount :',
      name: 'bill_amount',
      desc: '',
      args: [],
    );
  }

  /// `Bill Date`
  String get bill_date {
    return Intl.message('Bill Date', name: 'bill_date', desc: '', args: []);
  }

  /// `SGST`
  String get sgst {
    return Intl.message('SGST', name: 'sgst', desc: '', args: []);
  }

  /// `CGST`
  String get cgst {
    return Intl.message('CGST', name: 'cgst', desc: '', args: []);
  }

  /// `IGST`
  String get igst {
    return Intl.message('IGST', name: 'igst', desc: '', args: []);
  }

  /// `Total Amt`
  String get total_amt {
    return Intl.message('Total Amt', name: 'total_amt', desc: '', args: []);
  }

  /// `Rate Master`
  String get rate_master {
    return Intl.message('Rate Master', name: 'rate_master', desc: '', args: []);
  }

  /// `Zone Type*`
  String get zone_type_mandatory {
    return Intl.message(
      'Zone Type*',
      name: 'zone_type_mandatory',
      desc: '',
      args: [],
    );
  }

  /// `Dest. Country`
  String get dest_country_mandatory {
    return Intl.message(
      'Dest. Country',
      name: 'dest_country_mandatory',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Service Name`
  String get service_name {
    return Intl.message(
      'Service Name',
      name: 'service_name',
      desc: '',
      args: [],
    );
  }

  /// `Complain`
  String get complain {
    return Intl.message('Complain', name: 'complain', desc: '', args: []);
  }

  /// `Complain History`
  String get complain_history {
    return Intl.message(
      'Complain History',
      name: 'complain_history',
      desc: '',
      args: [],
    );
  }

  /// `Bulk Complain`
  String get bulk_complain {
    return Intl.message(
      'Bulk Complain',
      name: 'bulk_complain',
      desc: '',
      args: [],
    );
  }

  /// `Upload CSV File`
  String get upload_csv_file {
    return Intl.message(
      'Upload CSV File',
      name: 'upload_csv_file',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Category`
  String get category {
    return Intl.message('Category', name: 'category', desc: '', args: []);
  }

  /// `sub Category`
  String get sub_category {
    return Intl.message(
      'sub Category',
      name: 'sub_category',
      desc: '',
      args: [],
    );
  }

  /// `Barcode`
  String get barcode {
    return Intl.message('Barcode', name: 'barcode', desc: '', args: []);
  }

  /// `Type`
  String get type {
    return Intl.message('Type', name: 'type', desc: '', args: []);
  }

  /// `Availability`
  String get availability {
    return Intl.message(
      'Availability',
      name: 'availability',
      desc: '',
      args: [],
    );
  }

  /// `ODA Applicable`
  String get oda_applicable {
    return Intl.message(
      'ODA Applicable',
      name: 'oda_applicable',
      desc: '',
      args: [],
    );
  }

  /// `Name:`
  String get name_colon {
    return Intl.message('Name:', name: 'name_colon', desc: '', args: []);
  }

  /// `Phone:`
  String get phone_colon {
    return Intl.message('Phone:', name: 'phone_colon', desc: '', args: []);
  }

  /// `Email:`
  String get email_colon {
    return Intl.message('Email:', name: 'email_colon', desc: '', args: []);
  }

  /// `My Profile`
  String get my_profile {
    return Intl.message('My Profile', name: 'my_profile', desc: '', args: []);
  }

  /// `Share`
  String get share {
    return Intl.message('Share', name: 'share', desc: '', args: []);
  }

  /// `Rate`
  String get rate {
    return Intl.message('Rate', name: 'rate', desc: '', args: []);
  }

  /// `Log out`
  String get log_out {
    return Intl.message('Log out', name: 'log_out', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Phone`
  String get phone {
    return Intl.message('Phone', name: 'phone', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `CHANGE PASSWORD`
  String get change_password {
    return Intl.message(
      'CHANGE PASSWORD',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Entre Password`
  String get hint_entre_password {
    return Intl.message(
      'Entre Password',
      name: 'hint_entre_password',
      desc: '',
      args: [],
    );
  }

  /// `Entre Confirm Password`
  String get hint_entre_confirm_password {
    return Intl.message(
      'Entre Confirm Password',
      name: 'hint_entre_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Entre your Phone No.`
  String get hint_entre_your_phone_no {
    return Intl.message(
      'Entre your Phone No.',
      name: 'hint_entre_your_phone_no',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgot_password_ {
    return Intl.message(
      'Forgot Password',
      name: 'forgot_password_',
      desc: '',
      args: [],
    );
  }

  /// `DASHBOARD`
  String get dashboard {
    return Intl.message('DASHBOARD', name: 'dashboard', desc: '', args: []);
  }

  /// `Account Code:`
  String get account_code {
    return Intl.message(
      'Account Code:',
      name: 'account_code',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
