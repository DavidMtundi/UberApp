import 'package:flutter/material.dart';

class DebitCard {
  final Image logo;
  final String lastDigits;
  final String expiry;
  DebitCard({required this.logo, required this.lastDigits, required this.expiry})
      : assert(expiry != null),
        assert(lastDigits != null);
}
