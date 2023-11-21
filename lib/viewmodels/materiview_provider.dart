import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MateriViewProvider with ChangeNotifier {
  late WebViewController _controller;

  WebViewController get controller => _controller;

  MateriViewProvider() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          // Define your delegate methods here
        ),
      )
      ..loadRequest(Uri.parse('https://docs.google.com/presentation/d/e/2PACX-1vTvfnPgcbOSS9DhfsSBowMhWni3hIN3zTj-HMg6UEO31ZzzCHgbHV6fvFlnv8yyadgnf48pm_SnM9RQ/pub?start=false&loop=false&delayms=3000'));
  }
}
