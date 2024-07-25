import 'package:flutter/material.dart';

class remTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;

  remTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: GestureDetector(
        onTap: () => onChanged!(!taskCompleted), // Toggle the checkbox when the tile is tapped
        child: Container(
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.lightGreen[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                fillColor: WidgetStateProperty.all(Colors.lightGreen),
              ),
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
