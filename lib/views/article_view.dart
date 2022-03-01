import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String blogUrl;
  ArticleView({Key? key, required this.blogUrl}) : super(key: key);
  // const ArticleView({Key? key}) : super(key: key);

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

  final Completer<WebViewController> _completer = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text("khabri",style: TextStyle(color: Colors.white),),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ) ,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl:widget.blogUrl ,
          allowsInlineMediaPlayback: true ,
          zoomEnabled: true ,
          onProgress: (int progress){
            print('WebView is loading (progress :$progress%)');
          },
          javascriptChannels: <JavascriptChannel>{
            _toasterJavascriptChannel(context),
          },
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: ((WebViewController webviewController){
            _completer.complete(webviewController);

          }),
        ),
      ),
    );
  }
}
JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
  return JavascriptChannel(
      name: 'Toaster',
      onMessageReceived: (JavascriptMessage message) {
        // ignore: deprecated_member_use
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text(message.message)),
        );
      });
}
