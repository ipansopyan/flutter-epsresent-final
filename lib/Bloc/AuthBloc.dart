import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';



class AuthBloc{

  String name;
  String email;
  String password;
  String status;
  String token;

  AuthBloc({this.name,this.token,this.email,this.password});

  factory AuthBloc.loginResult(Map<String, dynamic> object){
    return AuthBloc(
      name: object['name'],
      email: object['email'],
      password: object['password'],
      token: object['token']
    );
  }

  static Future<AuthBloc> loginData(String email, String password) async {
    String myUrl  = "http://192.168.43.184:8000/api/auth/login";
    var loginResult = await http.post(myUrl,
    body: {"email": email,"password": password}
    );

    var jsonObject  = json.decode(loginResult.body);
    if (loginResult.statusCode == 200) {
      _save(jsonObject["token"]);
      _saveid(jsonObject["id"].toString());
      return AuthBloc.loginResult(jsonObject);
    } else if(loginResult.statusCode == 401) {
      print("teu konek");
    } else if(loginResult.statusCode == 404){
      print("tidak konek ke server");
    }

  }
}

 _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  _saveid(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final keyid = 'id';
    final valueid = id;
    prefs.setString(keyid, valueid);
  }