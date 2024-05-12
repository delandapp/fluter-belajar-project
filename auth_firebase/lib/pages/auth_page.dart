import 'package:auth_firebase/models/signup.dart';
import 'package:auth_firebase/pages/home_page.dart';
import 'package:auth_firebase/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:provider/provider.dart';

const users = {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUserSignIn(LoginData data) {
    final auth = Provider.of<Auth>(context, listen: false);

    auth.signIn(data.name, data.password);
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    // return Future.delayed(loginTime).then((_) {
    //   if (!users.containsKey(data.name)) {
    //     return 'User not exists';
    //   }
    //   if (users[data.name] != data.password) {
    //     return 'Password does not match';
    //   }

    //   return null;
    // });
    return Future.delayed(loginTime).then((value) => null);
  }

  Future<String?> _signupUser(LoginData data) async{
    final auth = Provider.of<Auth>(context, listen: false);
    String? error;

    await auth.signUp(data.name, data.password).then((response) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Berhasil Registrasi"),
          duration: Duration(seconds: 2),
        ),
      );
      // Navigator.pop(context);
    }).catchError(
      (err) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(err.toString()),
            duration: const Duration(seconds: 2),
          ),
        );
        return error = err.toString();
      },
    );
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((value) => error);
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'ECORP',
      // logo: const AssetImage('assets/images/ecorp-lightblue.png'),
      onLogin: _authUserSignIn,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        print("Test Woy Anjing");
        Provider.of<Auth>(context, listen: false).tempData();
        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //   builder: (context) => HomePage(),
        // ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
