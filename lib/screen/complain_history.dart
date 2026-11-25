import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:omjaycargo/assets/app_colors.dart';

import '../assets/app_assets.dart';
import '../generated/l10n.dart';
import '../helpers/screen_constant.dart';

class ComplainHistory extends StatefulWidget {
  const ComplainHistory({super.key});

  @override
  State<ComplainHistory> createState() => _ComplainHistoryState();
}

class _ComplainHistoryState extends State<ComplainHistory> {
  final TextEditingController startDateCtrl = TextEditingController();
  final TextEditingController endDateCtrl = TextEditingController();

  // Helper to pick date
  Future<void> pickDate(BuildContext context, TextEditingController controller) async {
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
          S.current.complain_history,
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
        child: Column(
          children: [
            // Your future content goes here
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).pushNamed(AppScreen.complainScreen);
        },
        backgroundColor: Colors.red,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
