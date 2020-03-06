import 'package:basic_app/di/AbstractModule.dart';
import 'package:basic_app/di/modules/AuthModule.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class MainModule extends AbstractModule {

  static final MainModule _mainModule = MainModule._internal();

  factory MainModule() {
    return _mainModule;
  }

  MainModule._internal() {
    this.configure(injector);
  }

  @override
  void configure(Injector injector) {
    AuthModule().configure(injector);
  }
}
