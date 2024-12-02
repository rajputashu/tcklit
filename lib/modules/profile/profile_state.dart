part of 'profile_bloc.dart';

// ignore: must_be_immutable
class ProfileState extends Equatable {
  late String? fullName;
  late String? email;
  late String? mobileNo;
  late String? city;
  late String? address;
  late String? choosePlan;
  late ApiStatus apiStatus;

  ProfileState(
      {this.fullName,
      this.email,
      this.mobileNo,
      this.address,
      this.city,
      this.choosePlan,
      this.apiStatus = ApiStatus.IS_INITIAL});

  @override
  List<Object?> get props => [fullName, email, mobileNo, address, city, choosePlan, apiStatus];

  ProfileState copyWith(
      {String? fullName,
      String? email,
      String? mobileNo,
      String? address,
      String? city,
      String? choosePlan,
      ApiStatus? apiStatus}) {
    return ProfileState(
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        mobileNo: mobileNo ?? this.mobileNo,
        address: address ?? this.address,
        city: city ?? this.city,
        choosePlan: choosePlan ?? this.choosePlan,
        apiStatus: apiStatus ?? this.apiStatus);
  }
}
