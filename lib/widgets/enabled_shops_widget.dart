import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ww3_unit_builder/data/enabled_shops.dart';
import 'package:ww3_unit_builder/data/shops.dart';

class EnabledShopsWidget extends StatelessWidget {
  const EnabledShopsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Enabled Shops'),
        const SizedBox(height: 8),
        SizedBox(
          width: 200,
          child: Consumer<EnabledShops>(
            builder: (context, shops, child) {
              return Column(
                children:
                    Shops.values
                        .map(
                          (shop) => CheckboxListTile(
                            title: Text(shop.toString().split('.').last),
                            value: shops.isEnabled(shop),
                            dense: true,
                            activeColor: shop.color,
                            onChanged: (value) {
                              shops.toggleShop(shop);
                            },
                          ),
                        )
                        .toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}
