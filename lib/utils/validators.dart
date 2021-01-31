import 'dart:io';
import 'package:avs/data/models/document.dart';
import 'package:avs/data/models/user.dart';
import 'package:get/utils.dart';
import 'package:image_picker/image_picker.dart';

class Validator {
  static String isPassword(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    } else if (!GetUtils.isLengthGreaterOrEqual(value, 8)) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  static String isOtp(String value) {
    if (value.isEmpty || value.length < 4) {
      return 'Otp must be 4 digits long';
    }
    return null;
  }

  static String isPhoneNumber(String value) {
    if (value.isEmpty || value.length < 11) {
      return 'Phone number must be 11 digits long';
    }
    return null;
  }

  static String isName(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    } else if (!GetUtils.isAlphabetOnly(value) || value.length < 2) {
      return 'Please enter a valid name';
    }
    return null;
  }

  static String isPostalCode(String value) {
    if (value.isEmpty || value.length < 6) {
      return 'Postal code must be 6 digits long';
    }
    return null;
  }

  static String isOtherName(String value) {
    if (value.isNotEmpty) {
      if (!GetUtils.isAlphabetOnly(value) || value.length < 2) {
        return 'Please enter a valid name';
      }
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

  static String isOptionalEmail(String value) {
    if (value.isNotEmpty) {
      if (!GetUtils.isEmail(value.trim())) {
        return 'Please enter a valid email';
      }
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

  static String isLessThan5MB(String value) {
    final _5MB = 5 * 1024 * 1024;
    if (value.isEmpty) {
      return 'Click to select a document';
    } else {
      final file = File(value);
      if (file.lengthSync() > _5MB) {
        return 'Selected file is ${(file.lengthSync() / 1024 / 1024).toPrecision(2)}MB. It should not more than 5MB';
      }
    }
    return null;
  }

  static String isNIN(String value) {
    if (value.isEmpty || value.length < 11) {
      return 'National Identity Number must be 11 digits long';
    }
    return null;
  }

  static String isGender(String value) {
    if (value == null) {
      return 'Please select a valid Gender';
    }
    return null;
  }

  static String isProfilePhoto(PickedFile value) {
    print(value);
    if (value == null || value.isBlank) {
      return 'A clear profile picture is required';
    }
    return null;
  }

  static String isDocument(Document value) {
    if (value == null || value.isBlank) {
      return 'Select a valid document to upload';
    }
    return null;
  }

  static String isEightDigit(String value) {
    if (value.isEmpty || value.length < 8) {
      return 'Password must be digits 8 long';
    }
    return null;
  }
}
