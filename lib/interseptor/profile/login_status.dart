class LoginStatus {
  final bool isAuthorized;
  final bool? registrationRequired;
  final bool? loginRequired;
  final String? message;

  LoginStatus({
    required this.isAuthorized,
    this.registrationRequired,
    this.loginRequired = true,
    this.message,
  });
}
