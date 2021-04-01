import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jmygflu/countermodel.dart';
import 'package:jmygflu/firstpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:jmygflu/DengLuView.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    //return ItemView();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('登录页面'),
      ),
      body: Center(
        child: DengLuView(),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Provider.of<Counter>(context, listen: false).increment();
      //     print("${Provider.of<Counter>(context, listen: false).count}");
      //   },
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}