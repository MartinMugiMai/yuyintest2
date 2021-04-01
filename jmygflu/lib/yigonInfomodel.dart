import 'dart:convert';
class YiGongInfoModel{
  //String image;
  //String userId;
  //String password;
  //String verifycode;
  int resultCode;
  String msg;
  String realName;
  String deptName;
  //String sessionStr;
  //String chatId;
  YiGongInfoModel({this.resultCode, this.msg, this.realName, this.deptName});
  

  YiGongInfoModel.fromJson(Map<String, dynamic> json){
    //image = json['image'];
    resultCode = json['result'];
    msg = json['msg'];
    realName = json['data''RealName'];
    //chatId = json['chatId'];
    print(msg);
    //print(sessionStr);
    print(resultCode);
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    //data['UserId'] = this.userId;
    //data['Password'] = this.password;
  }
}