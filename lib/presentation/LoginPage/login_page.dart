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
        width: double.infinity,
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     colors: [
        //       Colors.orange.shade900,
        //       Colors.orange.shade800,
        //       Colors.orange.shade400,
        //     ],
        //   ),
        // ),
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
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // TextFormField(
                //   controller: emailController,
                //   decoration: const InputDecoration(
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(
                //         Radius.circular(20),
                //       ),
                //       borderSide: BorderSide(color: Colors.black),
                //     ),
                //     errorBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(
                //         Radius.circular(20),
                //       ),
                //       // borderSide: BorderSide(color: Colors.red),
                //     ),
                //     focusedErrorBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(
                //         Radius.circular(20),
                //       ),
                //       borderSide: BorderSide(
                //         color: Colors.black,
                //       ),
                //     ),
                //     labelText: "Email",
                //   ),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // TextFormField(
                //   controller: passwordController,
                //   decoration: const InputDecoration(
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(
                //           Radius.circular(20),
                //         ),
                //         borderSide: BorderSide(
                //           color: Colors.black,
                //         ),
                //       ),
                //       errorBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(
                //           Radius.circular(20),
                //         ),
                //         // borderSide: BorderSide(color: Colors.red),
                //       ),
                //       focusedErrorBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(
                //           Radius.circular(
                //             20,
                //           ),
                //         ),
                //         borderSide: BorderSide(
                //           color: Colors.black,
                //         ),
                //       ),
                //       labelText: "Password"),
                // ),
                // const SizedBox(
                //   height: 30,
                // ),
                // // const Divider(),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const Text("Don't have an account?"),
                //     TextButton(
                //       onPressed: () {
                //         Navigator.pushNamed(context, AppRoutes.instance.signup);
                //       },
                //       child: const Text(
                //         "Signup",
                //         style: TextStyle(
                //           decoration: TextDecoration.underline,
                //           decorationColor: Colors.black,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // OutlinedButton(
                //   onPressed: () async {
                //     User? user = await AuthService.instance.anonymousLogIn();
                //
                //     if (user != null) {
                //       Navigator.of(context).pushReplacementNamed('home');
                //     } else {
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         const SnackBar(
                //           content: Text("Login Failed"),
                //           backgroundColor: Colors.red,
                //           behavior: SnackBarBehavior.floating,
                //         ),
                //       );
                //     }
                //   },
                //   child: const Text("Anonymous"),
                // ),
                // IconButton(
                //   onPressed: () async {
                //     UserCredential credential =
                //         await AuthService.instance.signInWithGoogle();
                //
                //     User? user = credential.user;
                //
                //     if (user != null) {
                //       await FireStoreService.instance.addUser(user: user);
                //       await FireStoreService.instance.getUser();
                //       Navigator.of(context).pushReplacementNamed('home');
                //     }
                //   },
                //   icon: const Icon(Icons.g_mobiledata),
                // ),
                // OutlinedButton(
                //   onPressed: () async {
                //     User? user = await AuthService.instance.signIn(
                //       email: emailController.text,
                //       psw: passwordController.text,
                //     );
                //     if (user != null) {
                //       await FireStoreService.instance.getUser();
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         const SnackBar(
                //           content: Text("Login Success"),
                //           backgroundColor: Colors.green,
                //           behavior: SnackBarBehavior.floating,
                //         ),
                //       );
                //       Navigator.of(context).pushReplacementNamed('home');
                //     } else {
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         const SnackBar(
                //           content: Text("Login Failed"),
                //           backgroundColor: Colors.red,
                //           behavior: SnackBarBehavior.floating,
                //         ),
                //       );
                //     }
                //   },
                //   child: const Text("Sign IN"),
                // ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    icon: Icon(Icons.email),
                    labelText: "Email",
                    hintText: "Enter Your Email",
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
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    icon: Icon(Icons.password),
                    labelText: "Password",
                    hintText: "Enter Your Password",
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 15),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.instance.signup);
                      },
                      child: const Text(
                        "Signup",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                OutlinedButton(
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
                  height: 20,
                ),
                IconButton(
                  onPressed: () {
                    AuthService.instance.signInWithGoogle().then(
                          (value) => Navigator.of(context)
                              .pushReplacementNamed('home'),
                        );
                  },
                  icon: const ImageIcon(
                    AssetImage("lib/assets/google.png"),
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
