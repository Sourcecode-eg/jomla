class ApiContants {
  static const String _baseUrl = "http://41.38.56.140/GomlaAPI/api";

  static const String login = "$_baseUrl/Account/Login";
  static const String createAccount = "$_baseUrl/Account/Register";
  static const String sendOtp = "$_baseUrl/Account/send-otp";
  static const String allBusinessTypes = "$_baseUrl/BusinessTypes/all";

  // Api key google map
  static const String kGoogleApiKey = 'AIzaSyCULgpAHLJ4mlKCU-FLS2SffXRMDH2JNGg';
}
