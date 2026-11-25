import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:omjaycargo/data/controller/credit_bill_controller.dart';
import 'package:omjaycargo/helpers/helper.dart';
import '../assets/app_assets.dart';
import '../assets/app_colors.dart';
import '../data/shared_preference.dart';
import '../generated/l10n.dart';
import 'package:intl/intl.dart';

class CreditBillList extends StatefulWidget {
  const CreditBillList({super.key});

  @override
  State<CreditBillList> createState() => _CreditBillListState();
}

class _CreditBillListState extends State<CreditBillList> {
  final double buttonSize = 30;

  final CreditBillController creditBillController = Get.put(CreditBillController());
  String? businessName;
  String? agentCode;

  @override
  void initState() {
    super.initState();
    _initDashboard();
  }
  final TextEditingController _startDateCtrl = TextEditingController();
  final TextEditingController _endDateCtrl = TextEditingController();
  bool _showSearch = false; // 🔍 toggle state
  final TextEditingController _searchController = TextEditingController();
  Future<void> _pickDate(BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );  if (picked != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }
  void _initDashboard() async {
    final userId = await PreferenceManager.getUserId();
    if (userId != null) {
      await creditBillController.creditBill(
        userId.toString(),
        fromDate: "",
        billNo: "",
        startDate: "",
        pageNo: "",
      );
    }
    if (mounted) {
      setState(() {});
    }
  }


