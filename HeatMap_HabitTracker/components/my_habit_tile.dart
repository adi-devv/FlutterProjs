import 'package:flutter/material.dart';

class MyHabitTile extends StatelessWidget {
  final String text;
  final bool isCompleted;
  final void Function(bool?)? onChanged;

  const MyHabitTile(
      {super.key,
      required this.text,
      required this.isCompleted,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isCompleted
              ? Colors.green
              : Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: ListTile(
        title: Text(text),
        leading: Checkbox(
          activeColor: Colors.green,
          value: isCompleted,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
