import 'package:appetec/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:appetec/features/auth/data/sources/auth_remote_source.dart';
import 'package:appetec/features/auth/domain/repositories/auth_repository.dart';
import 'package:appetec/features/auth/domain/usecases/user_login.dart';
import 'package:appetec/features/auth/domain/usecases/user_register.dart';
import 'package:appetec/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteSource>(() => AuthRemoteSourceImp());

  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => UserLogin(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => UserRegister(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => UserLogout(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      userLogin: serviceLocator(),
      userRegister: serviceLocator(),
      userLogout: serviceLocator(),
    ),
  );
}
