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
    if (value != null && value.length >= 4) {
      return null;
    } else {
      return 'Username must be more than 4 characters';
    }
  }

  String? validateTitle(String? value) {
    if (value != null && value.isNotEmpty) {
      return null;
    } else {
      return 'Title must not be empty';
    }
  }

  String? validateCost(String? value) {
    if (value != null && value.isNotEmpty) {
      if (num.parse(value.replaceAll(',', '')) > 0) {
        return null;
      } else {
        return 'cost must be bigger than 0';
      }
    } else {
      return 'cost must not be empty';
    }
  }
}

final formValidatorProvider =
    StateNotifierProvider<FormValidatorNotifier, String?>((ref) {
  return FormValidatorNotifier();
});
