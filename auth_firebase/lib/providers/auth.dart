import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Auth with ChangeNotifier {

  void signUp (String name, String password) async{
    //! Link Dokumentasi
    // https://firebase.google.com/docs/reference/rest/auth?hl=id
    //! key project berasal dari firebase project setting
    Uri url = Uri.parse("https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyABxrO8ice6bDDI8ExEBIyP4zsaCEzqxrU");

    var hasilPost = await http.post(url, body: json.encode({
      "returnSecureToken": true,
      "email": name,
      "password": password
    }));

    print(hasilPost.body);
  }

  void signIn (String name, String password) async{
    //! Link Dokumentasi
    // https://firebase.google.com/docs/reference/rest/auth?hl=id
    //! key project berasal dari firebase project setting
    Uri url = Uri.parse("https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyABxrO8ice6bDDI8ExEBIyP4zsaCEzqxrU");

    var hasilPost = await http.post(url, body: json.encode({
      "returnSecureToken": true,
      "email": name,
      "password": password
    }));

    print(hasilPost.body);
  }
}