// ignore_for_file: prefer_const_constructors

import 'dart:io';

 import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

 class GithubWebView extends StatefulWidget {
   final String githubUsername;
  const GithubWebView({Key? key, required this.githubUsername}) : super(key: key);

    
   @override
   GithubWebViewState createState() => GithubWebViewState();
 }

 class GithubWebViewState extends State<GithubWebView> {
   @override
   void initState() {
     super.initState();
     // Enable virtual display.
     if (Platform.isAndroid) WebView.platform = AndroidWebView();
   }

   @override
   Widget build(BuildContext context) {
     return WebView(
       initialUrl: 'https://githubmemory.com/@$widget.githubUsername',
     );
   }
 }