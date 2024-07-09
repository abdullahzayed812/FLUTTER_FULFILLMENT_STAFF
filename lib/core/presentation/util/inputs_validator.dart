enum ValidatorType {
  required,
  minLength,
  email,
  url,
  lengthRange,
  hasAtLeastOneCapitalLetter,
  hasAtLeastOneSmallLetter,
  hasAtLeastOneSymbol,
  hasAtLeastOneSmallLetterAndOneCapital,
  latitude,
  longitude,
  int,
  double,
  others,
}

abstract class TextFieldValidator extends FieldValidator<String?> {
  TextFieldValidator(super.errorText);

// return false if you want the validator to return error
// message when the value is empty.
  bool get ignoreEmptyValues => true;

  @override
  String? call(String? value, {String? value2}) {
    return (ignoreEmptyValues && (value?.isEmpty ?? true))
        ? null
        : super.call(value);
  }

  /// helper function to check if an input matches a given pattern
  bool hasMatch(String pattern, String input, {bool caseSensitive = true}) =>
      RegExp(pattern, caseSensitive: caseSensitive).hasMatch(input);
}

class MultiValidator extends FieldValidator<String?> {

  MultiValidator(
    this.validators, {
    this.required = true,
  }) : super(_errorText);
  final List<FieldValidator<String?>> validators;
  static String _errorText = '';
  final bool required;

  @override
  bool isValid(String? value) {
    if (!required) return true;
    _errorText = '';
    var isFieldValid = false;
    for (var i = 0; i <= validators.length - 1; i++) {
      isFieldValid = true;
      if (validators[i].call(value) != null) {
        _errorText = validators[i].errorText;
        isFieldValid = false;
      }
    }
    if (_errorText.isNotEmpty) return false;

    return isFieldValid;
  }

  @override
  String? call(String? value) {
    return isValid(value) ? null : _errorText;
  }

  bool? checkFieldValidator(ValidatorType validatorType) {
    for (final FieldValidator<dynamic> validator in validators) {
      if (validatorType == validator.validatorType) {
        return validator.fieldIsValid;
      }
    }
    return false;
  }
}

abstract class FieldValidator<T> {

  FieldValidator(this.errorText);
  /// the errorText to display when the validation fails
  final String errorText;

  bool? fieldIsValid;

  ValidatorType validatorType = ValidatorType.others;

  /// checks the input against the given conditions
  bool isValid(T value);

  /// call is a special function that makes a class callable
  /// returns null if the input is valid otherwise it returns the provided error errorText
  String? call(T value) {
    fieldIsValid = isValid(value);
    return isValid(value) ? null : errorText;
  }
}

class RequiredValidator extends TextFieldValidator {
  RequiredValidator({required String errorText}) : super(errorText);

  @override
  ValidatorType get validatorType => ValidatorType.required;

  @override
  bool get ignoreEmptyValues => false;

  @override
  bool isValid(String? value) {
    return (value ?? '').isNotEmpty;
  }
}

class EmailValidator extends TextFieldValidator {

  EmailValidator({required String errorText}) : super(errorText);
  /// regex pattern to validate email inputs.
  final Pattern _emailPattern =
      r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$";

  @override
  ValidatorType get validatorType => ValidatorType.email;

  @override
  bool isValid(String? value) =>
      hasMatch(_emailPattern.toString(), value!, caseSensitive: false);
}

class URLValidator extends TextFieldValidator {

  URLValidator({required String errorText}) : super(errorText);
  final Pattern _urlPattern =
      r'(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:,.;]*)?';

  @override
  ValidatorType get validatorType => ValidatorType.email;

  @override
  bool isValid(String? value) =>
      hasMatch(_urlPattern.toString(), value!, caseSensitive: false);
}

class MinLengthValidator extends TextFieldValidator {

  MinLengthValidator(this.min, {required String errorText}) : super(errorText);
  final int min;

  @override
  ValidatorType get validatorType => ValidatorType.minLength;

  @override
  bool get ignoreEmptyValues => false;

  @override
  bool isValid(String? value) {
    return (value ?? '').length >= min;
  }
}

class LengthRangeValidator extends TextFieldValidator {

  LengthRangeValidator(
      {required this.min, required this.max, required String errorText,})
      : super(errorText);
  final int min;
  final int max;

