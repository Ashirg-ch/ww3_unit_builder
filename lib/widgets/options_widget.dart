import 'package:flutter/material.dart';
import 'package:ww3_unit_builder/widgets/enabled_shops_widget.dart';
import 'package:ww3_unit_builder/widgets/unlocks_widget.dart';

import 'EnabledDiscountsWidget.dart';

class OptionsWidget extends StatelessWidget {
  const OptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        UnlocksWidget(),
        EnabledShopsWidget(),
        EnabledDiscountsWidget(),
      ],
    );
  }
}
