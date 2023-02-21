import 'dart:math';

extension ExtensionsDouble on double {
  double fixedDouble({num fractionDigits = 2}) {
    final mod = pow(10.0, fractionDigits);
    return ((this * mod).round().toDouble() / mod);
  }
}
