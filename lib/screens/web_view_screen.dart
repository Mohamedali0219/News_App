import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Web View'),
        ),
        body: WebViewWidget(
          controller: WebViewController()..loadRequest(Uri.parse(url)),
        ));
  }
}
