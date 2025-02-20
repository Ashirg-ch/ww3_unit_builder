import 'package:flutter/material.dart';
import 'package:ww3_unit_builder/data/formation.dart';
import 'package:ww3_unit_builder/data/order_position.dart';

import '../data/formations_list.dart';
import '../data/order.dart';

class FormationSelectionWidget extends StatefulWidget {
  const FormationSelectionWidget({super.key});

  @override
  State<FormationSelectionWidget> createState() =>
      _FormationSelectionWidgetState();
}

class _FormationSelectionWidgetState extends State<FormationSelectionWidget> {
  List<Formation> formations = FormationsList().formations;

  String output = '';
  Order? order;

  void _onClick(int index) {
    order = Order([formations[index]]);

    setState(() {
      output = order.toString();
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
