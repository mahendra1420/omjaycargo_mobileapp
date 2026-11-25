import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omjaycargo/assets/app_colors.dart';
import 'package:omjaycargo/data/controller/rate_calculator_controller.dart';
import 'package:omjaycargo/helpers/helper.dart';
import '../assets/app_assets.dart';
import '../data/models/rate_calculator_model.dart';
import '../generated/l10n.dart';
import '../helpers/screen_constant.dart';

class RateCalculator extends StatefulWidget {
  const RateCalculator({Key? key}) : super(key: key);

  @override
  State<RateCalculator> createState() => _RateCalculatorState();
}

class _RateCalculatorState extends State<RateCalculator> {
  final RateMasterController rateMasterController = Get.put(RateMasterController());

  final List<String> zoneTypes = ['domestic_zone', 'international_zone'];
  final List<String> docTypes = ['NON-DOC', 'DOC'];

  String? selectedZone;
  String? selectedCountry;
  String? selectedDocType;
  final TextEditingController weightCtrl = TextEditingController();

  @override
  void dispose() {
    weightCtrl.dispose();
    super.dispose();
  }

  Widget requiredLabel(String label, {bool required = true}) {
    const double labelFontSize = 16;
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: label,
            style: TextStyle(
              color: Colors.blue.shade900,
              fontSize: labelFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (required)
            WidgetSpan(
              alignment: PlaceholderAlignment.top,
              child: Transform.translate(
                offset: const Offset(1, -4),
                child: Text(
                  '*',
                  style: TextStyle(
                    color: AppColors.secoundPrimary,
                    fontSize: labelFontSize * 1.15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  InputDecoration inputDecor() => InputDecoration(
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
  );

  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = 16;

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
          S.current.rate_master,
          style: TextStyle(
            color: AppColors.bookingStatusCompleted,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 18),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
              BoxShadow(
              color: Colors.pink.shade100, // 🌸 soft pink
                blurRadius: 10,
                spreadRadius: 0,
                offset: const Offset(0, 0),
              ),
                ],
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  // Row 1 : Zone Type + Country
                  Row(
                    children: [
                      // Zone
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            requiredLabel(S.current.zone_type),
                            DropdownButtonFormField<String>(
                              isExpanded: true,
                              value: selectedZone,
                              items: zoneTypes
                                  .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e, style: const TextStyle(fontSize: 14)),
                              ))
                                  .toList(),
                              onChanged: (v) => setState(() => selectedZone = v),
                              decoration: inputDecor(),
                              hint: const Text('Select Zone', style: TextStyle(fontSize: 14)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Country (Dialog Search)
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            requiredLabel(S.current.dest_country_mandatory),
                            GestureDetector(
                              onTap: () async {
                                if (selectedZone == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Please select Zone Type first')),
                                  );
                                  return;
                                }

                                final selected = await showDialog<String>(
                                  context: context,
                                  builder: (context) {
                                    return CountrySearchDialog(
                                      zoneType: selectedZone!,
                                      controller: rateMasterController,
                                    );
                                  },
                                );

                                if (selected != null) {
                                  setState(() => selectedCountry = selected);
                                }
                              },
                              child: AbsorbPointer(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: selectedCountry ?? 'Select Destination Country',
                                    hintStyle: const TextStyle(color: Colors.black),
                                    suffixIcon: const Icon(Icons.arrow_drop_down),
                                    isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 8,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: const BorderSide(color: Colors.black),
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

                  const SizedBox(height: 12),

                  // Row 2 : Doc Type + Weight
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            requiredLabel(S.current.doc_type),
                            DropdownButtonFormField<String>(
                              isExpanded: true,
                              value: selectedDocType,
                              items: docTypes
                                  .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e, style: const TextStyle(fontSize: 14)),
                              ))
                                  .toList(),
                              onChanged: (v) => setState(() => selectedDocType = v),
                              decoration: inputDecor(),
                              hint: const Text('Select Doc Type', style: TextStyle(fontSize: 14)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            requiredLabel(S.current.weight_kg, required: false),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: weightCtrl,
                              decoration: inputDecor(),
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  // Submit button
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (selectedZone == null ||
                            selectedCountry == null ||
                            selectedDocType == null ||
                            weightCtrl.text.trim().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Please fill all required fields')),
                          );
                          return;
                        }

                        // 🔹 Call API
                        await rateMasterController.rateCalculator(
                          selectedCountry!,
                          selectedZone!,
                          "12345", // 👉 replace with real customerId
                          selectedDocType!,
                          weightCtrl.text.trim(),
                        );

                        // 🔹 Handle response
                        final response = rateMasterController.rateCalculatorResponse.value;
                        if (response?.result == true && response?.data?.isNotEmpty == true) {
                          final data = response!.data!.first;
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(response?.message ?? 'No rate found')),
                          );
                        }
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade600,
                        padding: const EdgeInsets.symmetric(horizontal: 36),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      ),
                      child: const Text('SUBMIT', style: TextStyle(color: AppColors.white)),
                    ),
                  ),
                ],
              ),
            ),

            Helper.verticalSpace(16),
            Text(
              S.current.applied_rate_charges,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue.shade900,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Table Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  horizontal: 14, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Service\nName",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Total",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Action",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

          Obx(() {
            final response = rateMasterController.rateCalculatorResponse.value;
            final dataList = response?.data ?? [];

            if (rateMasterController.isLoading.value) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Center(
                    child: CircularProgressIndicator(color: Colors.red)),
              );
            }

            if (dataList.isEmpty) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Center(
                  child: Text(
                    "No services available",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              );
            }
            return

              ListView.builder(
                shrinkWrap: true,
                itemCount:dataList.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = dataList[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.pink.shade100, // 🌸 soft pink
                            blurRadius: 10,
                            spreadRadius: 0,
                            offset: const Offset(0, 0),
                          ),
                        ],
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            item.productName ?? '-',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '${item.totalBookingAmt?.toStringAsFixed(2) ?? '0.00'}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => _showRateResultDialog(context, item),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: AppColors.bookingStatusCompleted,
                                  width: 2,
                                ),
                              ),
                              padding: const EdgeInsets.all(5),
                              child: Image.asset(AppAssets.icBackIcon, height: 14, width: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );

                },);
          })

          ],
        ),
      ),
    );
  }

  void _showRateResultDialog(BuildContext context, RateCalculatorList data) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: const Text('Rate Calculation Result'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _infoRow('Status', data.status ?? '-'),
                _infoRow('Courier Charge', '₹${data.courierCharge ?? 0}'),
                _infoRow('Fuel Surcharge', '₹${data.fuelSurchargeAmt ?? 0}'),
                _infoRow('Insurance Amt', '₹${data.insuranceAmt ?? '0'}'),
                _infoRow('GST Type', data.gSTType ?? '-'),
                _infoRow('Total Tax', '₹${data.totalTax ?? 0}'),
                _infoRow('Final Weight', '${data.finalWt ?? 0} kg'),
                _infoRow('Total Amount', '₹${data.totalBookingAmt ?? 0}',
                    highlight: true),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  Widget _infoRow(String label, String value, {bool highlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(
            value,
            style: TextStyle(
              color: highlight ? Colors.green.shade700 : Colors.black87,
              fontWeight: highlight ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }


}

class CountrySearchDialog extends StatefulWidget {
  final String zoneType;
  final RateMasterController controller;

  const CountrySearchDialog({
    Key? key,
    required this.zoneType,
    required this.controller,
  }) : super(key: key);

  @override
  State<CountrySearchDialog> createState() => _CountrySearchDialogState();
}

class _CountrySearchDialogState extends State<CountrySearchDialog> {
  final TextEditingController searchCtrl = TextEditingController();
  final RxString searchText = ''.obs;

  @override
  void dispose() {
    searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double maxDialogHeight = MediaQuery.of(context).size.height * 0.8;

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          final data = widget.controller.countryNameResponse.value?.data ?? [];
          final bool isLoading = widget.controller.isLoading.value;

          // 🔹 Each item roughly 56–60 px + header & search area height
          double listHeight = (data.length * 56) + 110;
          if (listHeight > maxDialogHeight) listHeight = maxDialogHeight;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            width: double.maxFinite,
            height: listHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Destination Country",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),

                // 🔹 Clean text field (bottom border only)
                TextField(
                  controller: searchCtrl,
                  decoration: const InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.2),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.4),
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  onChanged: (value) {
                    searchText.value = value;
                    if (value.length >= 2) {
                      widget.controller.countryName(value, widget.zoneType);
                    }
                  },
                ),

                const SizedBox(height: 10),

                // 🔹 List Area
                Expanded(
                  child: isLoading
                      ? const Center(
                    child: CircularProgressIndicator(color: Colors.red),
                  )
                      : data.isEmpty
                      ? const Center(
                    child: Text(
                      "No countries found",
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                      : ListView.separated(
                    shrinkWrap: true,
                    itemCount: data.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final item = data[index];
                      return ListTile(
                        title: Text(item.countryName ?? '-'),
                        onTap: () {
                          // ✅ Clear list before closing
                          widget.controller.countryNameResponse.value?.data?.clear();
                          widget.controller.countryNameResponse.refresh();
                          Navigator.pop(context, item.countryName);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

