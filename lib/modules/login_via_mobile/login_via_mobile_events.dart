// ignore_for_file: must_be_immutable

part of 'login_via_mobile_bloc.dart';

class LoginViaMobileEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class MobileChange extends LoginViaMobileEvents {
  late String mobileNumber;
  MobileChange(this.mobileNumber);
}

class LoginApiCall extends LoginViaMobileEvents {}
