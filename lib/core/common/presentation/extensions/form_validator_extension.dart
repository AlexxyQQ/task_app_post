import 'package:easy_localization/easy_localization.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../config/constants/gen/locale_keys.g.dart';

extension FormFieldValidator on String {
  // Validate email
  Either<String, bool> validateEmail({
    String fieldName =
        LocaleKeys.commonFormFieldTitles_email, // Default to "Email"
  }) {
    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9]+[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
    );
    if (isEmpty) {
      return Left(
        LocaleKeys.formValidationErrors_required.tr(
          namedArgs: {'field': fieldName.tr()},
        ),
      );
    } else if (!emailRegExp.hasMatch(this)) {
      return Left(
        LocaleKeys.formValidationErrors_invalid.tr(
          namedArgs: {'field': fieldName.tr()},
        ),
      );
    }
    return const Right(true);
  }

  // Validate password
  Either<String, bool> validatePassword({
    int minLength = 8,
    String fieldName =
        LocaleKeys.commonFormFieldTitles_password, // Default to "Password"
  }) {
    if (isEmpty) {
      return Left(
        LocaleKeys.formValidationErrors_required.tr(
          namedArgs: {'field': fieldName.tr()},
        ),
      );
    }
    if (length < minLength) {
      return Left(
        LocaleKeys.formValidationErrors_minLength.tr(
          namedArgs: {
            'field': fieldName.tr(),
            'minLength': minLength.toString(),
          },
        ),
      );
    }
    final hasUppercase = contains(RegExp(r'[A-Z]'));
    final hasDigits = contains(RegExp(r'[0-9]'));
    final hasLowercase = contains(RegExp(r'[a-z]'));
    // final hasSpecialCharacters = contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    if (!hasUppercase) {
      return Left(
        LocaleKeys.formValidationErrors_uppercaseRequired.tr(
          namedArgs: {'field': fieldName.tr()},
        ),
      );
    }
    if (!hasLowercase) {
      return Left(
        LocaleKeys.formValidationErrors_lowercaseRequired.tr(
          namedArgs: {'field': fieldName.tr()},
        ),
      );
    }
    if (!hasDigits) {
      return Left(
        LocaleKeys.formValidationErrors_numberRequired.tr(
          namedArgs: {'field': fieldName.tr()},
        ),
      );
    }
    // if (!hasSpecialCharacters) {
    //   return Left(
    //     LocaleKeys.formValidationErrors_specialCharacterRequired
    //         .tr(namedArgs: {'field': fieldName.tr()}),
    //   );
    // }

    return const Right(true);
  }

  // Validate Confirm password
  Either<String, bool> validateConfirmPassword(
    String password, {
    String fieldName = LocaleKeys.commonFormFieldTitles_confirmPassword,
  }) {
    if (isEmpty) {
      return Left(
        LocaleKeys.formValidationErrors_required.tr(
          namedArgs: {'field': fieldName.tr()},
        ),
      );
    }
    if (this != password) {
      return Left(
        LocaleKeys.formValidationErrors_doesNotMatch.tr(
          namedArgs: {
            'newField': fieldName.tr(),
            'oldField': LocaleKeys.commonFormFieldTitles_password.tr(),
          },
        ),
      );
    }
    return const Right(true);
  }

  // Validate phone number
  Either<String, bool> validatePhoneNumber({
    String fieldName = LocaleKeys
        .commonFormFieldTitles_phoneNumber, // Default to "Phone number"
  }) {
    final phoneRegExp = RegExp(r'^\+?[0-9]{7,15}$');
    if (isEmpty) {
      return Left(
        LocaleKeys.formValidationErrors_required.tr(
          namedArgs: {'field': fieldName.tr()},
        ),
      );
    } else if (!phoneRegExp.hasMatch(this)) {
      return Left(
        LocaleKeys.formValidationErrors_invalid.tr(
          namedArgs: {'field': fieldName.tr()},
        ),
      );
    }
    return const Right(true);
  }

  // Validate if it's not empty
  Either<String, bool> validateNotEmpty(String fieldName) {
    if (trim().isEmpty) {
      return Left(
        LocaleKeys.formValidationErrors_required.tr(
          namedArgs: {'field': fieldName},
        ),
      );
    }
    return const Right(true);
  }

  // Validate URL
  Either<String, bool> validateUrl({
    String fieldName = LocaleKeys.commonFormFieldTitles_url,
  }) {
    if (isEmpty) {
      return Left(
        LocaleKeys.formValidationErrors_required.tr(
          namedArgs: {'field': fieldName.tr()},
        ),
      );
    }
    return const Right(true);
  }

  // Validate postal code
  Either<String, bool> validatePostalCode({
    String fieldName = LocaleKeys.commonFormFieldTitles_postalCode,
  }) {
    // Numbers and letters(upper or lower) and spaces and hyphens
    final postalRegExp = RegExp(r'^[a-zA-Z0-9\s\-]{4,10}$');
    if (isEmpty) {
      return Left(
        LocaleKeys.formValidationErrors_required.tr(
          namedArgs: {'field': fieldName.tr()},
        ),
      );
    } else if (!postalRegExp.hasMatch(this)) {
      return Left(
        LocaleKeys.formValidationErrors_invalid.tr(
          namedArgs: {'field': fieldName.tr()},
        ),
      );
    }
    return const Right(true);
  }

  // Validate name
  Either<String, bool> validateName({
    String fieldName = LocaleKeys.commonFormFieldTitles_fullName,
  }) {
    final nameRegExp = RegExp(r'^[a-zA-Z\s]+$');
    if (isEmpty) {
      return Left(
        LocaleKeys.formValidationErrors_required.tr(
          namedArgs: {'field': fieldName.tr()},
        ),
      );
    } else if (!nameRegExp.hasMatch(this)) {
      return Left(
        LocaleKeys.formValidationErrors_invalid.tr(
          namedArgs: {'field': fieldName.tr()},
        ),
      );
    }
    return const Right(true);
  }

  // Validate credit card using Luhn Algorithm
  Either<String, bool> validateCreditCard({
    String fieldName = LocaleKeys.commonFormFieldTitles_creditCardNumber,
  }) {
    if (isEmpty) {
      return Left(
        LocaleKeys.formValidationErrors_required.tr(
          namedArgs: {'field': fieldName.tr()},
        ),
      );
    }
    final sanitized = replaceAll(RegExp(r'\D'), '');
    if (sanitized.length < 13 || sanitized.length > 19) {
      return Left(
        LocaleKeys.formValidationErrors_minLength.tr(
          namedArgs: {'field': fieldName.tr(), 'minLength': '13'},
        ),
      );
    }

    int sum = 0;
    bool shouldDouble = false;
    for (int i = sanitized.length - 1; i >= 0; i--) {
      int digit = int.parse(sanitized[i]);

      if (shouldDouble) {
        digit *= 2;
        if (digit > 9) {
          digit -= 9;
        }
      }

      sum += digit;
      shouldDouble = !shouldDouble;
    }

    if (sum % 10 != 0) {
      return Left(LocaleKeys.formValidationErrors_invalidCreditCard.tr());
    }

    return const Right(true);
  }

  // Validate OTP
  /// Requires the OTP to be exactly 6 characters long
  /// Requires the OTP to be numeric
  /// Requires the OTP to be not empty

  Either<String, bool> validateOtp({
    String fieldName = 'LocaleKeys.commonErrors_otpFill',
  }) {
    final otpRegExp = RegExp(r'^[0-9]{6}$');
    if (isEmpty) {
      return Left(
        LocaleKeys.formValidationErrors_required.tr(
          namedArgs: {'field': fieldName.tr()},
        ),
      );
    } else if (!otpRegExp.hasMatch(this)) {
      return Left(
        LocaleKeys.formValidationErrors_invalid.tr(
          namedArgs: {'field': fieldName.tr()},
        ),
      );
    }
    return const Right(true);
  }

  // Validate Money
  Either<String, bool> validateMoney({required String fieldName}) {
    final moneyRegExp = RegExp(r'^[0-9]+(\.[0-9]{1,2})?$');
    if (isEmpty) {
      return Left(
        LocaleKeys.formValidationErrors_required.tr(
          namedArgs: {'field': fieldName.tr()},
        ),
      );
    } else if (!moneyRegExp.hasMatch(this)) {
      return Left(
        LocaleKeys.formValidationErrors_invalid.tr(
          namedArgs: {'field': fieldName.tr()},
        ),
      );
    }
    return const Right(true);
  }

  // Social Media Handle
  Either<String, bool> validateSocialMediaHandel({required String fieldName}) {
    final socialMediaValidationRegExp = RegExp(
      r'^(?:(?=.{1,30}$)[A-Za-z0-9._]+|(?=.{2,24}$)[A-Za-z0-9._]+|(?=.{1,15}$)[A-Za-z0-9_]+|@[A-Za-z0-9_]{3,15})$',
    );
    if (isEmpty) {
      return Left(
        LocaleKeys.formValidationErrors_required.tr(
          namedArgs: {'field': fieldName.tr()},
        ),
      );
    } else if (!socialMediaValidationRegExp.hasMatch(this)) {
      return Left(
        LocaleKeys.formValidationErrors_invalid.tr(
          namedArgs: {'field': fieldName.tr()},
        ),
      );
    }
    return const Right(true);
  }
}
