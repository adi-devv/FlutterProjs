import 'package:flutter/material.dart';

class ProfilePg extends StatefulWidget {
  const ProfilePg({super.key});

  @override
  State<ProfilePg> createState() => _ProfilePgState();
}

class _ProfilePgState extends State<ProfilePg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[600],
      body: Center(
        child: TextField(

        ),
      ),
    );
  }
}
