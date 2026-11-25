import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Helper {
  static verticalSpace(double size) => SizedBox(height: size);
  static horizontalSpace(double size) => SizedBox(width: size);

  static Future<void> openPdfUrl(BuildContext context, String pdfUrl) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(color: Colors.blue),
      ),
    );

    await Future.delayed(const Duration(milliseconds: 300)); // ensure plugin initialized

    try {
      final Uri uri = Uri.parse(pdfUrl);

      // 🔥 This forces opening in a web browser (not Google Drive or PDF viewer)
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalNonBrowserApplication, // force browser
          webViewConfiguration: const WebViewConfiguration(enableJavaScript: true),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Could not open PDF link")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error opening PDF: $e")),
      );
      debugPrint("Error opening PDF: $e");
    } finally {
      Navigator.of(context, rootNavigator: true).pop(); // close loader
    }
  }
}
