import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:studize/screens/aiMentor/constants/api_consts.dart';
import 'package:studize/screens/aiMentor/models/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List> getModels() async {
    try {
     var response = await http.get(
        Uri.parse("$BASE_URL/models"),
        headers: {'Authorization': 'Bearer $API_KEY'},
      );
     
     Map jsonResposne = jsonDecode(response.body);
     if(jsonResposne['error']!= null)
     {
       // print("jsonResponse['error'] $jsonResposne['error']['message']");
       throw HttpException(jsonResposne['error']['message']);
     }
     // print("json resposne $jsonResposne");
     List temp =[];
     for(var value in jsonResposne["data"]) {
       temp.add(value);
       log("temp ${value["id"]}");
     }
     return ModelsModel.modelsFromSnapshot(temp);
    }
    catch (error) {
      log("error $error");
      rethrow;
    }
  }
}