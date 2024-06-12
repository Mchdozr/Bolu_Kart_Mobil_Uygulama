import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodePage extends StatelessWidget {
  final String randomString;

  const QrCodePage({required this.randomString, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Kodu'),
      ),
      body: Center(
        child: QrImageView(
          data: randomString,
          version: QrVersions.auto,
          size: 200.0,
        ),
      ),
    );
  }
}
