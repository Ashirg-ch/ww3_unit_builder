import 'package:flutter/material.dart';

import '../data/unlocks.dart';

class UnlocksWidget extends StatefulWidget {
  const UnlocksWidget({super.key});

  @override
  State<UnlocksWidget> createState() => _UnlocksWidgetState();
}

class _UnlocksWidgetState extends State<UnlocksWidget> {
  @override
  Widget build(BuildContext context) {
    // Listen to the Unlocks class and build a checkbox for every entry
    return ListenableBuilder(
      listenable: Unlocks(),
      builder: (context, child) {
        return SizedBox(
          width: 200,
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              String unlock = Unlocks().getAll()[index];
              return CheckboxListTile(
                title: Text(unlock),
                value: Unlocks().isUnlocked(unlock),
                onChanged: (value) {
                  Unlocks().setUnlocked(unlock, value!);
                },
                dense: true,
              );
            },
            itemCount: Unlocks().getAll().length,
          ),
        );
      }
    );

    /*return ListenableBuilder(
      listenable: Unlocks(),
      builder: (context, child) {
        return Column(
          children:
              Unlocks().getAll().map((name) {
                return CheckboxListTile(
                  title: Text(name),
                  value: Unlocks().isUnlocked(name),
                  onChanged: (value) {
                    Unlocks().setUnlocked(name, value!);
                  },
                );
              }).toList(),
        );
      },
    );*/
  }
}
