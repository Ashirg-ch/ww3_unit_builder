import 'package:flutter/material.dart';

/// The various shops that units can belong to.
enum Shops {
  /// Units available to all factions.
  all(Colors.white),
  independent(Color(0xfffa6969)),
  eu(Color(0xff00b0ff)),
  russia(Color(0xffff0000)),
  china(Color(0xffc27c0e)),
  usa(Color(0xff206694)),
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
