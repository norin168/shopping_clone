import 'package:flutter/material.dart';

extension SizedBoxSized on BuildContext {
  Widget get h4 => const SizedBox(height: 4);
  Widget get h8 => const SizedBox(height: 8);
  Widget get h10 => const SizedBox(height: 10);
  Widget get h6 => const SizedBox(height: 6);
  Widget get h12 => const SizedBox(height: 12);
  Widget get h14 => const SizedBox(height: 14);
  Widget get h16 => const SizedBox(height: 16);
  Widget get h18 => const SizedBox(height: 18);
  Widget get h20 => const SizedBox(height: 20);

  Widget get w4 => const SizedBox(width: 4);
  Widget get w8 => const SizedBox(width: 8);
  Widget get w10 => const SizedBox(width: 10);
  Widget get w6 => const SizedBox(width: 6);
  Widget get w12 => const SizedBox(width: 12);
  Widget get w14 => const SizedBox(width: 14);
  Widget get w16 => const SizedBox(width: 16);
  Widget get w18 => const SizedBox(width: 18);
  Widget get w20 => const SizedBox(width: 20);
}

extension SizeBoxByDouble on num {
  Widget get h => SizedBox(height: toDouble());
  Widget get w => SizedBox(width: toDouble());
}
