import 'package:chat_app/routes.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class GuestPage extends StatelessWidget {
  const GuestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Guest Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, AppRoutes.instance.login);
                    },
                    child: const Text("Create Account"),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      AuthService.instance.anonymousLogIn().then(
                            (value) =>
                                ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text("You login Guest"),
                              ),
                            ),
                          );
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.instance.home,
                      );
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: const Text("Login as Guest"),
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
