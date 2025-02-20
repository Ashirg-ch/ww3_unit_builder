import 'package:flutter/material.dart';
import 'package:ww3_unit_builder/data/formation.dart';
import 'package:ww3_unit_builder/data/order_position.dart';

import '../data/formations_list.dart';

class FormationSelectionWidget extends StatefulWidget {
  const FormationSelectionWidget({super.key});

  @override
  State<FormationSelectionWidget> createState() =>
      _FormationSelectionWidgetState();
}

class _FormationSelectionWidgetState extends State<FormationSelectionWidget> {
  List<Formation> formations = FormationsList().formations;

  String output = '';

  void _onClick(int index) {
    String newOutput = '${formations[index].name}\n';
    List<OrderPosition> allUnitsRedundant = formations[index].getAllUnits;
    List<OrderPosition> allUnits = [];

    for (final unit in allUnitsRedundant) {
      bool found = false;
      for (final unit2 in allUnits) {
        if (unit2.equals(unit)) {
          OrderPosition newUnit = OrderPosition(
            unit2.count + unit.count,
            unit2.unitType,
            modifications: unit2.modifications,
          );
          allUnits.remove(unit2);
          allUnits.add(newUnit);
          found = true;
          break;
        }
      }
      if (!found) {
        allUnits.add(unit);
      }
    }

    allUnits.sort(
      (a, b) => a.unitType.supplyCategory.index.compareTo(
        b.unitType.supplyCategory.index,
      ),
    );

    newOutput += allUnits.map((e) => e).join('\n');

    int totalCost = allUnits.fold(
      0,
      (cost, position) => cost + position.totalCost,
    );
    newOutput += '\nCost: \$$totalCost';

    int totalSupply = allUnits.fold(
      0,
      (sup, element) => sup + element.totalSupply,
    );
    newOutput += '\nSupply: $totalSupply SU';

    setState(() {
      output = newOutput;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisSize: MainAxisSize.min,
      children: [
        ListView.builder(
          padding: const EdgeInsets.all(8),
          shrinkWrap: true,
          itemCount: formations.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(formations[index].name),
              onTap: () => _onClick(index),
            );
          },
        ),
        Text(output),
        ElevatedButton(
          onPressed:
              () => setState(() {
                formations = FormationsList().formations;
              }),
          child: Text('Reload'),
        ),
      ],
    );
  }
}
