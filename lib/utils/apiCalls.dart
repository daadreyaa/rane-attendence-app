import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiCalls {
  static const _apiUrl = 'https://7505-2401-4900-1cd4-94fa-e907-c348-56bd-ef64.in.ngrok.io';

  static Future<dynamic> login(String userId, String password) async {
    Uri url = Uri.parse(_apiUrl + '/login');
    http.Response response = await http.post(url, body: {
      'user': userId,
      'password': password,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return decodedData['data'];
    }
    return null;
  }

  static Future<dynamic> getAttendance(String date, String userBiometric) async {
    Uri url = Uri.parse(_apiUrl + '/attendanceOfDay?date=$date&userBiometric=$userBiometric');
    print('called $url');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      print('called decodedData' + decodedData.toString());
      return decodedData['data'];
    }
    return null;
  }
}
