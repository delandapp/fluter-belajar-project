import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpStateful {
  String id, name, job, createdAt;
  HttpStateful(
      {this.id = "",
      this.name = "",
      this.job = "",
      this.createdAt = ""});

  // Agar Bisa digunakan di kelas lain (terekpos) maka harus menggukan static
  // Agar Bisa digunakan di mengambil return maka harus menggunakan Future .then()
  static Future connectAPI(String name, String jobs) async {
    Uri url = Uri.parse("https://reqres.in/api/users");

    // kita kasih await agar pas json.decode bisa menggunakan .body
    var hasilResponse = await http.post(
      url,
      body: {"name": name, "job": jobs},
    );


    var data = json.decode(hasilResponse.body);

    // Memasukan data response ke class HttpStatefull
    return HttpStateful(id: data["id"], name: data["name"], job: data["job"], createdAt: data["createdAt"]);
  }
}
