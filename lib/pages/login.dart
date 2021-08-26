import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: [
            SizedBox(
              width: 128,
              height: 128,
              child: Image.asset("assets/images/logo.png"),
            ),
            _buildSpacing(20),
            _buildTextFormField(TextInputType.emailAddress, "E-mail"),
            _buildSpacing(10),
            _buildTextFormField(TextInputType.text, "Senha"),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField(TextInputType type, String label) {
    return TextFormField(
      keyboardType: type,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.black38,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
      ),
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }

  Widget _buildSpacing(double space) {
    return SizedBox(
      height: space,
    );
  }
}
