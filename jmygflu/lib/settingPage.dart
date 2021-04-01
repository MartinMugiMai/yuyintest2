import 'package:jmygflu/x5BootStateModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jmygflu/main.dart';
class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('设置与关于'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment : MainAxisAlignment.spaceAround,
              children: [
                Text("启用x5内核提高webview性能（仅安卓系统有效）"),
                CupertinoSwitch(
                  value: Provider.of<X5BootState>(context, listen: false).x5BootState,
                  onChanged: (bool value) { 
                    setState(() { 
                      this._switchValue = value; 
                      //用状态管理将x5内核的状态变量全局化
                      Provider.of<X5BootState>(context, listen: false).gaix5BootState(this._switchValue);
                      print(Provider.of<X5BootState>(context, listen: false).x5BootState);
                    }); 
                  },
                ),
              ],
            ),
            Image.asset('assets/flujmyg.png'),
            Text('本APP基于Flutter框架实现江门义工信息查询'),
            // ListView(
            //   scrollDirection: Axis.vertical,
            //   shrinkWrap: false,
            //   children: [
            //     CupertinoSwitch(
            //       value: this._switchValue,
            //       onChanged: (bool value) { 
            //         setState(() { 
            //           this._switchValue = value; 
            //         }); 
            //       },
            //     ),

            //   ],
            // )
          ],
        ),
      ),
      
    );
  }
}