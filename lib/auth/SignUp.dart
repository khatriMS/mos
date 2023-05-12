import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String result = "";

  TextEditingController nom = TextEditingController();

  TextEditingController tel = TextEditingController();

  TextEditingController C_id = TextEditingController();

  TextEditingController pss = TextEditingController();

  insert_user() async {
    final http.Response response =
        await http.post(Uri.parse("http://10.0.2.2/api/add.php"), body: {
      'nom': nom.text,
      'tel': tel.text,
      'C_id': C_id.text,
      'pss': pss.text,
    });
    if (response.statusCode == 200) {
      Navigator.of(context).pop("inserted");
    } else {
      print('Erreur: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Signup"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  "images/man.jpeg",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "Prénom et nom",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: nom,
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    labelText: "Teléphone",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: tel,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: "E-mail",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: C_id,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.key),
                    labelText: "Mot de passe",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: pss,
                obscureText: true,
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    insert_user();
                  },
                  icon: Icon(Icons.save),
                  label: Text("save"))
            ],
          ),
        ),
      ),
    );
  }
}
