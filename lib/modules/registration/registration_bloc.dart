import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcklit_app/utils/app_enums.dart';

part "registration_events.dart";
part "registration_state.dart";

class RegistrationBloc extends Bloc<RegistrationEvents, RegistrationState> {
  // final loginRepo = locator<OTPRepository>();

  RegistrationBloc() : super(RegistrationState()) {
    on<FullNameChange>(_onFullNameChange);
    on<EmailChange>(_onEmailChange);
    on<MobileNoChange>(_onMobNoChange);
    on<CityChange>(_onCityChange);
    on<ChoosePlanChange>(_onChoosePlan);
    on<RegistrationApiCall>(_onRegistrationApiCall);
    on<TnCCheckBoxChange>(_onCBChange);
  }

  // ignore: unused_element
  void _onFullNameChange(FullNameChange event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(fullName: event.fullName));
  }

  // ignore: unused_element
  void _onEmailChange(EmailChange event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(email: event.email));
  }

  // ignore: unused_element
  void _onMobNoChange(MobileNoChange event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(mobileNo: event.mobileNo));
  }

  // ignore: unused_element
  void _onCityChange(CityChange event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(city: event.city));
  }

  // ignore: unused_element
  void _onChoosePlan(ChoosePlanChange event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(choosePlan: event.choosePlan));
  }

  // ignore: unused_element
  void _onCBChange(TnCCheckBoxChange event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(isTnCAccepted: event.tncChecked));
  }

  Future<void> _onRegistrationApiCall(RegistrationApiCall event, Emitter<RegistrationState> emit) async {}
}
