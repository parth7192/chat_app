import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/services/firestore_service.dart';
import 'package:flutter/material.dart';

class FriendPage extends StatelessWidget {
  const FriendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 150,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: IconButton(
                onPressed: () {},
                icon: Padding(
                  padding: const EdgeInsets.only(),
                  child: Image.asset(
                    "lib/assets/google.png",
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: IconButton(
                onPressed: () {},
                icon: Padding(
                  padding: const EdgeInsets.only(),
                  child: Image.asset(
                    "lib/assets/facebook.png",
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
