import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcklit_app/di/injections_container.dart';
import 'package:tcklit_app/utils/app_enums.dart';

import 'otp_repository.dart';

part "otp_events.dart";
part "otp_state.dart";

class OtpBloc extends Bloc<OtpEvents, OTPState> {
  final loginRepo = locator<OTPRepository>();

  OtpBloc() : super(OTPState()) {
    on<OTPChange>(_onEmailChange);
    on<OTPApiCall>(_onOtpVerificationApiCall);
  }

  // ignore: unused_element
  void _onEmailChange(OTPChange event, Emitter<OTPState> emit) {
    emit(state.copyWith(otp: event.otp));
  }

  Future<void> _onOtpVerificationApiCall(OTPApiCall event, Emitter<OTPState> emit) async {
    /*var dbResult = await loginRepo.fetchPostsFromDB();
    List<Map<String, dynamic>?> jsonResult = dbResult.map((dto) => dto.toJson()).toList();
    print(jsonResult);
    if (dbResult.isNotEmpty) {
      emit(state.copyWith(
        apiStatus: ApiStatus.SUCCESS,
      ));
    } else {
      emit(
        state.copyWith(apiStatus: ApiStatus.ERROR),
      );
    }*/
  }
}
