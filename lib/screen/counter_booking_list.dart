import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omjaycargo/assets/app_colors.dart';
import 'package:omjaycargo/helpers/helper.dart';
import '../assets/app_assets.dart';
import '../data/controller/booking_details_controller.dart';
import '../data/shared_preference.dart';
import '../generated/l10n.dart';
import '../helpers/screen_constant.dart';
import 'package:intl/intl.dart';

class CounterBookingList extends StatefulWidget {
  const CounterBookingList({super.key});

  @override
  State<CounterBookingList> createState() => _CounterBookingListState();
}

class _CounterBookingListState extends State<CounterBookingList> {
  final CounterBookingDetailsController counterBookingDetailsController =
  Get.put(CounterBookingDetailsController());
  final TextEditingController _startDateCtrl = TextEditingController();
  final TextEditingController _endDateCtrl = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  bool _showSearch = false;

  @override
  void initState() {
    super.initState();
    _initBookingList();
  }

  Future<void> _initBookingList() async {
    final userId = await PreferenceManager.getUserId();
    if (userId != null) {
      await counterBookingDetailsController.bookingDetails(userId.toString());
    }
  }

  Future<void> _pickDate(
      BuildContext context, TextEditingController controller) async {
    final picked = await showDatePicker(
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
  Widget build(BuildContext context) {
    const double buttonSize = 30;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.allScreenBGColor,
        automaticallyImplyLeading: false,
        actions: [
          // back button
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: buttonSize,
              height: buttonSize,
              margin: const EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                    color: AppColors.bookingStatusCompleted, width: 2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Image.asset(AppAssets.icBackIcon),
              ),
            ),
          ),
          const Spacer(),
          Text(
            S.current.counter_booking,
            style: const TextStyle(
              color: AppColors.bookingStatusCompleted,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => setState(() => _showSearch = !_showSearch),
            child: Container(
              width: buttonSize,
              height: buttonSize,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                    color: AppColors.bookingStatusCompleted, width: 2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Image.asset(AppAssets.icSearchIcon),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => _showFilterBottomSheet(context),
            child: Container(
              width: buttonSize,
              height: buttonSize,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                    color: AppColors.bookingStatusCompleted, width: 2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Image.asset(AppAssets.icFilterIcon),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (_showSearch) _buildSearchField(),
            _buildHeaderRow(),
            Helper.verticalSpace(10),
            Expanded(child: Obx(() => _buildBookingList())),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search",
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
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
            GestureDetector(
              onTap: () async {
                FocusScope.of(context).unfocus();
                final query = _searchController.text.trim();
                final userId = await PreferenceManager.getUserId();
                if (userId != null) {
                  await counterBookingDetailsController.bookingDetails(
                    userId.toString(),
                    search: query.isNotEmpty ? query : null,
                  );
                }
              },
              child: Obx(() {
                final isLoading = counterBookingDetailsController.isLoading.value;
                return Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.errorColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: isLoading
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
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
        Helper.verticalSpace(10),
      ],
    );
  }

  Widget _buildHeaderRow() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 2))
        ],
        color: AppColors.allScreenBGColor,
        borderRadius: const BorderRadius.all(Radius.circular(14)),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Barcode\nNo.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.secoundPrimary,
                    fontSize: 12)),
            Text("Date",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.secoundPrimary,
                    fontSize: 12)),
            Text("City",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.secoundPrimary,
                    fontSize: 12)),
            Text("Receiver\nName",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.secoundPrimary,
                    fontSize: 12)),
            Text("Action",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.secoundPrimary,
                    fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingList() {
    final controller = counterBookingDetailsController;

    if (controller.isLoading.value && controller.bookingList.isEmpty) {
      return const Center(
          child: CircularProgressIndicator(color: AppColors.errorColor));
    }

    if (controller.bookingList.isEmpty) {
      return const Center(
        child: Text("No bookings found.",
            style: TextStyle(fontSize: 16, color: Colors.grey)),
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        if (!controller.isLoadingMore.value &&
            controller.hasMoreData.value &&
            scrollInfo.metrics.pixels >=
                scrollInfo.metrics.maxScrollExtent - 100) {
          // Trigger next page
          final userId = PreferenceManager.getUserId();
          if (userId != null) {
            controller.bookingDetails(userId.toString(), isLoadMore: true);
          }        }
        return false;
      },
      child: ListView.builder(
        itemCount: controller.bookingList.length + 1,
        itemBuilder: (context, index) {
          if (index == controller.bookingList.length) {
            return Obx(() => controller.isLoadingMore.value
                ? const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            )
                : const SizedBox.shrink());
          }

          final booking = controller.bookingList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.allScreenBGColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 4,
                      offset: const Offset(0, 0))
                ],
              ),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(booking.barcodeNo ?? "-",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold))),
                    Expanded(
                        child: Text(booking.bookingDate ?? "-",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold))),
                    Expanded(
                        child: Text(booking.destinationCity ?? "-",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold))),
                    Expanded(
                        child: Text(booking.receiverName ?? "-",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold))),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pushNamed(
                          AppScreen.counterBookingDetails,
                          arguments: {'booking': booking}),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                              color: AppColors.bookingStatusCompleted,
                              width: 2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset("assets/icons/ic_eye.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Filter",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  Divider(color: Colors.black,height: 0.5,thickness: 2,),
                  const SizedBox(height: 20),

                  Row(
                      children: [
                        Expanded(child: _buildDateField("Start Date", _startDateCtrl)),
                        Helper.horizontalSpace(10),
                        Expanded(child: _buildDateField("End Date", _endDateCtrl)),
                      ],
                  ),

                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // APPLY button
                      SizedBox(
                        width: 120, // 👈 control width here
                        child: InkWell(
                          onTap: () async {
                            Navigator.pop(context);
                            final userId = await PreferenceManager.getUserId();
                            if (userId != null) {
                              await counterBookingDetailsController.bookingDetails(
                                userId.toString(),
                                startDate: _startDateCtrl.text,
                                toDate: _endDateCtrl.text,
                              );
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.secoundPrimary,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              "APPLY",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 8),

                      // CLEAR button
                      SizedBox(
                        width: 120, // 👈 same width for consistency
                        child: InkWell(
                          onTap: () {
                            _startDateCtrl.clear();
                            _endDateCtrl.clear();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.errorColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              "CLEAR",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDateField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.black,
            fontSize: 14, // slightly smaller label
          ),
        ),
        const SizedBox(height: 6),

        // Compact TextField with reduced width and height
        SizedBox(
          width: 200, // 👈 control width here (adjust as needed)
          child: TextField(
            controller: controller,
            readOnly: true,
            onTap: () => _pickDate(context, controller),
            style: const TextStyle(fontSize: 13), // smaller text
            decoration: InputDecoration(
              isDense: true, // reduces height
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 12,
              ),
              suffixIcon: const Icon(
                Icons.calendar_today,
                size: 18, // smaller icon
                color: AppColors.errorColor,
              ),
              hintText: "",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.secoundPrimary,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
