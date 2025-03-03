import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ww3_unit_builder/data/enabled_shops.dart';
import 'package:ww3_unit_builder/data/order_provider.dart';
import 'package:ww3_unit_builder/widgets/unit_icon_widget.dart';

import '../data/formations_list.dart';
import '../data/order.dart';
import '../data/shops.dart';

class FormationSelectionWidget extends StatefulWidget {
  const FormationSelectionWidget({super.key});

  @override
  State<FormationSelectionWidget> createState() =>
      _FormationSelectionWidgetState();
}

class _FormationSelectionWidgetState extends State<FormationSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 800,
      child: Consumer<FormationsList>(
        builder: (BuildContext context, value, Widget? child) {
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            shrinkWrap: true,
            itemCount: value.formations.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(value.formations[index].name),
                leading: UnitIconWidget(
                  unitSize: value.formations[index].size,
                  unitType: value.formations[index].type,
                ),
                onTap: () {
                  List<Shops> enabledShops = context.read<EnabledShops>().enabledShops;

                  context.read<OrderProvider>().setOrder(
                    Order([value.formations[index]], enabledShops),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
