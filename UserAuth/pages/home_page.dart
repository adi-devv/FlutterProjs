import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          ),
        ],
        actionsIconTheme: const IconThemeData(color: Colors.white60),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Text(
            '${user.email!}, logged in baby!',
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
