import 'package:flutter/material.dart';
import 'package:jmygflu/sessionStrmodel.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:jmygflu/HttpDio.dart';

class HistorySerPage extends StatefulWidget {
  @override
  _HistorySerPageState createState() => _HistorySerPageState();
}

class _HistorySerPageState extends State<HistorySerPage> {
  //String newUrl = 'http://113.107.136.252/Mobile/Service/userinfo.do?sessionStr=${Provider.of<SessionStr>(context, listen: true).sessionStr}';
  //String hereSessionStr = Provider.of<SessionStr>(context, listen: true).sessionStr;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('历史服务'),
      ),
      body: WebView(
        initialUrl: 'http://113.107.136.252/Mobile/Member/activityList.do?type=3&sessionStr=${Provider.of<SessionStr>(context, listen: true).sessionStr}',
        javascriptMode: JavascriptMode.unrestricted,      
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}