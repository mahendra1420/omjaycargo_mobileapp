import 'package:flutter/material.dart';
import 'package:omjaycargo/assets/app_assets.dart';
import 'package:omjaycargo/assets/app_colors.dart';
import 'package:omjaycargo/helpers/helper.dart';
import '../generated/l10n.dart';

class CounterBookingDetails extends StatefulWidget {
  final dynamic booking; // Expecting BookinDetailsData object

  const CounterBookingDetails({super.key, this.booking});

  @override
  State<CounterBookingDetails> createState() => _CounterBookingDetailsState();
}

class _CounterBookingDetailsState extends State<CounterBookingDetails> {
  final double buttonSize = 30; // smaller size

  @override
  Widget build(BuildContext context) {
    final booking = widget.booking; // short alias

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.allScreenBGColor,
        automaticallyImplyLeading: false,
        title: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Text(
                S.current.counter_booking_view,
                style: TextStyle(
                  color: AppColors.bookingStatusCompleted,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child:GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 32,
                  height: 32,
                  margin: const EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8
                    ),
                    border: Border.all(
                        color: AppColors.bookingStatusCompleted, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(AppAssets.icBackIcon),
                  ),
                ),
              ),

            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
        child: Column(
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  horizontal: 14, vertical: 10),
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
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  // 🔹 Booking Info Section
                  _buildSectionTitle("Barcode No.", booking?.barcodeNo),

