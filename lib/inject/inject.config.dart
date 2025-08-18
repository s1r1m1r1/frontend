// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:frontend/bloc/user/user_bloc.dart' as _i990;
import 'package:frontend/core/network/dio_module.dart' as _i339;
import 'package:frontend/core/network/protected_api_service.dart' as _i365;
import 'package:frontend/core/network/registration_api_service.dart' as _i436;
import 'package:frontend/core/network/ws_manager.dart' as _i684;
import 'package:frontend/core/network/ws_socket_module.dart' as _i558;
import 'package:frontend/db/db_client.dart' as _i569;
import 'package:frontend/db/db_modulte.dart' as _i788;
import 'package:frontend/features/admin/_domain/admin_repository.dart' as _i151;
import 'package:frontend/features/admin/bloc/admin_bloc.dart' as _i91;
import 'package:frontend/features/auth/domain/auth_repository.dart' as _i887;
import 'package:frontend/features/auth/domain/session_repository.dart' as _i166;
import 'package:frontend/features/auth/logic/auth_cubit.dart' as _i233;
import 'package:frontend/features/auth/logic/login.cubit.dart' as _i132;
import 'package:frontend/features/auth/logic/signup.bloc.dart' as _i415;
import 'package:frontend/features/menu/domain/main_chat_repository.dart'
    as _i346;
import 'package:frontend/features/menu/logic/chat_member.bloc.dart' as _i326;
import 'package:frontend/features/menu/logic/letters.bloc.dart' as _i64;
import 'package:frontend/features/menu/logic/ws_connection_cubit.dart' as _i827;
import 'package:frontend/features/menu/logic/ws_join_cubit.dart' as _i165;
import 'package:frontend/features/todo/domain/todo_repository.dart' as _i739;
import 'package:frontend/features/todo/view/bloc/todo_bloc.dart' as _i955;
import 'package:frontend/features/unit/domain/unit_repository.dart' as _i92;
import 'package:frontend/features/unit/logic/create_unit_bloc.dart' as _i712;
import 'package:frontend/features/unit/logic/selected_unit.bloc.dart' as _i557;
import 'package:frontend/features/unit/logic/unit_bloc.dart' as _i199;
import 'package:frontend/features/user/domain/user_repository.dart' as _i935;
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
    final dioModule = _$DioModule();
    final wsSocketModule = _$WsSocketModule();
    gh.factory<_i990.UserBloc>(() => _i990.UserBloc());
    gh.lazySingleton<_i684.WsLettersRepository>(
      () => _i684.WsLettersRepository(),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i346.MainChatRepository>(
      () => _i346.MainChatRepository(),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i569.DbClient>(() => dbClientModule.dbClient);
    gh.lazySingleton<_i716.AppConfig>(
      () => appConfigModule.appConfigDev,
      registerFor: {_dev},
    );
    gh.lazySingleton<_i151.AdminRepository>(() => _i151.AdminRepositoryImpl());
    gh.lazySingleton<_i166.SessionRepository>(
      () => _i166.SessionRepository(gh<_i569.DbClient>()),
    );
    gh.lazySingleton<_i935.UserRepository>(() => _i935.UserRepositoryImpl());
    gh.lazySingleton<_i716.AppConfig>(
      () => appConfigModule.appConfigProd,
      registerFor: {_prod},
    );
    gh.factory<_i326.ChatMemberBloc>(
      () => _i326.ChatMemberBloc(gh<_i346.MainChatRepository>()),
    );
    gh.factory<_i91.AdminBloc>(
      () => _i91.AdminBloc(gh<_i151.AdminRepository>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.registrationDio(gh<_i716.AppConfig>()),
      instanceName: 'registration',
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.retryDio(gh<_i716.AppConfig>()),
      instanceName: 'retryDio',
    );
    gh.lazySingleton<_i436.RegistrationApiService>(
      () => _i436.RegistrationApiService(
        gh<_i361.Dio>(instanceName: 'registration'),
      ),
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.dio(
        gh<_i166.SessionRepository>(),
        gh<_i716.AppConfig>(),
        gh<_i361.Dio>(instanceName: 'retryDio'),
      ),
      instanceName: 'withToken',
    );
    gh.lazySingleton<_i365.ProtectedApiService>(
      () => _i365.ProtectedApiService(gh<_i361.Dio>(instanceName: 'withToken')),
    );
    gh.lazySingleton<_i739.TodoRepository>(
      () => _i739.TodoRepositoryImpl(gh<_i365.ProtectedApiService>()),
    );
    gh.lazySingleton<_i887.AuthRepository>(
      () => _i887.AuthRepository(
        gh<_i436.RegistrationApiService>(),
        gh<_i166.SessionRepository>(),
        gh<_i365.ProtectedApiService>(),
      ),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i92.UnitRepository>(
      () => _i92.UnitRepository(gh<_i365.ProtectedApiService>()),
    );
    gh.lazySingleton<_i948.WebSocket>(
      () =>
          wsSocketModule.ws(gh<_i716.AppConfig>(), gh<_i887.AuthRepository>()),
    );
    gh.factory<_i64.LettersBloc>(
      () => _i64.LettersBloc(
        gh<_i684.WsLettersRepository>(),
        gh<_i887.AuthRepository>(),
      ),
    );
    gh.factory<_i199.UnitBloc>(() => _i199.UnitBloc(gh<_i92.UnitRepository>()));
    gh.factory<_i557.SelectedUnitBloc>(
      () => _i557.SelectedUnitBloc(gh<_i92.UnitRepository>()),
    );
    gh.factory<_i415.SignupBloc>(
      () => _i415.SignupBloc(gh<_i887.AuthRepository>()),
    );
    gh.factory<_i233.AuthCubit>(
      () => _i233.AuthCubit(gh<_i887.AuthRepository>()),
    );
    gh.factory<_i132.LoginCubit>(
      () => _i132.LoginCubit(gh<_i887.AuthRepository>()),
    );
    gh.factory<_i165.WsJoinCubit>(
      () => _i165.WsJoinCubit(gh<_i887.AuthRepository>()),
    );
    gh.factory<_i955.TodoBloc>(
      () => _i955.TodoBloc(gh<_i739.TodoRepository>()),
    );
    gh.lazySingleton<_i684.WsManager>(
      () => _i684.WsManager(
        gh<_i684.WsLettersRepository>(),
        gh<_i151.AdminRepository>(),
        gh<_i948.WebSocket>(),
        gh<_i716.AppConfig>(),
        gh<_i166.SessionRepository>(),
        gh<_i887.AuthRepository>(),
        gh<_i346.MainChatRepository>(),
      ),
      dispose: (i) => i.dispose(),
    );
    gh.factory<_i712.CreateUnitBloc>(
      () => _i712.CreateUnitBloc(gh<_i92.UnitRepository>()),
    );
    gh.factory<_i827.WsConnectionCubit>(
      () => _i827.WsConnectionCubit(gh<_i684.WsManager>()),
    );
    return this;
  }
}

class _$DbClientModule extends _i788.DbClientModule {}

class _$AppConfigModule extends _i716.AppConfigModule {}

class _$DioModule extends _i339.DioModule {}

class _$WsSocketModule extends _i558.WsSocketModule {}
