import 'package:ww3_unit_builder/data/order_position.dart';
import 'package:ww3_unit_builder/data/shops.dart';

import 'formation.dart';

class Order {
  final List<Formation> _formations;
  final List<Shops> _enabledShops;
  final List<OrderPosition> _positions = [];

  Order(this._formations, this._enabledShops) {
    List<OrderPosition> redundantPositions = [];
    for (final formation in _formations) {
      redundantPositions.addAll(formation.getAllUnits);
    }

    for (final position in redundantPositions) {
      if (!_enabledShops.contains(position.unitType.shop)) continue;

      bool found = false;
      for (final position2 in _positions) {
        if (position2.equals(position)) {
          OrderPosition newUnit = OrderPosition(
            position2.count + position.count,
            position2.unitType,
            modifications: position2.modifications,
          );
          _positions.remove(position2);
          _positions.add(newUnit);
          found = true;
          break;
        }
      }
      if (!found) {
        _positions.add(position);
      }
    }

    _positions.sort(
      (a, b) => a.unitType.supplyCategory.index.compareTo(
        b.unitType.supplyCategory.index,
      ),
    );
  }

  int get totalCost {
    return _positions.fold(0, (cost, position) => cost + position.totalCost);
  }

  int get totalSupply {
    return _positions.fold(0, (sup, element) => sup + element.totalSupply);
  }

  int get supplyConsumed {
    return _positions
        .where((element) => element.unitType.supplyCategory.consumesSupply)
        .fold(0, (sup, element) => sup + element.totalSupply);
  }

  int get supplyProvided {
    return _positions
        .where((element) => element.unitType.supplyCategory.providesSupply)
        .fold(0, (sup, element) => sup + element.totalSupply);
  }

  @override
  String toString() {
    return '''
${_formations.map((e) => e.name).join('\n')}

Units:
${_positions.map((e) => e).join('\n')}

Total cost: \$$totalCost
Total supply: $totalSupply SU
Supply consumed: $supplyConsumed SU
Supply provided: $supplyProvided SU
Supply ratio: ${supplyConsumed == 0 ? 'N/A' : (supplyProvided / supplyConsumed.abs() * 100).toStringAsFixed(3)}%
''';
  }
}
