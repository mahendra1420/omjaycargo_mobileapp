import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omjaycargo/assets/app_colors.dart';
import 'package:omjaycargo/data/controller/service_availbility_controller.dart';
import 'package:omjaycargo/helpers/helper.dart';
import '../assets/app_assets.dart';
import '../data/shared_preference.dart';
import '../generated/l10n.dart';

class ServiceAvailibilityScreen extends StatefulWidget {
  const ServiceAvailibilityScreen({super.key});

  @override
  State<ServiceAvailibilityScreen> createState() =>
      _ServiceAvailibilityScreenState();
}

class _ServiceAvailibilityScreenState extends State<ServiceAvailibilityScreen> {
  TextEditingController pinCodeController = TextEditingController();
  final ServiceAvailbilityController serviceAvailbilityController =
  Get.put(ServiceAvailbilityController());

  String? userId;

  @override
  void initState() {
    super.initState();
    _loadUserAndFetch();
  }

  void _loadUserAndFetch() async {
    final userId = await PreferenceManager.getUserId();
    if (userId != null) {
      await serviceAvailbilityController.serviceAvailbility(userId.toString(), "");
    }
  }

  void _onSearchPressed() async {
    print("in search call ---${pinCodeController.text}");
    if (pinCodeController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a pincode")),
      );
      return;
    }else{
      serviceAvailbilityController.serviceAvailbility(userId.toString(), pinCodeController.text.trim());
    }

    if (userId != null) {
      await serviceAvailbilityController
          .serviceAvailbility(userId!, pinCodeController.text.trim());
    }
  }
  String _formatProductName(String? name) {
    if (name == null || name.isEmpty) return '-';
    final parts = name.trim().split(' ');
    if (parts.length > 1) {
      return '${parts.first}...'; // show first word + ...
    }
    return parts.first; // show full word if single
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
          S.current.service_availability,
          style: TextStyle(
            color: AppColors.bookingStatusCompleted,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 24,
        ),
        child: Obx(() {
          final controller = serviceAvailbilityController;
          final response = controller.serviceAvailbilityResponse.value;

          return Stack(
            children: [
              // ---------- MAIN CONTENT ----------
              SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: TextFormField(
                              controller: pinCodeController,
                              decoration: InputDecoration(
                                hintText: S.current.hint_entre_your_pincode,
                                hintStyle: const TextStyle(color: Colors.grey),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: AppColors.secoundPrimary,
                                    width: 1.9,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: AppColors.secoundPrimary,
                                    width: 1.5,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 6,
                                ),
                              ),
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                        Helper.horizontalSpace(10),
                        ElevatedButton(
                          onPressed: _onSearchPressed,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade600,
                            padding: const EdgeInsets.symmetric(horizontal: 26),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: Text(
                            S.current.search,
                            style: TextStyle(color: AppColors.white),
                          ),
                        ),
                      ],
                    ),

                    Helper.verticalSpace(10),

                    Text(
                      "Available Service List",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue.shade900,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Helper.verticalSpace(10),

                    // Table Header
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 14,
                            spreadRadius: 4,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        border: Border.all(color: Colors.grey.shade200),
                      ),
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
                            S.current.availability,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.blue.shade900,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "ODA\nApplicable",
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

                    Helper.verticalSpace(18),

                    if (response == null || response.data == null || response.data!.isEmpty)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: Center(
                          child: Text(
                            "No services available",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    else
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: response.data!.length,
                        itemBuilder: (context, index) {
                          final item = response.data![index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 18),
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
                                    _formatProductName(item.productName),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  Container(
                                    decoration: BoxDecoration(
                                      color: item.availability == 1
                                          ? AppColors.secoundPrimary
                                          : AppColors.errorColor,borderRadius: BorderRadius.all(Radius.circular(5))
                                      
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Icon(
                                        item.availability == 1
                                            ? Icons.check
                                            : Icons.close,
                                        color: item.availability == 1
                                            ? Colors.white
                                            : Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color:  item.availability == 1
                                            ? AppColors.secoundPrimary
                                            : AppColors.errorColor,borderRadius: BorderRadius.all(Radius.circular(5))

                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Icon(
                                        item.availability == 1
                                            ? Icons.check
                                            : Icons.close,
                                        color: item.availability == 1
                                            ? Colors.white
                                            : Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ),

              // ---------- OVERLAY LOADER ----------
              if (controller.isLoading.value)
                Positioned.fill(
                  child: Container(
                    color: Colors.white.withOpacity(0.4),
                    child: const Center(
                      child: CircularProgressIndicator(color: Colors.red),
                    ),
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}
