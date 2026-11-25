import 'package:flutter/material.dart';
import 'package:omjaycargo/helpers/screen_constant.dart';
import 'package:omjaycargo/screen/dashboard.dart';

import '../screen/account_lenger.dart';
import '../screen/complain.dart';
import '../screen/complain_history.dart';
import '../screen/counter_booking_details.dart';
import '../screen/counter_booking_list.dart';
import '../screen/credit_bill_list.dart';
import '../screen/rate_calculator.dart';
import '../screen/service_availibility.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final argument = (settings.arguments as Map?) ?? {};

    // switch (settings.name) {
    //   case Screen.loginWithEmail:
    //     return MaterialPageRoute(builder: (_) => LoginWithEmail(email: argument[Extra.emailAddress]));
    switch (settings.name) {
      case AppScreen.dashboard:
        return MaterialPageRoute(builder: (_) => Dashboard());
        case AppScreen.counterBookingList:
        return MaterialPageRoute(builder: (_) => CounterBookingList());
      case AppScreen.counterBookingDetails:
        return MaterialPageRoute(
          builder: (_) => CounterBookingDetails(
            booking: argument['booking'], // 👈 Pass to the constructor
          ),
        );
        case AppScreen.creditBillList:
        return MaterialPageRoute(builder: (_) => CreditBillList());
        case AppScreen.rateCalculator:
        return MaterialPageRoute(builder: (_) => RateCalculator());
        case AppScreen.accountLedgerScreen:
        return MaterialPageRoute(builder: (_) => AccountLedgerScreen());
        case AppScreen.complainHistory:
        return MaterialPageRoute(builder: (_) => ComplainHistory());
        case AppScreen.complainScreen:
        return MaterialPageRoute(builder: (_) => ComplainScreen());
        case AppScreen.serviceAvailibilityScreen:
        return MaterialPageRoute(builder: (_) => ServiceAvailibilityScreen());


      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(body: SizedBox(height: 0)));
    }
  }
}
