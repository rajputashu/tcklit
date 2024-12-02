// ignore_for_file: must_be_immutable

part of 'otp_bloc.dart';

class OtpEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class OTPChange extends OtpEvents {
  late String otp;

  OTPChange(this.otp);
}

class OTPApiCall extends OtpEvents {}
