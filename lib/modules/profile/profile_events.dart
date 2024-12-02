// ignore_for_file: must_be_immutable

part of 'profile_bloc.dart';

class ProfileEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class FullNameChange extends ProfileEvents {
  late String fullName;

  FullNameChange(this.fullName);
}

class EmailChange extends ProfileEvents {
  late String email;

  EmailChange(this.email);
}

class MobileNoChange extends ProfileEvents {
  late String mobileNo;

  MobileNoChange(this.mobileNo);
}

class CityChange extends ProfileEvents {
  late String city;

  CityChange(this.city);
}

class ChoosePlanChange extends ProfileEvents {
  late String choosePlan;

  ChoosePlanChange(this.choosePlan);
}

class AddressChange extends ProfileEvents {
  late String address;

  AddressChange(this.address);
}

class RegistrationApiCall extends ProfileEvents {}
