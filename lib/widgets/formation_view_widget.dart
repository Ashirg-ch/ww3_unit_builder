import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../data/order_provider.dart';

class FormationViewWidget extends StatelessWidget {
  const FormationViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String output = context.watch<OrderProvider>().order.toString();

    return Row(
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
    );
  }
}
