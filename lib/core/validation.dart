import 'package:dongi/extensions/validation_string.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FormValidatorNotifier extends StateNotifier<String?> {
  FormValidatorNotifier() : super(null);

  String? validatePassword(String? value) {
    if (value != null && value.isValidPassword) {
      return null;
    } else {
      return 'Password must contain an uppercase, lowercase, numeric digit and special character';
    }
  }

  String? validateEmail(String? value) {
    if (value != null && value.isValidEmail) {
      return null;
    } else {
      return 'Please Enter a Valid Email';
    }
  }

  String? validateUsername(String? value) {
    if (value != null && value.length >= 4 && value.length < 32) {
      return null;
    } else {
      return 'Username must be more than 4 characters';
    }
  }

  String? validateTitle(String? value) {
    if (value != null && value.isNotEmpty && value.length < 32) {
      return null;
    } else {
      return 'Title must not be empty or longer than 32 char';
    }
  }

  String? validateCost(String? value) {
    if (value != null && value.isNotEmpty) {
      try {
        final costBigInt = BigInt.parse(value.replaceAll(',', ''));
        final maxInt64 =
            BigInt.from(9223372036854775807); // Maximum value for 64-bit int
        if (costBigInt <= maxInt64) {
          return null;
        } else {
          return 'Cost is too large. Please enter a smaller number.';
        }
      } catch (e) {
        return 'Invalid input. Please enter a valid number.';
      }
    } else {
      return 'Cost must not be empty';
    }
  }
}

final formValidatorProvider =
    StateNotifierProvider<FormValidatorNotifier, String?>((ref) {
  return FormValidatorNotifier();
});
