import 'package:flutter/foundation.dart';
import 'package:ww3_unit_builder/data/order.dart';

class OrderProvider with ChangeNotifier, DiagnosticableTreeMixin {
  Order? _order;

  Order? get order => _order;

  void setOrder(Order? order) {
    _order = order;
    notifyListeners();
  }
}
