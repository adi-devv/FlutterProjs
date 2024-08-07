import 'package:apptwo/components/box.dart';
import 'package:apptwo/components/button.dart';
import 'package:apptwo/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import the provider package


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: MyBox(
          color: Theme.of(context).colorScheme.primary,
          child: MyButton(
            color: Theme.of(context).colorScheme.secondary,
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ),
      ),
    );
  }
}
