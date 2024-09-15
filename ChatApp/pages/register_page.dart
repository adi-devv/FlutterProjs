import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _cnfpassController = TextEditingController();

  final void Function()? onTap;

  RegisterPage({
    super.key,
    required this.onTap,
  });

  void register() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            const SizedBox(height: 50),
            Text(
              "Let's create a new account for you!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 25),
            MyTextfield(
              hintText: 'Email',
              obscureText: false,
              controller: _emailController,
            ),
            const SizedBox(height: 20),
            MyTextfield(
              hintText: 'Password',
              obscureText: true,
              controller: _passController,
            ),
            const SizedBox(height: 20),
            MyTextfield(
              hintText: 'Confirm Password',
              obscureText: true,
              controller: _cnfpassController,
            ),
            const SizedBox(height: 25),
            MyButton(
              text: 'Sign Up',
              onTap: register,
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Login now',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