  @override
  Widget build(BuildContext context) {
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
          S.current.credit_bill_list,
          style: TextStyle(
            color: AppColors.bookingStatusCompleted,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [

          GestureDetector(
            onTap: () {
              setState(() => _showSearch = !_showSearch);
            },
            child:Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.bookingStatusCompleted,width:2),
              ),
              padding: const EdgeInsets.all(5),
              child: Image.asset(AppAssets.icSearchIcon, height: 20, width: 20),
            ),
          ),
          // Second right icon
          GestureDetector(
            onTap: () {
              _showFilterBottomSheet(context);

            },
            child:Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.bookingStatusCompleted,width:2),
              ),
              padding: const EdgeInsets.all(5),
              child: Image.asset(AppAssets.icFilterIcon, height: 20, width: 20),
            ),
          ),
        ],
      ),

      body:

      Column(
        children: [

          if (_showSearch) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: "Search BILL NUMBER",
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 12),
                        // suffixIcon: IconButton(
                        //   icon: const Icon(Icons.close, color: Colors.red),
                        //   onPressed: () {
                        //     _searchController.clear();
                        //     setState(() {});
                        //   },
                        // ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: AppColors.secoundPrimary, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: AppColors.secoundPrimary, width: 2),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Obx(() {
                    return GestureDetector(
                      onTap: () async {
                        FocusScope.of(context).unfocus();
                        final query = _searchController.text.trim();
                        final userId = await PreferenceManager.getUserId();
                        if (userId != null) {
                          await creditBillController.creditBill(
                            userId.toString(),
                            billNo: query.isNotEmpty ? query : null,
                            pageNo: "1",
                            startDate: _startDateCtrl.text,
                            fromDate: _endDateCtrl.text,
                          );
                        }
                      },
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.errorColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: creditBillController.isLoading.value
                              ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                                color: Colors.white, strokeWidth: 2),
                          )
                              : const Text(
                            "SEARCH",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
            Helper.verticalSpace(10),
          ],

          Obx(() {
            if (creditBillController.isLoading.value) {
              // 🟢 This will take the full available height and center the loader
              return const Expanded(
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.bookingStatusCompleted,
                    strokeWidth: 3,
                  ),
                ),
              );
            }

            final bills = creditBillController.creditBillResponse.value?.data ?? [];

            return

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        itemCount: bills.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final bill = bills[index];
                          return buildBillCard(
                            billNo: "${bill.billNo}",
                            billDate: "${bill.billDate}",
                            isVoucherCreated: "${bill.billAdjusted == 1 ? "Yes" : "No"}",
                            billAmount: "${bill.subTotal2 ?? 0}",
                            sgst: "${bill.sGST ?? 0}",
                            cgst: "${bill.cGST ?? 0}",
                            igst: "${bill.iGST ?? 0}",
                            totalAmt: "${bill.totalAmt ?? 0}",
                            onIconTap: () {
                              print("bill url -- > ${bill.pdfUrl}");
                              Helper.openPdfUrl(context, bill.pdfUrl ?? "");

                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
          }),
        ],
      )
    );
  }

  Widget buildBillCard({
    required String billNo,
    required String billDate,
    required String isVoucherCreated,
    required String billAmount,
    required String sgst,
    required String cgst,
    required String igst,
    required String totalAmt,
    required VoidCallback onIconTap,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.secoundPrimary, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: 10,
                  decoration: BoxDecoration(
                      color: AppColors.secoundPrimary,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),topLeft:Radius.circular(8))
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 6,right: 8,top: 12),
                      child: Text(S.current.bill_no,style: TextStyle(
                        color: AppColors.black,fontWeight: FontWeight.bold,fontSize: 18
                      ),),
                    ),
                    Container(
                      height: 18,
                      width: 90,
                      decoration: BoxDecoration(
                          color: AppColors.secoundPrimary,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(billNo,style: TextStyle(color: AppColors.white,fontSize: 12),),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 6,right: 8,top: 12),
                      child: Text(S.current.bill_date,style: TextStyle(
                          color: AppColors.black,fontWeight: FontWeight.bold,fontSize: 18
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 8),
                      child: Text(billDate,style: TextStyle(
                        fontSize: 11
                      ),),
                    ),

                  ],
                )
              ],
            ),





          ],
        ),
       Container(
         width: 0.8,
         height: 200,
         color: AppColors.secoundPrimary,
       ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 12,right: 8,top: 12),
                    child: Text(S.current.is_voucher_created,style: TextStyle(
                        color: AppColors.black,fontWeight: FontWeight.bold,fontSize: 16
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2,top: 14),
                    child: Text(isVoucherCreated,style: TextStyle(
                        fontSize: 14
                    ),),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0,top: 8),
                child: Container(
                  height: 1,
                  width: 190,
                  color: AppColors.black,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 12,right: 8,top: 12),
                    child: Text(S.current.bill_amount,style: TextStyle(
                        color: AppColors.black,fontWeight: FontWeight.bold,fontSize: 16
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2,top: 14),
                    child: Text(billAmount,style: TextStyle(
                        fontSize: 14
                    ),),
                  ),



                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   Column(
                     children: [
                       Padding(
                         padding:  EdgeInsets.only(left: 12,right: 8,top: 12),
                         child: Text(S.current.sgst,style: TextStyle(
                             color: AppColors.black,fontWeight: FontWeight.bold,fontSize: 16
                         ),),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 2,top: 0),
                         child: Text(sgst,style: TextStyle(
                             fontSize: 14
                         ),),
                       ),
                     ],
                   ),
                    Helper.horizontalSpace(15),

                    Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: 12,right: 8,top: 12),
                          child: Text(S.current.cgst,style: TextStyle(
                              color: AppColors.black,fontWeight: FontWeight.bold,fontSize: 16
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2,top: 0),
                          child: Text(cgst,style: TextStyle(
                              fontSize: 14
                          ),),
                        ),
                      ],
                    ),
                    Helper.horizontalSpace(15),
                    Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: 12,right: 8,top: 12),
                          child: Text(S.current.igst,style: TextStyle(
                              color: AppColors.black,fontWeight: FontWeight.bold,fontSize: 16
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2,top: 0),
                          child: Text(igst,style: TextStyle(
                              fontSize: 14
                          ),),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: 12,right: 8,top: 12),
                        child: Text(S.current.total_amt,style: TextStyle(
                            color: AppColors.black,fontWeight: FontWeight.bold,fontSize: 16
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12,top: 0),
                        child: Text(totalAmt,style: TextStyle(
                            fontSize: 14
                        ),),
                      ),
                    ],
                  ),
                  Helper.horizontalSpace(96),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: onIconTap,
                      child: Container(
                        margin: const EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.secoundPrimary,width: 1.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.copy, color: Colors.red, size: 20),
                      ),
                    ),
                  ),
                ],
              ),



            ],
          )


        ],
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ───────────────────────────────
                  // Header Row
                  // ───────────────────────────────
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Filter by Date",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.close, color: Colors.black54),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // ───────────────────────────────
                  // Start Date Field
                  // ───────────────────────────────
                  Text(
                    "Start Date",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _startDateCtrl,
                    readOnly: true,
                    onTap: () => _pickDate(context, _startDateCtrl),
                    decoration: InputDecoration(
                      suffixIcon:
                      const Icon(Icons.calendar_today, color: Colors.red),
                      hintText: "Select start date",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        const BorderSide(color: AppColors.secoundPrimary),
                      ),
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ───────────────────────────────
                  // End Date Field
                  // ───────────────────────────────
                  Text(
                    "End Date",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _endDateCtrl,
                    readOnly: true,
                    onTap: () => _pickDate(context, _endDateCtrl),
                    decoration: InputDecoration(
                      suffixIcon:
                      const Icon(Icons.calendar_today, color: Colors.red),
                      hintText: "Select end date",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        const BorderSide(color: AppColors.secoundPrimary),
                      ),
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ───────────────────────────────
                  // Action Buttons (Clear / Apply)
                  // ───────────────────────────────
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[400],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            _startDateCtrl.clear();
                            _endDateCtrl.clear();
                          },
                          child: const Text(
                            "CLEAR",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.bookingStatusCompleted,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                            final userId = await PreferenceManager.getUserId();
                            if (userId != null) {
                              await creditBillController.creditBill(
                                userId.toString(),
                                startDate: _startDateCtrl.text,
                                fromDate: _endDateCtrl.text,
                                pageNo: "1",
                                billNo: ""
                              );
                            }
                          },
                          child: const Text(
                            "APPLY",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }



}
