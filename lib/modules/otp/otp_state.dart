part of 'otp_bloc.dart';

// ignore: must_be_immutable
class OTPState extends Equatable {
  late String? otp;
  late ApiStatus apiStatus;

  OTPState({this.otp, this.apiStatus = ApiStatus.IS_INITIAL});

  @override
  List<Object?> get props => [otp, apiStatus];

  OTPState copyWith({String? otp, ApiStatus? apiStatus}) {
    return OTPState(otp: otp ?? this.otp, apiStatus: apiStatus ?? this.apiStatus);
  }
}
