import 'package:chat_app/routes.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/services/firestore_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                foregroundImage: NetworkImage(
                  FireStoreService.instance.currentUser?.photoURL ??
                      "https://st4.depositphotos.com/4329009/19956/v/450/depositphotos_199564354-stock-illustration-creative-vector-illustration-default-avatar.jpg",
                ),
              ),
              accountName: Text(
                FireStoreService.instance.currentUser?.displayName ?? "Demo",
              ),
              accountEmail: Text(
                FireStoreService.instance.currentUser?.email ??
                    "demo@gmail.com",
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Friends"),
              trailing: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.instance.friend);
                },
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title:
            Text(AuthService.instance.auth.currentUser!.displayName ?? "Guest"),
        actions: [
          IconButton(
            onPressed: () {
              AuthService.instance.logOut().then(
                (value) {
                  Navigator.of(context).pushReplacementNamed('/');
                },
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
