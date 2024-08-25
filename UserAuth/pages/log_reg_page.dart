import 'package:authentication_app/pages/login_page.dart';
import 'package:authentication_app/pages/register_page.dart';
import 'package:flutter/material.dart';

class LogRegPage extends StatefulWidget {
  const LogRegPage({super.key});

  @override
  State<LogRegPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<LogRegPage> {
  bool redirect = true;

  void togglePages() {
    setState(() {
      redirect = !redirect;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (redirect) {
      return LoginPage(
        onTap: togglePages,
      );
    } else {
      return RegisterPage(onTap: togglePages);
    }
  }
}
