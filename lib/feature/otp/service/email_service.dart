import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class EmailService {
  final String senderEmail;
  final String senderPassword;

  EmailService({
    required this.senderEmail,
    required this.senderPassword,
  });

  Future<void> sendOtp(String recipientEmail, String otp) async {
    final smtpServer = gmail(senderEmail, senderPassword);

    final message = Message()
      ..from = Address(senderEmail, 'Gomla Market')
      ..recipients.add(recipientEmail)
      ..subject = 'رمز التحقق الخاص بك'
      ..text = 'رمز التحقق الخاص بك هو: $otp';

    await send(message, smtpServer);
  }
}
