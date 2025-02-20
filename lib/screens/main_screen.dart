import 'package:flutter/material.dart';
import 'package:ww3_unit_builder/widgets/formation_selection_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: const FormationSelectionWidget())
    );
  }
}
