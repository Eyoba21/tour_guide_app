import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:myapp/model/data_model.dart';
import 'package:myapp/model/user_model.dart';

class DataServices {
  var baseUrl = "http://10.0.2.2:8000/places";

  Future<List<DataModel>> getDataFromAPi() async {
    http.Response res = await http.get(Uri.parse(baseUrl));

    try {
      if (res.statusCode == 200) {
        List<dynamic> list = jsonDecode(res.body);
        print(list);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        throw Exception('Appi error');
      }
    } catch (e) {
      e.toString();
      rethrow;
    }
  }

  static Future<List<UserModel>> getUserFromApi() async {
    var urlForUser = "http://10.0.2.2:8000/users";
    http.Response resforUser = await http.get(Uri.parse(urlForUser));

    try {
      if (resforUser.statusCode == 200) {
        List<dynamic> listOfUser = jsonDecode(resforUser.body);
        print(listOfUser);
        return listOfUser.map((e) => UserModel.fromJson(e)).toList();
      } else {
        throw Exception('Api Error');
      }
    } catch (e) {
      e.toString();
      rethrow;
    }
  }
}
