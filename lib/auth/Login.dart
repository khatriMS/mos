import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/icmos.jpg"),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                        label: Text("Username or email address")),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.key),
                        label: Text("Password")),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Text("if you don't have account "),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'click her :',
                            style: TextStyle(color: Colors.blue[500]),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      child: ElevatedButton(
                    onPressed: () {},
                    child: Text('submet'),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
