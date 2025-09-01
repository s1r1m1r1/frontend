// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chopper/chopper.dart' as _i31;
import 'package:frontend/core/db/db_client.dart' as _i522;
import 'package:frontend/core/db/db_module.dart' as _i940;
import 'package:frontend/core/network/authenticator.dart' as _i372;
import 'package:frontend/core/network/chopper_interceptor.dart' as _i177;
import 'package:frontend/core/network/chopper_module.dart' as _i1007;
import 'package:frontend/core/network/registration_api.dart' as _i199;
import 'package:frontend/core/network/with_token_api.dart' as _i1054;
import 'package:frontend/core/network/ws_manager.dart' as _i684;
import 'package:frontend/core/network/ws_repository.dart' as _i848;
import 'package:frontend/core/network/ws_socket_module.dart' as _i558;
import 'package:frontend/features/auth/domain/auth_repository.dart' as _i887;
import 'package:frontend/features/auth/domain/token_repository.dart' as _i960;
import 'package:frontend/features/auth/logic/login_notifier.dart' as _i34;
import 'package:frontend/features/auth/logic/session_notifier.dart' as _i943;
import 'package:frontend/features/auth/logic/signup_notifier.dart' as _i368;
import 'package:frontend/features/auth/logic/token_notifier.dart' as _i1036;
import 'package:frontend/features/menu/domain/arena_repository.dart' as _i325;
import 'package:frontend/features/menu/domain/main_chat_repository.dart'
    as _i346;
import 'package:frontend/features/menu/logic/arena_board_notifier.dart'
    as _i969;
import 'package:frontend/features/menu/logic/chat_member_notifier.dart'
    as _i993;
import 'package:frontend/features/menu/logic/joined_broadcast_notifier.dart'
    as _i871;
import 'package:frontend/features/menu/logic/letters_notifier.dart' as _i696;
import 'package:frontend/features/menu/logic/ws_connection_notifier.dart'
    as _i869;
import 'package:frontend/features/unit/domain/unit_repository.dart' as _i92;
import 'package:frontend/features/unit/logic/create_unit_notifier.dart'
    as _i538;
import 'package:frontend/features/unit/logic/selected_unit_notifier.dart'
    as _i206;
import 'package:frontend/features/unit/logic/unit_notifier.dart' as _i388;
import 'package:frontend/inject/app_config.dart' as _i716;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:web_socket_client/web_socket_client.dart' as _i948;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dbClientModule = _$DbClientModule();
    final appConfigModule = _$AppConfigModule();
    final chopperModule = _$ChopperModule();
    final wsSocketModule = _$WsSocketModule();
    gh.lazySingleton<_i848.WsRepository>(() => _i848.WsRepository());
    gh.lazySingleton<_i522.DbClient>(() => dbClientModule.dbClient);
    gh.lazySingleton<_i346.MainChatRepository>(
      () => _i346.MainChatRepository(),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i325.ArenaRepository>(() => _i325.ArenaRepository());
    gh.lazySingleton<_i716.AppConfig>(
      () => appConfigModule.appConfigDev,
      registerFor: {_dev},
    );
    gh.factory<_i871.BroadcastInfoNotifier>(
      () => _i871.BroadcastInfoNotifier(gh<_i848.WsRepository>()),
    );
    gh.factory<_i969.ArenaBoardNotifier>(
      () => _i969.ArenaBoardNotifier(gh<_i848.WsRepository>()),
    );
    gh.lazySingleton<_i684.WsManager>(
      () => _i684.WsManager(gh<_i848.WsRepository>()),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i993.ChatMemberNotifier>(
      () => _i993.ChatMemberNotifier(gh<_i848.WsRepository>()),
    );
    gh.factoryParam<_i696.LettersNotifier, int, int>(
      (_roomId, _senderId) =>
          _i696.LettersNotifier(gh<_i848.WsRepository>(), _roomId, _senderId),
    );
    gh.lazySingleton<_i716.AppConfig>(
      () => appConfigModule.appConfigProd,
      registerFor: {_prod},
    );
    gh.factory<_i869.WsConnectionNotifier>(
      () => _i869.WsConnectionNotifier(gh<_i684.WsManager>()),
    );
    gh.lazySingleton<_i31.ChopperClient>(
      () => chopperModule.regClient(gh<_i716.AppConfig>()),
      instanceName: 'reg',
    );
    gh.lazySingleton<_i199.RegistrationApi>(
      () => chopperModule.registrationApi(
        gh<_i31.ChopperClient>(instanceName: 'reg'),
      ),
    );
    gh.lazySingleton<_i960.TokenRepository>(
      () => _i960.TokenRepository(
        gh<_i522.DbClient>(),
        gh<_i199.RegistrationApi>(),
      ),
    );
    gh.factory<_i177.BearerInterceptor>(
      () => _i177.BearerInterceptor(gh<_i960.TokenRepository>()),
    );
    gh.factory<_i1036.TokenNotifier>(
      () => _i1036.TokenNotifier(gh<_i960.TokenRepository>()),
    );
    gh.factory<_i372.TokenAuthenticator>(
      () => _i372.TokenAuthenticator(gh<_i960.TokenRepository>()),
    );
    gh.lazySingleton<_i31.ChopperClient>(
      () => chopperModule.chopperClient(
        gh<_i372.TokenAuthenticator>(),
        gh<_i177.BearerInterceptor>(),
        gh<_i716.AppConfig>(),
      ),
      instanceName: 'withToken',
    );
    gh.lazySingleton<_i1054.WithTokenApi>(
      () => chopperModule.protectedApiService(
        gh<_i31.ChopperClient>(instanceName: 'withToken'),
      ),
    );
    gh.lazySingleton<_i92.UnitRepository>(
      () => _i92.UnitRepository(gh<_i1054.WithTokenApi>()),
    );
    gh.factory<_i206.SelectedUnitNotifier>(
      () => _i206.SelectedUnitNotifier(gh<_i92.UnitRepository>()),
    );
    gh.factory<_i388.UnitNotifier>(
      () => _i388.UnitNotifier(gh<_i92.UnitRepository>()),
    );
    gh.lazySingleton<_i887.AuthRepository>(
      () => _i887.AuthRepository(
        gh<_i199.RegistrationApi>(),
        gh<_i1054.WithTokenApi>(),
      ),
    );
    gh.factory<_i538.CreateUnitNotifier>(
      () => _i538.CreateUnitNotifier(gh<_i92.UnitRepository>()),
    );
    gh.factory<_i948.WebSocket>(
      () =>
          wsSocketModule.ws(gh<_i716.AppConfig>(), gh<_i887.AuthRepository>()),
    );
    gh.lazySingleton<_i943.SessionNotifier>(
      () => _i943.SessionNotifier(
        gh<_i887.AuthRepository>(),
        gh<_i960.TokenRepository>(),
        gh<_i848.WsRepository>(),
      ),
    );
    gh.factory<_i368.SignupNotifier>(
      () => _i368.SignupNotifier(
        gh<_i887.AuthRepository>(),
        gh<_i960.TokenRepository>(),
      ),
    );
    gh.factory<_i34.LoginNotifier>(
      () => _i34.LoginNotifier(
        gh<_i887.AuthRepository>(),
        gh<_i960.TokenRepository>(),
      ),
    );
    return this;
  }
}

class _$DbClientModule extends _i940.DbClientModule {}

class _$AppConfigModule extends _i716.AppConfigModule {}

class _$ChopperModule extends _i1007.ChopperModule {}

class _$WsSocketModule extends _i558.WsSocketModule {}
