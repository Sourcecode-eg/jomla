import 'package:flutter_bloc/flutter_bloc.dart';
import 'otp_state.dart';
import '../service/otp_repository.dart';
import '../service/email_service.dart';

class OtpCubit extends Cubit<OtpState> {
  final OtpRepository otpRepository;
  final EmailService emailService;

  OtpCubit({
    required this.otpRepository,
    required this.emailService,
  }) : super(OtpInitial());

  Future<void> sendOtp({
    required String phoneNumber,
    required String email,
  }) async {
    emit(OtpLoading());

    try {
      final otp = await otpRepository.sendOtp(phoneNumber);
      await emailService.sendOtp(email, otp);
      emit(OtpSuccess(otp));
    } catch (e) {
      emit(OtpError('خطأ أثناء الإرسال: ${e.toString()}'));
    }
  }
}
