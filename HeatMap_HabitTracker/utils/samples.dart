import 'package:flutter/material.dart';

class Utils {
  static void showDialogBox({
    required BuildContext context,
    required Widget content,
    required VoidCallback onConfirm,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: const EdgeInsets.only(top: 20,bottom: 10),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: content,
        ),
        actionsPadding: const EdgeInsets.all(10),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                  onConfirm();
                },
                child: const Text("Confirm"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
