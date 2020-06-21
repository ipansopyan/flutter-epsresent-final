import 'package:http/http.dart' as http;
import 'dart:convert';


class PresentBloc{

  String value;

  PresentBloc({this.value});

  factory PresentBloc.presentResult(Map<String, dynamic> object){
    return PresentBloc(
      value: object['value'],
    );
  }

  static Future<PresentBloc> presentData(String value) async {
    String myUrl  = "http://192.168.43.184:8000/api/present";
    var presentResult = await http.post(myUrl,
    body: {"value": value}
    );

    var jsonObject  = json.decode(presentResult.body);
    if (presentResult.statusCode == 200) {
      return PresentBloc.presentResult(jsonObject);
    } else if(presentResult.statusCode == 401) {
      print("teu konek");
    } else if(presentResult.statusCode == 404){
      print("tidak konek ke server");
    }

  }
  

}