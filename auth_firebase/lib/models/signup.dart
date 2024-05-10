import 'package:quiver/core.dart';

class SignupData {
  final String name;
  final String password;

  SignupData({
    required this.name,
    required this.password,
  });

  @override
  String toString() {
    return '$runtimeType($name, $password)';
  }

  @override
  bool operator ==(Object other) {
    if (other is SignupData) {
      return name == other.name && password == other.password;
    }
    return false;
  }

  @override
  int get hashCode => hash2(name, password);
}
