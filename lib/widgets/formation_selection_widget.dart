import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ww3_unit_builder/data/formation.dart';
import 'package:ww3_unit_builder/widgets/unit_icon_widget.dart';

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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 400,
          height: 800,
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            shrinkWrap: true,
            itemCount: formations.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(formations[index].name),
                leading: UnitIconWidget(
                  unitSize: formations[index].size,
                  unitType: formations[index].type,
                ),
                onTap: () => _onClick(index),
              );
            },
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(output),
            const SizedBox(width: 8),
            // Copy button
            ElevatedButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: output));
              },
              child: const Text('Copy'),
            ),
          ],
        ),

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
