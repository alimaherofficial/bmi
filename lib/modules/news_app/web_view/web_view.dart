import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  
  final String? url;
  // ignore: use_key_in_widget_constructors
   const WebViewScreen(this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  WebView(
        // ignore: unnecessary_string_interpolations
        initialUrl: url,
      ),
    );
  }
}
