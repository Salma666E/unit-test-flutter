class Validation {
  static String? validateName(String? value) {
    String? _message;

    if (value!.isEmpty) {
      _message = 'Please enter your name!';
    } else if (value.length < 3) {
      _message = 'Name must be more than 2 characters';
    }

    return _message;
  }

  static String? validateEmail(String? value) {
    String? _message;

    String _emailPattern = r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.com$';
    // // r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(_emailPattern);

    if (value!.isEmpty) {
      _message = 'Your email address is required!';
    } else if (!regex.hasMatch(value)) {
      _message = 'Please provide a valid email address!';
    }

    return _message;
  }

  static String? validatePhone(String? value) {
    String? _message;

    String _egyptianPhonePatter = r'^01[0125][0-9]{8}$';
    RegExp regex = RegExp(_egyptianPhonePatter);

    if (value!.isEmpty) {
      _message = 'Your phone number is required!';
    } else if (!regex.hasMatch(value)) {
      _message = 'Please provide a valid phone number!';
    }

    return _message;
  }

  static String? validatePassword(String? value) {
    String? _message;

    if (value!.isEmpty) {
      _message = 'Your password is required!';
    } else if (value.length < 6) {
      _message = 'Your password must be at least 6 characters!';
    } else if (value.length > 32) {
      _message = 'Your password must be at most 32 characters!';
    }

    return _message;
  }

  static String? validateConfirmPassword(String? value, String? password) {
    String? _message;

    if (value!.isEmpty) {
      _message = 'Your confirm password is required!';
    } else if (value != password) {
      _message = 'Your confirm password is not valid!';
    }

    return _message;
  }

  static String? validateAge(String? value) {
    String? _message;

    if (value!.isEmpty) {
      _message = 'Your age is required!';
    } else if (int.parse(value) >= 120) {
      _message = 'Invalid age';
    }

    return _message;
  }

  static String? validateJob(String? value) {
    String? _message;

    String _doesNotStartWithDigit = r'^(?!\d{1,}).*?$';
    RegExp regex = RegExp(_doesNotStartWithDigit);

    if (value!.isEmpty) {
      _message = 'Your job is required!';
    } else if (!regex.hasMatch(value)) {
      _message = 'Please provide a valid job';
    }

    return _message;
  }
}
