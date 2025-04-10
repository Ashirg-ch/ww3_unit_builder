import 'package:flutter/foundation.dart';
import 'package:ww3_unit_builder/data/shops.dart';

class EnabledShops with ChangeNotifier {
  final List<Shops> _enabledShops = [
    Shops.all
  ];

  List<Shops> get enabledShops {
    return [..._enabledShops];
  }

  void enableShop(Shops shop) {
    _enabledShops.add(shop);
    notifyListeners();
  }

  void disableShop(Shops shop) {
    _enabledShops.remove(shop);
    notifyListeners();
  }

  void toggleShop(Shops shop) {
    if (isEnabled(shop)) {
      disableShop(shop);
    } else {
      enableShop(shop);
    }
  }

  bool isEnabled(Shops shop) {
    return _enabledShops.contains(shop);
  }
}
