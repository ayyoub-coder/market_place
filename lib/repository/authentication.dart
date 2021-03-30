

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:market_place/api/api_utility.dart';
import 'package:market_place/model/user.dart';
//import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:market_place/model/user_odoo.dart';
import 'package:odoo_api/odoo_api.dart';
import 'package:odoo_api/odoo_api_connector.dart';
import 'package:odoo_api/odoo_user_response.dart';

class Authentication{


  UserOdoo users ;
  Future<UserOdoo> login (String dataBase, String user , String password )async{

    var uri = ApiUtl.MAIN_API_URL;

   BaseOptions options = BaseOptions(
        baseUrl: uri,
        responseType: ResponseType.plain,
        connectTimeout: 30000,
        receiveTimeout: 30000,
        validateStatus: (code) {
          if (code >= 200) {
            return true;
          }
          else return false;
        });

    Dio dio = Dio(options);
    Map<String ,dynamic> body = {
      "jsonrpc": "2.0",
      'params' : {
        "db":dataBase,
        "login":user,
        "password":password
      },
    };

    Options option_head = Options(
      headers: {"Content-Type": "application/json"},
    );

    Response response  = await dio.post(ApiUtl.AUTH_LOGIN, options: option_head ,data:  body );

    print('${response.statusCode}');


    if(response.statusCode == 200){

      var data = json.decode(response.data);
      users = UserOdoo.fromJson(data);
      print('*****response  ${json.decode(response.data)}');

     print('eroorrrrr ${users.result.name}');


    }
      return null ;
  }




/////// *************** Login with package odoo********************////////
/*

  var client = OdooClient("http://51.91.158.179:8069");
  Future<UserOdoo> getOrders() async {
    final domain = [];
    var fields = ["id", "name", "confirmation_date", "partner_id"];
    AuthenticateCallback auth =
    await client.authenticate("admin", "admin", "market_place");
    if (auth.isSuccess) {
      final user = auth.getUser();
      print(" if success: Hey ${user.username}");
    } else {
      print("Login failed");
    }

    OdooResponse result = await client.searchRead("sale.order", domain, fields);
    if (!result.hasError()) {
      print("Successful");
      var response = result.getResult();
      var data = json.encode(response['records']);
      var decoded = json.decode(data);
      print(data);

     users= UserOdoo.fromJson(decoded);
     print(users);

      return users;
    } else {
      print(result.getError());
    }
  }
*/
}