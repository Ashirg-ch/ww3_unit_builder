
import 'package:flutter/foundation.dart';
import 'package:ww3_unit_builder/data/discounts.dart';

class EnabledDiscounts with ChangeNotifier {
  static final EnabledDiscounts _instance = EnabledDiscounts._();

  final Set<Discounts> _enabledDiscounts = {};

  EnabledDiscounts._();

  factory EnabledDiscounts() {
    return _instance;
  }

  Set<Discounts> get enabledDiscounts {
    return {..._enabledDiscounts};
  }

  void enableDiscount(Discounts discount) {
    _enabledDiscounts.add(discount);
    notifyListeners();
  }

  void disableDiscount(Discounts discount) {
    _enabledDiscounts.remove(discount);
    notifyListeners();
  }

  void toggleDiscount(Discounts discount) {
    if (isEnabled(discount)) {
      disableDiscount(discount);
    } else {
      enableDiscount(discount);
    }
  }

  bool isEnabled(Discounts discount) {
    return _enabledDiscounts.contains(discount);
  }
}