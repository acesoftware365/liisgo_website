import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart'; // For showing a SnackBar or similar feedback

class UrlLauncherService {
  // Renamed the method to avoid conflict/confusion with the package's launchUrl
  static Future<void> openUrl(String urlString, {BuildContext? context}) async {
    final Uri? uri = Uri.tryParse(urlString);
    if (uri == null) {
      _showError(context, 'Invalid URL: $urlString');
      return;
    }

    // This correctly calls canLaunchUrl from the url_launcher package
    if (await canLaunchUrl(uri)) {
      try {
        // This now clearly calls launchUrl from the url_launcher package
        await launchUrl(uri);
      } catch (e) {
        _showError(context, 'Could not launch $urlString. Error: $e');
      }
    } else {
      _showError(context, 'Could not launch $urlString');
    }
  }

  static void _showError(BuildContext? context, String message) {
    print('UrlLauncherService Error: $message'); // Fallback print
    if (context != null && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }
}