                  _buildDetailsSection(
                    leftColumn: [
                      LabelValueWidget(label: S.current.payment_type, value: booking?.paymentType ?? "-"),
                      LabelValueWidget(label: S.current.zone_type, value: booking?.zoneType ?? "-"),
                      LabelValueWidget(label: S.current.product, value: booking?.productName ?? "-"),
                      LabelValueWidget(label: S.current.reference_no, value: booking?.referenceNo ?? "-"),
                      LabelValueWidget(label: S.current.length, value: booking?.length?.toString() ?? "-"),
                      LabelValueWidget(label: S.current.height, value: booking?.hight?.toString() ?? "-"),
                      LabelValueWidget(label: S.current.pieces, value: booking?.pieces?.toString() ?? "-"),
                      LabelValueWidget(label: S.current.recv_mob_no, value: booking?.receiverMobileNo ?? "-"),
                      LabelValueWidget(label: S.current.sender_name, value: booking?.senderName ?? "-"),
                      LabelValueWidget(label: S.current.sender_address, value: booking?.senderAddress ?? "-"),
                      LabelValueWidget(label: S.current.remark, value: booking?.remark ?? "-"),
                    ],
                    rightColumn: [
                      LabelValueWidget(label: S.current.customer_name, value: booking?.customerName ?? "-"),
                      LabelValueWidget(label: S.current.dest_country_pincode, value: booking?.destinationPincode ?? "-"),
                      LabelValueWidget(label: S.current.doc_type, value: booking?.docType ?? "-"),
                      LabelValueWidget(label: S.current.booking_date, value: booking?.bookingDate ?? "-"),
                      LabelValueWidget(label: S.current.weight_kg, value: booking?.weight?.toString() ?? "-"),
                      LabelValueWidget(label: S.current.width, value: booking?.width?.toString() ?? "-"),
                      LabelValueWidget(label: S.current.additional, value: booking?.additional?.toString() ?? "-"),
                      LabelValueWidget(label: S.current.recv_pincode, value: booking?.receiverPincode ?? "-"),
                      LabelValueWidget(label: S.current.is_cod, value: booking?.isCod ?? "-"),
                      LabelValueWidget(label: S.current.receiver_name, value: booking?.receiverName ?? "-"),
                      LabelValueWidget(label: S.current.receiver_address, value: booking?.receiverAddress ?? "-"),
                    ],
                  ),
                ],
              ),
            ),



            Helper.verticalSpace(10),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  horizontal: 14, vertical: 10),
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
                border: Border.all(color: Colors.grey.shade200),
              ),
              child:Column(
                children: [
                  // 🔹 Charges Section
                  _buildSectionTitle(S.current.applied_rate_charges, ""),
                  _buildDetailsSection(
                    leftColumn: [
                      LabelValueWidget(label: S.current.declared_value, value: booking?.declareValue?.toString() ?? "-"),
                      LabelValueWidget(label: S.current.pod_charge, value: booking?.podCharge?.toString() ?? "-"),
                      LabelValueWidget(label: S.current.cof, value: booking?.insurancePercentage ?? "-"),
                      LabelValueWidget(label: S.current.total_custom_charge, value: booking?.insuranceAmt?.toString() ?? "-"),
                    ],
                    rightColumn: [
                      LabelValueWidget(label: S.current.courier_charge, value: booking?.courierCharge?.toString() ?? "-"),
                      LabelValueWidget(label: S.current.delivery_charge, value: booking?.cODCharge?.toString() ?? "-"),
                      LabelValueWidget(label: S.current.cof_amt, value: booking?.insuranceAmt?.toString() ?? "-"),
                    ],
                  ),
                ],
              ),
            ),



            Helper.verticalSpace(10),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  horizontal: 14, vertical: 10),
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
                border: Border.all(color: Colors.grey.shade200),
              ),
              child:Column(
                children: [
                  _buildSectionTitle("${S.current.sub_total_1} ${booking?.subTotal1 ?? '-'}", ""),
                  _buildDetailsSection(
                    leftColumn: [
                      LabelValueWidget(label: S.current.fuel_surcharge, value: booking?.fuelSurchargePercentage?.toString() ?? "-"),
                    ],
                    rightColumn: [
                      LabelValueWidget(label: S.current.fuel_surcharge_amt, value: booking?.fuelSurchargeAmt?.toString() ?? "-"),
                    ],
                  ),
                  _buildSectionTitle("${S.current.sub_total_2} ${booking?.subTotal2 ?? '-'}", ""),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                LabelValueWidget(label: S.current.s_gst, value: booking?.sGSTPercentage ?? "-"),
                                LabelValueWidget(label: S.current.s_gst_amt, value: booking?.sGSTAmt?.toString() ?? "-"),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                LabelValueWidget(label: S.current.c_gst, value: booking?.cGSTPercentage ?? "-"),
                                LabelValueWidget(label: S.current.c_gst_amt, value: booking?.cGSTAmt?.toString() ?? "-"),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                LabelValueWidget(label: S.current.i_gst, value: booking?.iGSTPercentage ?? "-"),
                                LabelValueWidget(label: S.current.i_gst_amt, value: booking?.iGSTAmt?.toString() ?? "-"),
                              ],
                            ),
                          ],
                        ),
                        Helper.verticalSpace(8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LabelValueWidget(label: S.current.total_tax, value: booking?.totalTax?.toString() ?? "-"),
                            LabelValueWidget(label: S.current.total_amt, value: booking?.totalBookingAmt?.toString() ?? "-"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),



          ],
        ),
      ),
    );
  }

  /// Section title with optional subtitle
  Widget _buildSectionTitle(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Center(
            child: Text(
              title,
              style: TextStyle(
                color: AppColors.bookingStatusCompleted,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (value.isNotEmpty)
            Center(
              child: Text(
                value,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
        ],
      ),
    );
  }

  /// A reusable 2-column layout for booking details
  Widget _buildDetailsSection({
    required List<Widget> leftColumn,
    required List<Widget> rightColumn,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.allScreenBGColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: leftColumn)),
          const SizedBox(width: 16),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: rightColumn)),
        ],
      ),
    );
  }
}

class LabelValueWidget extends StatelessWidget {
  final String label;
  final String value;

  const LabelValueWidget({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: AppColors.bookingStatusCompleted,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
