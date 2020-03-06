import 'package:flutter_simple_dependency_injection/injector.dart';

abstract  class AbstractModule {
  Injector injector;
  void configure(Injector injector);

  AbstractModule() {
    injector ??= Injector.getInjector();
  }

  T get<T>({String key, Map<String, dynamic> additionalParams}) {
    return this.injector.get(key: key, additionalParameters: additionalParams);
  }
}