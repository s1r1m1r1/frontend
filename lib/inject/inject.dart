import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

import 'inject.config.dart';

@InjectableInit(preferRelativeImports: false)
configInjector(
  GetIt getIt, {
  String? env,
  EnvironmentFilter? environmentFilter,
}) {
  return getIt.init(environmentFilter: environmentFilter, environment: env);
}

const platformApple = Environment('apple');
const platformAndroid = Environment('android');
const platformWeb = Environment('web');
const platformProd = Environment('prod');
const admin = Environment('admin');
