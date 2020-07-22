import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';




class PresentBloc{

  String value;
  String prt;
  String matkul;
  String key;
  String mahasiswa;

  PresentBloc({this.value,this.prt,this.matkul,this.key,this.mahasiswa});

  factory PresentBloc.presentResult(Map<String, dynamic> object){
    return PresentBloc(
      value: object['value'],
      prt: object['prt'],
      matkul: object['matkul'],
      key: object['key'],
      mahasiswa: object['mahasiswa'],
    );
  }

  static Future<PresentBloc> presentData(String value) async {
    final prefs = await SharedPreferences.getInstance();
    final keyid = 'id';
    final valueid = prefs.get(keyid ) ?? 0;
    String myUrl  = value+'&mhs_id='+valueid;
    var presentResult = await http.post(myUrl);    
    
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