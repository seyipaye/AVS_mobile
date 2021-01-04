class Validator {
  bool validateEmail(String email) {
    RegExp pattern = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    return pattern.hasMatch(email);
  }

  bool fieldNotEmpty(String string) {
    return string.isNotEmpty;
  }
}
