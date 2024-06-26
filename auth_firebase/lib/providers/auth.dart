import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Auth with ChangeNotifier {
  String? _idToken, _idUser;
  DateTime? _expiredDate;

  String? _tempIdToken, _tempIdUser;
  DateTime? _tempExpiredDate;

  void tempData() {
    _idToken = _tempIdToken;
    _idUser = _tempIdUser;
    _expiredDate = _tempExpiredDate;
    print("idToken adalah ${_idToken}");
    notifyListeners();
  }

  String? get idToken {
    if (_idToken != null &&
        _expiredDate != null &&
        _expiredDate!.isAfter(DateTime.now())) {
      return _idToken;
    } else {
      return null;
    }
  }

  String? get idUser {
    if (_idUser != null) {
      return _idUser;
    }

    return null;
  }

  signUp(String name, String password) async {
    //! Link Dokumentasi
    // https://firebase.google.com/docs/reference/rest/auth?hl=id
    //! key project berasal dari firebase project setting
    try {
      Uri url = Uri.parse(
          "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyABxrO8ice6bDDI8ExEBIyP4zsaCEzqxrU");

      var hasilPost = await http.post(url,
          body: json.encode({
            "returnSecureToken": true,
            "email": name,
            "password": password
          }));

      var response = json.decode(hasilPost.body);
      print(response);
      _tempIdToken = response["idToken"];
      _tempIdUser = response["localId"];
      _tempExpiredDate = DateTime.now()
          .add(Duration(seconds: int.parse(response["expiresIn"])));
      notifyListeners();
      if (hasilPost.statusCode > 300 || hasilPost.statusCode < 200) {
        throw response["error"]["message"];
      }
    } catch (e) {
      throw e;
    }
  }

  signIn(String name, String password) async {
    //! Link Dokumentasi
    // https://firebase.google.com/docs/reference/rest/auth?hl=id
    //! key project berasal dari firebase project setting
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyABxrO8ice6bDDI8ExEBIyP4zsaCEzqxrU");

    var hasilPost = await http.post(url,
        body: json.encode(
            {"returnSecureToken": true, "email": name, "password": password}));

    var response = json.decode(hasilPost.body);
    print(response);
    _tempIdToken = response["idToken"];
    _tempIdUser = response["localId"];
    _tempExpiredDate =
        DateTime.now().add(Duration(seconds: int.parse(response["expiresIn"])));
    notifyListeners();
  }
}
