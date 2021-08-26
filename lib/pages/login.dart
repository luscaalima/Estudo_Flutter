import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool visible = true;
  TextEditingController email;
  TextEditingController senha;

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
            _buildTextFormField(
                TextInputType.emailAddress, "E-mail", false, this.email),
            _buildSpacing(10),
            Stack(
              children: [
                _buildTextFormField(
                    TextInputType.text, "Senha", this.visible, this.senha),
                Padding(
                  padding: EdgeInsets.only(
                    left: 280.0,
                    top: 30.0,
                    // right: 20.0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        this.visible = !this.visible;
                        print("passou setState");
                      });
                    },
                    child: Icon(
                      Icons.remove_red_eye_sharp,
                      size: 30.0,
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

  Widget _buildTextFormField(TextInputType type, String label, bool showText,
      TextEditingController controller) {
    return TextFormField(
      controller: controller,
      obscureText: showText,
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
