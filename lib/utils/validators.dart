import 'package:avs/data/models/user.dart';
import 'package:get/utils.dart';

class Validator {
  static String isPhoneNumber(String value) {
    if (value.isEmpty || value.length < 11) {
      return 'Phone number must be eleven digits long';
    }

    return null;
  }

  static String isOtp(String value) {
    if (value.isEmpty || value.length < 4) {
      return 'Phone number must be eleven digits long';
    }

    return null;
  }

  static String isName(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    } else if (!GetUtils.isAlphabetOnly(value)) {
      return 'Please enter a valid name';
    }
    return null;
  }

  static String isEmail(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    } else if (!GetUtils.isEmail(value.trim())) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String isPassword(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    } else if (!GetUtils.isLengthGreaterOrEqual(value, 6)) {
      return 'Password must be 6 characters long';
    }
    return null;
  }

  static String isAddress(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    } else if (!GetUtils.isLengthGreaterThan(value, 4)) {
      return 'Please enter a valid Address';
    }
    return null;
  }

  static String isNotEmpty(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String isInviteCode(String value) {
    if (value.isNotEmpty && value.length != 6) {
      return 'Invite code must be six characters long';
    }

    return null;
  }

  static String isPromoCode(String value) {
    if (value.isEmpty || value.length != 6) {
      return 'Promo code must be six characters long';
    }

    return null;
  }

  static String isGender(Gender value) {
    if (value == null) {
      return 'Please select a valid Gender';
    }
    return null;
  }
}
