import 'package:dalel/core/function/custom_navigate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOme page"),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                customReplacementNavigate(context, '/logIn');
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              final pr = FirebaseAuth.instance.currentUser!.emailVerified;
              print(pr);
            },
            child: Text('print')),
      ),
    );
  }
}
