import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcklit_app/di/injections_container.dart';
import 'package:tcklit_app/modules/login/login_repository.dart';
import 'package:tcklit_app/utils/app_enums.dart';

part "login_via_mobile_events.dart";
part "login_via_mobile_state.dart";

class LoginViaMobileBloc extends Bloc<LoginViaMobileEvents, LoginViaMobileState> {
  final loginRepo = locator<LoginRepository>();

  LoginViaMobileBloc() : super(LoginViaMobileState()) {
    on<MobileChange>(_onEmailChange);
    on<LoginApiCall>(_onLoginApiCall);
  }

  // ignore: unused_element
  void _onEmailChange(MobileChange event, Emitter<LoginViaMobileState> emit) {
    emit(state.copyWith(mobileNumber: event.mobileNumber));
  }

  Future<void> _onLoginApiCall(LoginApiCall event, Emitter<LoginViaMobileState> emit) async {
    var dbResult = await loginRepo.fetchPostsFromDB();
    List<Map<String, dynamic>?> jsonResult = dbResult.map((dto) => dto.toJson()).toList();
    print(jsonResult);
    if (dbResult.isNotEmpty) {
      emit(state.copyWith(
        apiStatus: ApiStatus.SUCCESS,
      ));
    } else {
      emit(
        state.copyWith(apiStatus: ApiStatus.ERROR),
      );
    }
  }
}
