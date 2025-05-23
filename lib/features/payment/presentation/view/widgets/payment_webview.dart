import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebView extends StatelessWidget {
  final String iframeUrl;

  const PaymentWebView({super.key, required this.iframeUrl});

  @override
  Widget build(BuildContext context) {
    final url = Uri.tryParse(iframeUrl);

    if (url == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Payment')),
        body: const Center(child: Text('Invalid payment URL')),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(
          controller: WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..loadRequest(url),
        ),
      ),
    );
  }
}
