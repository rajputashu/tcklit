// ignore_for_file: must_be_immutable

part of 'registration_bloc.dart';

class RegistrationEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class FullNameChange extends RegistrationEvents {
  late String fullName;

  FullNameChange(this.fullName);
}

class EmailChange extends RegistrationEvents {
  late String email;

  EmailChange(this.email);
}

class MobileNoChange extends RegistrationEvents {
  late String mobileNo;

  MobileNoChange(this.mobileNo);
}

class CityChange extends RegistrationEvents {
  late String city;

  CityChange(this.city);
}

class ChoosePlanChange extends RegistrationEvents {
  late String choosePlan;

  ChoosePlanChange(this.choosePlan);
}

class TnCCheckBoxChange extends RegistrationEvents {
  late bool tncChecked;

  TnCCheckBoxChange(this.tncChecked);
}

class RegistrationApiCall extends RegistrationEvents {}
