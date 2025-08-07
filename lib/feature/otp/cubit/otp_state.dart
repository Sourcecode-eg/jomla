abstract class OtpState {}

class OtpInitial extends OtpState {}

class OtpLoading extends OtpState {}

class OtpSuccess extends OtpState {
  final String otp;
  OtpSuccess(this.otp);
}

class OtpError extends OtpState {
  final String message;
  OtpError(this.message);
}
