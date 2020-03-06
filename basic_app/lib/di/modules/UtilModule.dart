import 'package:basic_app/di/AbstractModule.dart';
import 'package:basic_app/util/SharedPrefsUtil.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class UtilModule extends AbstractModule {
  static final UtilModule _utilModule = UtilModule._internal();

  factory UtilModule() {
    return _utilModule;
  }
  UtilModule._internal();

  @override
  void configure(Injector injector) {
    injector.map<SharedPrefsUtil>((_) => SharedPrefsUtil(), isSingleton: true);
  }
}
