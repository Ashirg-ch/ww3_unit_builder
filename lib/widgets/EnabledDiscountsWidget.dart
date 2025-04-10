import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/discounts.dart';
import '../data/enabled_discounts.dart';

class EnabledDiscountsWidget extends StatelessWidget {
  const EnabledDiscountsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Enabled Discounts'),
        const SizedBox(height: 8),
        SizedBox(
          width: 200,
          child: Consumer<EnabledDiscounts>(
            builder: (context, discounts, child) {
              return Column(
                children:
                    Discounts.values
                        .map(
                          (discount) => CheckboxListTile(
                            title: Text(discount.toString().split('.').last),
                            value: discounts.isEnabled(discount),
                            dense: true,
                            onChanged: (value) {
                              discounts.toggleDiscount(discount);
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
