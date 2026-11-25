import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omjaycargo/assets/app_assets.dart';
import 'package:omjaycargo/assets/app_colors.dart';
import 'package:omjaycargo/data/controller/dashboard_controller.dart';
import 'package:omjaycargo/helpers/helper.dart';

import '../data/shared_preference.dart';
import '../generated/l10n.dart';
import '../helpers/screen_constant.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final double buttonSize = 30;
  final DashboardController dashboardController = Get.put(DashboardController());
  String? businessName;
  String? agentCode;

  @override
  void initState() {
    super.initState();
    _initDashboard();
  }

  void _initDashboard() async {
    final userId = await PreferenceManager.getUserId();
    businessName = await PreferenceManager.getFirstName();
    agentCode = await PreferenceManager.getAgentCode();
    if (userId != null) {
      await dashboardController.dashboard(userId.toString());
    }
    setState(() {});
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(context), // <- add this
      key: _scaffoldKey,
      backgroundColor: AppColors.allScreenBGColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,

        backgroundColor: AppColors.allScreenBGColor,
        actions: [
          Builder(
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                child: Container(
                  width: buttonSize,
                  height: buttonSize,
                  margin: const EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColors.bookingStatusCompleted),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.asset(AppAssets.icDrawer, height: 10, width: 10),
                  ),
                ),
              );
            },
          ),
          const Spacer(),
          Text(
            S.current.dashboard,
            style: const TextStyle(
              color: AppColors.bookingStatusCompleted,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Container(
            width: buttonSize,
            height: buttonSize,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: AppColors.bookingStatusCompleted),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset(AppAssets.icLogOut, height: 10, width: 10),
            ),
          ),
        ],
      ),

      /// 🌀 Observe loading + data states
      body: Obx(() {
        if (dashboardController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.red),
          );
        }

        if (dashboardController.dashBoardResponse.value == null) {
          return const Center(child: Text("No data found"));
        }

        return SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/img_logo.png"),
                Helper.verticalSpace(10),
                Text(
                  businessName ?? '',
                  style: const TextStyle(
                    color: AppColors.bookingStatusCompleted,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Helper.verticalSpace(2),
                Text(
                  "${S.current.account_code} ${agentCode ?? ''}",
                  style: const TextStyle(color: AppColors.primary, fontSize: 18),
                ),
                Helper.verticalSpace(20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        children: [
                          GridView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                              childAspectRatio: 1,
                            ),
                            children: [
                              DashboardButton(
                                color: AppColors.errorColor,
                                title: S.current.booking_details,
                                count: dashboardController
                                    .dashBoardResponse.value?.data?.bookingDetails
                                    .toString(),
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(AppScreen.counterBookingList);
                                },
                              ),
                              DashboardButton(
                                color: AppColors.errorColor,
                                title: S.current.invoice,
                                count: dashboardController
                                    .dashBoardResponse.value?.data?.invoice
                                    .toString(),
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(AppScreen.creditBillList);
                                },
                              ),
                              DashboardButton(
                                color: AppColors.errorColor,
                                title: S.current.rate_calculator,
                                icon: Icons.calculate,
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(AppScreen.rateCalculator);
                                },
                              ),
                              DashboardButton(
                                color: AppColors.secoundPrimary,
                                title: S.current.account_ledger,
                                icon: Icons.account_balance_wallet,
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(AppScreen.accountLedgerScreen);
                                },
                              ),
                              DashboardButton(
                                color: AppColors.secoundPrimary,
                                title: S.current.complaint_service,
                                icon: Icons.report_problem,
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(AppScreen.complainHistory);
                                },
                              ),
                              DashboardButton(
                                color: AppColors.secoundPrimary,
                                title: S.current.service_availability,
                                icon: Icons.local_shipping,
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      AppScreen.serviceAvailibilityScreen);
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Outstanding Amount
                          Container(
                            padding: EdgeInsets.only(bottom: 4),
                            decoration: BoxDecoration(
                              color: AppColors.errorColor,
                              borderRadius: BorderRadius.circular(16),

                            ),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 16,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),

                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 2.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Outstanding Amount",
                                      style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.secoundPrimary),
                                    ),
                                    Text(
                                      "₹${dashboardController.dashBoardResponse.value?.data?.outstandingAmt ?? ''}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.errorColor,
                                        fontSize: 26
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Helper.verticalSpace(10),

                Image.asset("assets/images/IMG_20251103_101032.png"),

              ],
            ),
          ),
        );
      }),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // 🔹 App Logo
            Center(
              child: Image.asset(AppAssets.icLogOut, height: 70),
            ),
            const SizedBox(height: 20),

            // 🔹 User Info Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _infoRow(Icons.person, "Name :", "GENIUS ORTHO PVT LTD"),
                  const SizedBox(height: 8),
                  _infoRow(Icons.phone, "Phone :", "9033701239"),
                  const SizedBox(height: 8),
                  _infoRow(Icons.email, "Email :", "GENIUS@GMAIL.COM"),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Divider(thickness: 1),
            ),

            // 🔹 Drawer Buttons
            _drawerButton(
              icon: Icons.person_outline,
              title: "My Profile",
              onTap: () {
                Navigator.of(context).pushNamed(AppScreen.rateCalculator);
              },
            ),
            _drawerButton(
              icon: Icons.share,
              title: "Share",
              onTap: () {
                // Share logic
              },
            ),
            _drawerButton(
              icon: Icons.star,
              title: "Rate",
              onTap: () {},
            ),
            _drawerButton(
              icon: Icons.logout,
              title: "Log Out",
              onTap: () {
                // Logout logic
              },
            ),

            const Spacer(),

            // 🔹 Footer Logos
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  const Text(
                    "Domestic & International Courier options",
                    style: TextStyle(fontSize: 10, color: Colors.black87),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "1 PLATFORM",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  const SizedBox(height: 6),
                  Image.asset(AppAssets.icLogOut, height: 28, fit: BoxFit.contain),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerButton({required IconData icon, required String title, VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.red),
              const SizedBox(width: 12),
              Text(title,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.red, size: 18),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: "$label ",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(
                  text: value,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

}

class DashboardButton extends StatelessWidget {
  final String title;
  final String? count;
  final IconData? icon;
  final Color? color;
  final VoidCallback? onTap;

  const DashboardButton({
    super.key,
    required this.title,
    this.count,
    this.icon,
    this.onTap,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),

        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),

          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ if (count == null)
              Icon(icon, color: Colors.red, size: 28)
            else
              Text(
                count!,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),

              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12,color: AppColors.secoundPrimary, fontWeight: FontWeight.bold, ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
