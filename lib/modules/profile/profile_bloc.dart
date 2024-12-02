import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcklit_app/utils/app_enums.dart';

part "profile_events.dart";
part "profile_state.dart";

class ProfileBloc extends Bloc<ProfileEvents, ProfileState> {
  // final loginRepo = locator<OTPRepository>();

  ProfileBloc() : super(ProfileState()) {
    on<FullNameChange>(_onFullNameChange);
    on<EmailChange>(_onEmailChange);
    on<MobileNoChange>(_onMobNoChange);
    on<CityChange>(_onCityChange);
    on<ChoosePlanChange>(_onChoosePlan);
    on<RegistrationApiCall>(_onRegistrationApiCall);
    on<AddressChange>(_onAddress);
  }

  // ignore: unused_element
  void _onFullNameChange(FullNameChange event, Emitter<ProfileState> emit) {
    emit(state.copyWith(fullName: event.fullName));
  }

  // ignore: unused_element
  void _onEmailChange(EmailChange event, Emitter<ProfileState> emit) {
    emit(state.copyWith(email: event.email));
  }

  // ignore: unused_element
  void _onMobNoChange(MobileNoChange event, Emitter<ProfileState> emit) {
    emit(state.copyWith(mobileNo: event.mobileNo));
  }

  // ignore: unused_element
  void _onCityChange(CityChange event, Emitter<ProfileState> emit) {
    emit(state.copyWith(city: event.city));
  }

  // ignore: unused_element
  void _onChoosePlan(ChoosePlanChange event, Emitter<ProfileState> emit) {
    emit(state.copyWith(choosePlan: event.choosePlan));
  }

  // ignore: unused_element
  void _onAddress(AddressChange event, Emitter<ProfileState> emit) {
    emit(state.copyWith(address: event.address));
  }

  Future<void> _onRegistrationApiCall(RegistrationApiCall event, Emitter<ProfileState> emit) async {}
}
