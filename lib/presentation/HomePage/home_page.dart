import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () {
              AuthService.instance.logOut().then((value) {
                Navigator.of(context).pushReplacementNamed('/');
              });
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
