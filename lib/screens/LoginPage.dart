import 'package:catalog_app/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userName = "";
  bool changeButton = false;
  var animationDuration = 0.5;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/undraw_secure_login_pdn4.png',
                  fit: BoxFit.cover,
                ),
                Text(
                  "Welcome $userName",
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Enter username.",
                              labelText: "Username"),
                          onChanged: (value) {
                            setState(() {
                              userName = value;
                            });
                          }),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: "Enter password.", labelText: "Password"),
                      ),
                      const SizedBox(height: 40),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     // print('Hey, Zuhair!');
                      //   },
                      //   child: const Text("Login"),
                      //   style:
                      //   TextButton.styleFrom(minimumSize: const Size(100, 40)),
                      // )
                      InkWell(
                        onTap: () async {
                          setState(() {
                            changeButton = true;
                          });
                          await Future.delayed(Duration(seconds: 1));
                          Navigator.pushNamed(context, DefaultRoutes.homeRoute);
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          width: changeButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(Icons.done, color: Colors.white)
                              : const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              // shape: changeButton ? BoxShape.circle : BoxShape.rectangle,
                              borderRadius:
                              BorderRadius.circular(changeButton ? 50 : 0)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}