  @override
  bool get ignoreEmptyValues => false;

  @override
  ValidatorType get validatorType => ValidatorType.lengthRange;

  @override
  bool isValid(String? value) {
    return (value ?? '').length >= min && (value ?? '').length <= max;
  }
}

class HasAtLeastOneCapitalLetter extends TextFieldValidator {

  HasAtLeastOneCapitalLetter({required String errorText}) : super(errorText);
  RegExp reg = RegExp('(?=.*?[A-Z])');

  @override
  bool get ignoreEmptyValues => false;

  @override
  ValidatorType get validatorType => ValidatorType.hasAtLeastOneCapitalLetter;

  @override
  bool isValid(String? value) {
    return reg.hasMatch(value!);
  }
}

class HasAtLeastOneSmallLetter extends TextFieldValidator {

  HasAtLeastOneSmallLetter({required String errorText}) : super(errorText);
  RegExp reg = RegExp('(?=.*?[a-z])');

  @override
  bool get ignoreEmptyValues => false;

  @override
  ValidatorType get validatorType => ValidatorType.hasAtLeastOneSmallLetter;

  @override
  bool isValid(String? value) {
    return reg.hasMatch(value ?? '');
  }
}

class HasAtLeastOneSmallLetterAndOneCapital extends TextFieldValidator {

  HasAtLeastOneSmallLetterAndOneCapital({required String errorText})
      : super(errorText);
  RegExp reg = RegExp('(?=.*?([a-z]+.*[A-Z]+|[A-Z]+.*[a-z]+))');

  @override
  bool get ignoreEmptyValues => false;

  @override
  ValidatorType get validatorType =>
      ValidatorType.hasAtLeastOneSmallLetterAndOneCapital;

  @override
  bool isValid(String? value) {
    return reg.hasMatch(value ?? '');
  }
}

class HasAtLeastOneSymbol extends TextFieldValidator {

  HasAtLeastOneSymbol({required String errorText}) : super(errorText);
  RegExp reg = RegExp(r'(?=.?[!@#$%^&()<>,./])');

  @override
  bool get ignoreEmptyValues => false;

  @override
  ValidatorType get validatorType => ValidatorType.hasAtLeastOneSymbol;

  @override
  bool isValid(String? value) {
    return reg.hasMatch(value ?? '');
  }
}

class LatitudeValidator extends TextFieldValidator {
  LatitudeValidator({required String errorText}) : super(errorText);

  @override
  ValidatorType get validatorType => ValidatorType.latitude;

  @override
  bool isValid(String? value) {
    if (value?.isEmpty ?? true) {
      return false;
    } else if (double.tryParse(value!) == null) {
      return false;
    } else if (double.parse(value) >= -90.0 && double.parse(value) <= 90.0) {
      return true;
    }
    return false;
  }
}

class LongitudeValidator extends TextFieldValidator {
  LongitudeValidator({required String errorText}) : super(errorText);

  @override
  ValidatorType get validatorType => ValidatorType.longitude;

  @override
  bool isValid(String? value) {
    if (value?.isEmpty ?? true) {
      return false;
    } else if (double.tryParse(value!) == null) {
      return false;
    } else if (double.parse(value) >= -180.0 && double.parse(value) <= 180.0) {
      return true;
    }
    return false;
  }
}

class IntValidator extends TextFieldValidator {
  IntValidator({required String errorText}) : super(errorText);

  @override
  ValidatorType get validatorType => ValidatorType.int;

  @override
  bool isValid(String? value) {
    if (value?.isEmpty ?? true) {
      return false;
    } else if (int.tryParse(value!) != null) {
      return true;
    }
    return false;
  }
}

class DoubleValidator extends TextFieldValidator {
  DoubleValidator({required String errorText}) : super(errorText);

  @override
  ValidatorType get validatorType => ValidatorType.double;

  @override
  bool isValid(String? value) {
    if (value?.isEmpty ?? true) {
      return false;
    } else if (double.tryParse(value!) != null) {
      return true;
    }
    return false;
  }
}

class MatchValidator {

  MatchValidator({required this.errorText});
  final String errorText;

  String? validateMatch(String value, String value2) {
    if (value.isNotEmpty && value2.isNotEmpty) {
      return value == value2 ? null : errorText;
    }
    return errorText;
  }
}
