part of 'registration_bloc.dart';

// ignore: must_be_immutable
class RegistrationState extends Equatable {
  late String? fullName;
  late String? email;
  late String? mobileNo;
  late String? city;
  late String? choosePlan;
  late bool? isTnCAccepted;
  late ApiStatus apiStatus;

  RegistrationState(
      {this.fullName,
      this.email,
      this.mobileNo,
      this.city,
      this.choosePlan,
      this.isTnCAccepted=false,
      this.apiStatus = ApiStatus.IS_INITIAL});

  @override
  List<Object?> get props => [fullName, email, mobileNo, city, choosePlan, isTnCAccepted, apiStatus];

  RegistrationState copyWith(
      {String? fullName,
      String? email,
      String? mobileNo,
      String? city,
      String? choosePlan,
      bool? isTnCAccepted,
      ApiStatus? apiStatus}) {
    return RegistrationState(
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        mobileNo: mobileNo ?? this.mobileNo,
        city: city ?? this.city,
        choosePlan: choosePlan ?? this.choosePlan,
        isTnCAccepted: isTnCAccepted ?? this.isTnCAccepted,
        apiStatus: apiStatus ?? this.apiStatus);
  }
}
