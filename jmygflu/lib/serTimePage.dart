import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jmygflu/sessionStrmodel.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:jmygflu/HttpDio.dart';
import 'package:x5_webview/x5_webview.dart';
import 'package:x5_webview/x5_sdk.dart';
import 'package:flutter/src/foundation/platform.dart';


class SerTimePage extends StatefulWidget {
  @override
  _SerTimePageState createState() => _SerTimePageState();
}

class _SerTimePageState extends State<SerTimePage> {


  @override
  void initState() { 
    super.initState();
    var isOk =  X5Sdk.init();
    if (isOk == 1) {
      print('x5 get');
      
    }else if (isOk == 0){
      print('x5 no');

    }
  }
  
  //String newUrl = 'http://113.107.136.252/Mobile/Service/userinfo.do?sessionStr=${Provider.of<SessionStr>(context, listen: true).sessionStr}';
  //String hereSessionStr = Provider.of<SessionStr>(context, listen: true).sessionStr;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('服务时长'),
      ),
      body:WebView(
        initialUrl: 'http://113.107.136.252/Mobile/Member/serviceTotal.do?sessionStr=${Provider.of<SessionStr>(context, listen: true).sessionStr}',
        javascriptMode: JavascriptMode.unrestricted,      
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}