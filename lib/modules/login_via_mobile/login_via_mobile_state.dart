part of 'login_via_mobile_bloc.dart';

// ignore: must_be_immutable
class LoginViaMobileState extends Equatable {
  late String? mobileNumber;
  late ApiStatus apiStatus;

  LoginViaMobileState(
      {this.mobileNumber,this.apiStatus = ApiStatus.IS_INITIAL});

  @override
  List<Object?> get props => [mobileNumber, apiStatus];

  LoginViaMobileState copyWith({String? mobileNumber, ApiStatus? apiStatus}) {
    return LoginViaMobileState(
        mobileNumber: mobileNumber ?? this.mobileNumber,
        apiStatus: apiStatus ?? this.apiStatus);
  }
}
