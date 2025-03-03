import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';
import 'package:ww3_unit_builder/data/enabled_shops.dart';
import 'package:ww3_unit_builder/data/order_provider.dart';
import 'package:ww3_unit_builder/data/unit_type_list.dart';
import 'package:ww3_unit_builder/screens/main_screen.dart';

import 'data/formations_list.dart';
import 'data/modifications_list.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        ChangeNotifierProvider(create: (_) => FormationsList()),
        ChangeNotifierProvider(create: (_) => EnabledShops())
      ],
      child: const MyApp(),
    ),
  );
  _loadData();
}

void _loadData() {
  _readFile('assets/json/units.json').then((json) {
    UnitTypeList().loadUnitTypes(json);
  });
  _readFile('assets/json/modifications.json').then((json) {
    ModificationsList().loadModifications(json);
  });
  _readFile('assets/json/formations.json').then((json) {
    FormationsList().loadFormations(json);
  });
}

Future<String> _readFile(String filePath) async {
  return rootBundle.loadString(filePath);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      title: 'WW3 Unit Builder',
      theme: ThemeData(primarySwatch: Colors.blue),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        listTileTheme: ListTileThemeData(
          tileColor: Colors.grey[800],
          selectedTileColor: Colors.blue[800],
        ),
      ),
      home: MainScreen(),
    );
  }
}
