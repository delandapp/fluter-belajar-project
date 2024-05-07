import 'dart:convert';

import 'package:http/http.dart' as http;
class HttpStateful {
  String id,fullname,email,avatar;

  HttpStateful({this.id = "",this.fullname = "",this.email = "",this.avatar = "",});

  static Future<HttpStateful> connectAPI(String id) async {
    Uri uri = Uri.parse("https://reqres.in/api/users/${id}");

    var hasilResponse = await http.get(uri);

    var data = (json.decode(hasilResponse.body))["data"];

    print(data["email"]);
    return HttpStateful(id: data['id'].toString(), fullname: data['first_name'] + " " + data['last_name'], email: data['email'], avatar: data['avatar']);
  }
}
