import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset('assets/images/undraw_secure_login_pdn4.png',
            fit: BoxFit.cover,
          ),
          const Text("Welcome", style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          ),
          const SizedBox(
            height: 20,
          ),
        Padding(padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),child: Column(children: [
          TextFormField(
            decoration: const InputDecoration(
                hintText: "Enter username.",
                labelText:"Username"
            ),

          ),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
                hintText: "Enter password.",
                labelText:"Password"
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: (){print('Hey, Zuhair!');}, child: const Text("Login"), style: TextButton.styleFrom(),)
        ],
        )
          ,)
        ],
      )
    );
  }
}
