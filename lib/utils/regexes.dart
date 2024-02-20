class Regexes {
  static final phone = RegExp(r'(^(?:[+0]9)?[0-9]{11,11}$)');
  // https://davidcel.is/posts/stop-validating-email-addresses-with-regex/
  static final email = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9\-]{2,}\.[a-zA-Z]+");
  static final emailAllowSymbols = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~@]");
}

typedef Json = Map<String, dynamic>;


