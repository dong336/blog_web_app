import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WebViewController _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onHttpError: (HttpResponseError error) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://naver.com')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://www.youtube.com/'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Code Factory'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              _controller.goBack();
            },
            icon: Icon(Icons.arrow_back),
          ),
          IconButton(
            onPressed: () {
              _controller.loadRequest(Uri.parse('https://www.youtube.com/'));
            },
            icon: Icon(Icons.home),
          ),
          IconButton(
            onPressed: () {
              _controller.goForward();
            },
            icon: Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
