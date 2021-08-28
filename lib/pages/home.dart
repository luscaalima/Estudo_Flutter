import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController coeficienteA = TextEditingController();
  TextEditingController coeficienteB = TextEditingController();
  TextEditingController coeficienteC = TextEditingController();

  String _infoText = "INICIO";

  void _resetFields() {
    setState(() {
      coeficienteA.text = "";
      coeficienteB.text = "";
      _infoText = "INICIO CHANGE";
    });
  }

  void _calculate() {
    print("passou na função");
    setState(() {
      double coefA = double.parse(coeficienteA.text);
      double coefB = double.parse(coeficienteB.text);
      double coefC = double.parse(coeficienteC.text);
      double delta = (coefB * coefB) - (4 * coefA * coefC);
      print(delta);

      if (delta == 0) {
        print("Solução unica");
        var x1 = -coefB / (2 * coefA);
        _infoText = "A solução é ${x1} ";
        print(x1);
      } else if (delta < 0) {
        print("Não existe solução nos reais");
      } else if (delta > 0) {
        var x1 = -(coefB + sqrt(delta)) / (2 * coefA);
        var x2 = -(coefB - sqrt(delta)) / (2 * coefA);
        _infoText = "As solução são ${x1} e ${x2}";
        print("Existem duas soluções");
      }

      // _infoText = "INICIO CHANGEEEE CHANGE";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de Bhaskara"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh,
            ),
            onPressed: () {
              _resetFields();
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.person_outline,
                size: 120.0,
                color: Colors.green,
              ),
              TextField(
                controller: coeficienteA,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "a (x²)",
                  labelStyle: TextStyle(
                    color: Colors.green,
                  ),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 25.0,
                ),
              ),
              TextField(
                controller: coeficienteB,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "b (x)",
                  labelStyle: TextStyle(
                    color: Colors.green,
                  ),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 25.0,
                ),
              ),
              TextField(
                controller: coeficienteC,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "b (x)",
                  labelStyle: TextStyle(
                    color: Colors.green,
                  ),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 25.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {
                      print("passou");
                      _calculate();
                    },
                    child: Text(
                      "Calcular",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                    color: Colors.green,
                  ),
                ),
              ),
              Text(
                _infoText,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 25.0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
