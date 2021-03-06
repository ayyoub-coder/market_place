

import 'dart:convert';

import 'package:market_place/api/api_utility.dart';
import 'package:market_place/model/user.dart';
//import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class Authentication{


  Map<String, String > headers ={
    'Accept' :'Application/json'
  };

  Future<User> register (String  first_name, String last_name, String email , String password) async{



    Map<String,String> body ={
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'password': password,
    };

    http.Response response = await  http.post(ApiUtl.AUTH_REGISTER ,headers : headers, body:body );

    if(response.statusCode ==201){
      var body = jsonDecode(response.body);
      var data = body['data'];
      User user = User.fromJson(data);
      return user;
    }
    return null;
  }

  Future<User> login (String email ,String password)async{

    Map<String ,String> body = {
      'email' : email,
      'password' : password
    };

    http.Response response  = await http.post(ApiUtl.AUTH_LOGIN, headers:  headers,body: body);

    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      var data = body['data'];
        User user= User.fromJson(data);
        return user;
    }
      return null ;
  }


}