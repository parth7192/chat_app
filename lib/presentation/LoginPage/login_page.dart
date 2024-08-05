import 'package:chat_app/routes.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/back.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    icon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    labelText: "Email",
                    hintText: "Enter Your Email",
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    icon: Icon(
                      Icons.password,
                      color: Colors.white,
                    ),
                    labelText: "Password",
                    hintText: "Enter Your Password",
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.instance.signup);
                      },
                      child: const Text(
                        "Signup",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    User? user = await AuthService.instance.anonymousLogIn();

                    if (user != null) {
                      Navigator.of(context).pushReplacementNamed('home');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Login Failed"),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                  child: const Text("Anonymous"),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    User? user = await AuthService.instance.register(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                    if (user != null) {
                      await FireStoreService.instance.addUser(user: user);
                      await FireStoreService.instance.getUser();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("REGISTERED !!"),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                  child: const Text("email-pass REGISTER"),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    User? user = await AuthService.instance.signIn(
                      email: emailController.text,
                      psw: passwordController.text,
                    );
                    if (user != null) {
                      await FireStoreService.instance.getUser();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("SIGN UP !!"),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                      Navigator.of(context).pushReplacementNamed('home_page');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("FAILLED !!"),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                  child: const Text("email-pass Sign In"),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        AuthService.instance.signInWithGoogle().then(
                              (value) => Navigator.of(context)
                                  .pushReplacementNamed('home'),
                            );
                      },
                      icon: Padding(
                        padding: const EdgeInsets.only(),
                        child: Image.asset(
                          "lib/assets/google.png",
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Padding(
                        padding: const EdgeInsets.only(),
                        child: Image.asset(
                          "lib/assets/micro.png",
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Padding(
                        padding: const EdgeInsets.only(),
                        child: Image.asset(
                          "lib/assets/facebook.png",
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
