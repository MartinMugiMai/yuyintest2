import 'dart:convert';
class DengModel{
  //String image;
  String userId;
  String password;
  //String verifycode;
  int resultCode;
  String msg;
  String sessionStr;
  String chatId;
  DengModel({this.userId, this.password, this.resultCode, this.msg, this.sessionStr, this.chatId});
  

  DengModel.fromJson(Map<String, dynamic> json){
    //image = json['image'];
    resultCode = json['result'];
    msg = json['msg'];
    sessionStr = json['sessionStr'];
    chatId = json['chatId'];
    print(msg);
    print(sessionStr);
    print(resultCode);
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['UserId'] = this.userId;
    data['Password'] = this.password;
  }
}