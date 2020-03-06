import 'package:basic_app/di/AbstractModule.dart';
import 'package:basic_app/logic/firebase/Authetication.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class AuthModule extends AbstractModule {
  static final AuthModule _authModule = AuthModule._internal();

  factory AuthModule() {
    return _authModule;
  }
  AuthModule._internal();

  @override
  void configure(Injector injector) {
    injector.map<BaseAuth>((i) => Auth(), isSingleton: true);
  }
}
