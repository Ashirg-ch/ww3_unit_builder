import 'package:flutter/material.dart';
import 'package:ww3_unit_builder/widgets/formation_selection_widget.dart';
import 'package:ww3_unit_builder/widgets/formation_view_widget.dart';
import 'package:ww3_unit_builder/widgets/options_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FormationSelectionWidget(),
            FormationViewWidget(),
            OptionsWidget(),
          ],
        ),
      ),
    );
  }
}
