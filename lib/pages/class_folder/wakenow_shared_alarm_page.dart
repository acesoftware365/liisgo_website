import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WakeNowSharedAlarmPage extends StatelessWidget {
  const WakeNowSharedAlarmPage({super.key, required this.payload});

  final String payload;

  Uri get _intentUri => Uri.parse(
    'intent://liisgo.com/wakenow/shared-alarm/$payload'
    '#Intent;scheme=https;package=com.liisgo.wakenow;end',
  );

  Future<void> _openWakeNow() async {
    await launchUrl(_intentUri, webOnlyWindowName: '_self');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 440),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.alarm, size: 64),
                  const SizedBox(height: 20),
                  Text(
                    'Open WakeNow',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'This shared alarm opens in the WakeNow app.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: _openWakeNow,
                    child: const Text('Open WakeNow'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
