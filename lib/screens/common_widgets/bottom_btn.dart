import 'package:flutter/material.dart';

class BottomBtn extends StatelessWidget {
  final String title;
  final Function() function;
  const BottomBtn({required this.function, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 18),
        decoration: const BoxDecoration(
          color: Color(0xffEE403D),
          borderRadius: BorderRadius.all(
            Radius.circular(29),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Icon(
              Icons.arrow_forward_outlined,
              size: 22,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
