import 'package:flutter/material.dart';

/// The various shops that units can belong to.
enum Shops {
  independent(Color(0x00fa6969)),
  eu(Color(0x0000b0ff)),
  russia(Color(0xffff0000)),
  china(Color(0x00c27c0e)),
  usa(Color(0x00206694)),
  saf(Colors.green),
  research(Colors.white);

  final Color color;

  const Shops(this.color);

  /// Converts a string to a [Shops] value.
  ///
  /// Throws an [ArgumentError] if the string is not a valid shop.
  static Shops fromString(String shop) {
    return values.firstWhere(
      (e) => e.toString() == 'Shops.$shop',
      orElse: () => throw ArgumentError('Invalid shop: $shop'),
    );
  }
}
