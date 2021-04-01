import 'package:jmygflu/denglumodel.dart';
import 'package:jmygflu/firstpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:jmygflu/countermodel.dart';
import 'package:provider/provider.dart';
import 'package:jmygflu/HttpDio.dart';
import 'dart:convert';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:jmygflu/sessionStrmodel.dart';
import 'package:jmygflu/ygInfoModel.dart';
import 'package:jmygflu/localRealNameModel.dart';
import 'package:jmygflu/localDeptNameModel.dart';
import 'package:jmygflu/localGyCardNoModel.dart';

class DengLuView extends StatefulWidget {
  @override
  _DengLuViewState createState() => _DengLuViewState();
}

class _DengLuViewState extends State<DengLuView> {
  final userIdContrl = TextEditingController();
  final pswdIdContrl = TextEditingController();

  DengModel dengModel = DengModel();

  int dengStateCode = 1;

  YgInfoModel ygInfo = YgInfoModel();

  String localRealName = '233';
  String localDeptName = '233';
  String localGyCardNo = '233';

  @override
  void initState() {
    super.initState();
    //dengFunc();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    userIdContrl.dispose();
    pswdIdContrl.dispose();
  }

  String dengUserId = '';
  String dengPassword = '';
  void dengFunc() async {
    var url = 'http://113.107.136.252/Mobile/Service/login.do';
    Map<String, dynamic> formData = {
      'UserId': dengUserId,
      'Password': dengPassword
    };
    dengModel.userId = 'wyu3116003219';
    dengModel.password = 'maijunjie123';
    print(dengModel.toJson());
    await request(url, formData: formData).then((value) {
      var data = json.decode(value.toString());
      print(data.toString());
      dengModel = DengModel.fromJson(data); //将返回的json数据传入dengModel实例
      print(dengModel.resultCode);
      dengStateCode = dengModel.resultCode;

      //将返回的sessionStr的数据通过provider状态管理回传给其他有需要用到的页面
      Provider.of<SessionStr>(context, listen: false)
          .addSessionStr(dengModel.sessionStr);
      if (dengStateCode == 1) {
        print('登录失败');

        SVProgressHUD.showError(status: '登录失败');
        SVProgressHUD.dismiss(delay: Duration(milliseconds: 1500));
        //SVProgressHUD.dismissWithDelay(1500);
        dengStateCode = 1;
      } else if (dengStateCode == 0) {
        dengFunc3(dengModel.sessionStr);
        print('登录成功');
        SVProgressHUD.showSuccess(status: '登录成功');
        SVProgressHUD.dismiss(delay: Duration(milliseconds: 1500));

        dengStateCode = 1;
        // Provider.of<SessionStr>(context, listen: false).addSessionStr(dengModel.sessionStr);

        Navigator.pop(context, MaterialPageRoute(builder: (context) {
          return FirstPage();
        })); //成功的话就返回上一页
      }
    });
  }

  void dengFunc3(String gotSessionStr) async {
    var url = 'http://113.107.136.252/Mobile/Service/userinfo.do';
    Map<String, dynamic> formData = {'sessionStr': gotSessionStr};
    //dengModel.userId = 'wyu3116003219';
    //dengModel.password = 'maijunjie123';
    //print(dengModel.toJson());
    await request(url, formData: formData).then((value) {
      var data = json.decode(value.toString());
      //print(data.toString());
      //dengModel = DengModel.fromJson(data);
      ygInfo = YgInfoModel.fromJson(data);
      print('bbbbbbbbbbbbbbb');
      print(ygInfo.msg);
      print(ygInfo.data[0].RealName);
      localRealName = ygInfo.data[0].RealName;
      Provider.of<LocalRealName>(context, listen: false)
          .addLocalRealName(localRealName);
      print(localRealName);
      print(ygInfo.data[0].DeptName);
      localDeptName = ygInfo.data[0].DeptName;
      Provider.of<LocalDeptName>(context, listen: false)
          .addlocalDeptName(localDeptName);
      print(localDeptName);
      print(ygInfo.data[0].GyCardNo);
      localGyCardNo = ygInfo.data[0].GyCardNo;
      Provider.of<LocalGyCardNo>(context, listen: false)
          .addlocalGyCardNo(localGyCardNo);
      print(localGyCardNo);
      //print(dengModel.resultCode);
      //dengStateCode = dengModel.resultCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        //Text("${Provider.of<Counter>(context, listen: true).count}"),
        CupertinoTextField(
          placeholder: '邑大同学的义工账号一般为wyu+学号',
          prefix: Text("用户名:"),
          controller: userIdContrl,
        ),
        CupertinoTextField(
          placeholder: '密码',
          prefix: Text("义工账户的密码:"),
          controller: pswdIdContrl,
          obscureText: true, //密码隐藏
        ),
        CupertinoButton(
            //按钮控件布局
            child: Text('登入'),
            //内边距
            padding: EdgeInsets.all(10.0),
            //背景颜色
            color: Colors.blue,
            //onPress 为 null，禁用点击的背景颜色
            disabledColor: Colors.grey,
            //最小尺寸
            minSize: 44.0,
            //按下的透明度
            pressedOpacity: 0.1,
            //边框圆角
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            //点击事件
            onPressed: () => {
                  print('点我干嘛'),
                  //加入登录函数
                  dengUserId = userIdContrl.text,
                  dengPassword = pswdIdContrl.text,
                  dengFunc(),
                }),
      ]),
    );
  }
}
