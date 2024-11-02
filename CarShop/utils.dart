import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Utils {
  static String formatCurrency(int value) {
    final format =
    NumberFormat.currency(locale: 'en_US', symbol: '\$ ', decimalDigits: 0);
    return format.format(value);
  }

  static void showDialogBox({
    required BuildContext context,
    required String message,
    required VoidCallback onConfirm,
  }) {
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            contentPadding: const EdgeInsets.only(top: 20),
            content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                message,
                textAlign: TextAlign.center,
              ),
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
