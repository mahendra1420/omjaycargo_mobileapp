import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:omjaycargo/assets/app_colors.dart';
import 'package:omjaycargo/data/controller/acount_ledger_contoller.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../assets/app_assets.dart';
import '../data/shared_preference.dart';
import '../generated/l10n.dart';

class AccountLedgerScreen extends StatefulWidget {
  const AccountLedgerScreen({Key? key}) : super(key: key);

  @override
  State<AccountLedgerScreen> createState() => _AccountLedgerScreenState();
}

class _AccountLedgerScreenState extends State<AccountLedgerScreen> {
  TextEditingController startDateCtrl = TextEditingController();
  TextEditingController endDateCtrl = TextEditingController();

  final AccountLedgerController accountLedgerController = Get.put(AccountLedgerController());
  Future<void> pickDate(
      BuildContext context,
      TextEditingController controller,
      ) async {
    // ✅ Initialize locale data before formatting
    await initializeDateFormatting();

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  Future<void> toDate(
      BuildContext context,
      TextEditingController controller,
      ) async {
    // ✅ Initialize locale data before formatting
    await initializeDateFormatting();

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }


  @override
  void dispose() {
    startDateCtrl.dispose();
    endDateCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = 16;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.allScreenBGColor,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.bookingStatusCompleted,width:2),
            ),
            padding: const EdgeInsets.all(5),
            child: Image.asset(AppAssets.icBackIcon, height: 10, width: 10),
          ),
        ),
        title: Text(
          S.current.account_ledger,
          style: TextStyle(
            color: AppColors.bookingStatusCompleted,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // ✅ keeps title in center
      ),

      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 24,
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.shade100,
                        blurRadius: 10,
                        spreadRadius: 0,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          // Start Date
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  S.current.start_date,
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                SizedBox(
                                  height: 32, // set desired height
                                  child:TextFormField(
                                    controller: startDateCtrl,
                                    readOnly: true,
                                    onTap: () => pickDate(context, startDateCtrl),
                                    decoration: InputDecoration(
                                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                                      suffixIcon: const Icon(
                                        Icons.calendar_today,
                                        color: Colors.red,
                                        size: 18,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(color: Colors.black, width: 1.2),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(color: Colors.black, width: 1.5),
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 6, // reduced height
                                      ),
                                    ),
                                    style: const TextStyle(fontSize: 14),
                                  ),

                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          // End Date
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  S.current.end_date,
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                SizedBox(
                                  height: 32, // set desired height
                                  child:  SizedBox(
                                    height: 32, // set desired height
                                    child:TextFormField(
                                      controller: endDateCtrl,
                                      readOnly: true,
                                      onTap: () => pickDate(context, endDateCtrl),
                                      decoration: InputDecoration(
                                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                                        suffixIcon: const Icon(
                                          Icons.calendar_today,
                                          color: Colors.red,
                                          size: 18,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: const BorderSide(color: Colors.black, width: 1.2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: const BorderSide(color: Colors.black, width: 1.5),
                                        ),
                                        contentPadding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 6, // reduced height
                                        ),
                                      ),
                                      style: const TextStyle(fontSize: 14),
                                    ),

                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 35,
                        width: 95,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () {
                            if (startDateCtrl.text.isEmpty || endDateCtrl.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please select both dates'),
                                ),
                              );
                            } else {
                              final userId =  PreferenceManager.getUserId();
                              accountLedgerController.accountLedger(userId.toString(), startDateCtrl.text, endDateCtrl.text);
                              print("url---->${accountLedgerController.accountLedgerResponse.value?.data?.url}");
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue.shade900,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              'SUBMIT',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
          // ✅ Overlay loader
          Obx(() {
            return accountLedgerController.isLoading.value
                ? Container(
              color: Colors.black.withOpacity(0.3),
              child: const Center(
                child: CircularProgressIndicator(color: Colors.blue),
              ),
            )
                : const SizedBox.shrink();
          }),
        ],
      ),
      backgroundColor: Colors.grey.shade100,
    );
  }
}
