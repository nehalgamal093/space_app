import 'package:flutter/material.dart';

class TextDetails extends StatelessWidget {
  final String label;
  final String details;
  const TextDetails({required this.label, required this.details, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: Theme.of(context).textTheme.titleMedium),
        Text(details, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}
