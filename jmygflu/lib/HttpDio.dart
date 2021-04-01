import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:async';
//import 'package:prividertest1/DengLu/Api.dart';
import 'dart:convert';

//class HttpDio {

  // List<Cookie> cookies = [
  //  new Cookie("JSESSIONID", 'E6380C9D9DDF3B166599C04709BCC08D'),
  //  ];


   Future request(url,{formData}) async{


    try{

      Response response;
      Dio dio = Dio();
      dio.options = BaseOptions(
        connectTimeout: 5000,
        receiveTimeout: 3000,);
      print(formData);
      response = await dio.post(url, queryParameters: formData);
      //response = await dio.request(url, queryParameters: formData);
      if(response.statusCode == 200){
        print(response.headers);
        return response;
      }else{
        throw Exception('接口异常');
      }

    }catch(e){
      return print('error::: ${e}');
    }

  }