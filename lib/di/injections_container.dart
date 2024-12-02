import 'package:get_it/get_it.dart';
import 'package:logger/web.dart';
import 'package:tcklit_app/database/app_database.dart';
import 'package:tcklit_app/database/dao/post_dao.dart';
import 'package:tcklit_app/modules/login/login_bloc.dart';
import 'package:tcklit_app/modules/login/login_repository.dart';
import 'package:tcklit_app/modules/otp/otp_bloc.dart';
import 'package:tcklit_app/networks/api_service.dart';
import 'package:tcklit_app/networks/dio_client.dart';

import '../modules/login_via_mobile/login_via_mobile_bloc.dart';
import '../modules/otp/otp_repository.dart';
import '../modules/profile/profile_bloc.dart';
import '../modules/registration/registration_bloc.dart';

final locator = GetIt.instance;
final logger = Logger();

Future<void> initDi() async {
  // Initialize the database
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  locator.registerSingleton<AppDatabase>(database);

  //INIT DIO
  locator.registerLazySingleton(() => DioClient());
  locator.registerLazySingleton(() => ApiService(locator<DioClient>()));

  //InIt DAOs
  locator.registerLazySingleton<PostDao>(() => database.postDao);

  _initRepositories();
  _initBlocs();
}

//Init Repositories
void _initRepositories() {
  locator.registerLazySingleton<LoginDaosSource>(() => LoginDaosSource(locator<PostDao>()));
  locator.registerLazySingleton<LoginRepository>(
      () => LoginRepository(apiService: locator<ApiService>(), daosSource: locator<LoginDaosSource>()));

  locator.registerLazySingleton<OTPRepository>(() => OTPRepository(apiService: locator<ApiService>()));
}

void _initBlocs() {
  locator.registerLazySingleton<LoginBloc>(() => LoginBloc());
  locator.registerLazySingleton<LoginViaMobileBloc>(() => LoginViaMobileBloc());
  locator.registerLazySingleton<OtpBloc>(() => OtpBloc());
  locator.registerLazySingleton<RegistrationBloc>(() => RegistrationBloc());
  locator.registerLazySingleton<ProfileBloc>(() => ProfileBloc());
}
