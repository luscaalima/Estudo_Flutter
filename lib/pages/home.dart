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
    // setState(() {
    double coefA = double.parse(coeficienteA.text);
    // double coefB = double.parse(coeficienteB.text);
    // double coefC = double.parse(coeficienteC.text);
    // double delta = (coefB * coefB) - (4 * coefA * coefC);
    // print(delta);

    if (coefA != 0) {
      _showdialog(coeficienteA, coeficienteB, coeficienteC);
    }
  }

  Pattern _getSignalNumber(double num) {
    print(num);
    if (num < 0) {
      String newNum = "$num";

      List<String> newNew = newNum.split(".");
      print(newNew[0]);
      return newNew[0];
    } else {
      String newNum = "+$num";
      List<String> newNew = newNum.split(".");
      return newNew[0];
    }
  }

  Future<void> _showdialog(TextEditingController a, TextEditingController b,
      TextEditingController c) async {
    double coefA = double.parse(a.text);
    double coefB = double.parse(b.text);
    double coefC = double.parse(c.text);
    print("coeficiente A:" + a.text);
    print("coeficiente B:" + b.text);

    String newCoefA = _getSignalNumber(coefA);
    String newCoefB = _getSignalNumber(coefB);
    String newCoefC = _getSignalNumber(coefC);
    print(newCoefA);

    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
              backgroundColor: Colors.white,
              child: Container(
                height: 500.0,
                child: Column(
                  children: [
                    _montaPrimeiraLinhaDialog(newCoefA, newCoefB, newCoefC),
                    // Text(
                    //   "${_getSignalNumber(coefA)}X² ${_getSignalNumber(coefB)}X ${_getSignalNumber(coefC)} = 0 ",
                    // style: TextStyle(
                    //   color: Colors.black87,
                    //   fontSize: 28.0,
                    // ),
                    // ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                "Δ = b² - 4.a.c",
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              // Text(
                              //   "Δ = ${b.toStringAsPrecision(1)}² - 4.(${a.toStringAsPrecision(1)}).(${c.toStringAsPrecision(1)})",
                              //   style: TextStyle(
                              //     fontSize: 25,
                              //   ),
                              //   textAlign: TextAlign.center,
                              // ),
                              // Text(
                              //   "Δ = ${delta.toStringAsPrecision(1)}",
                              //   style: TextStyle(
                              //     fontSize: 25,
                              //   ),
                              //   textAlign: TextAlign.center,
                              // ),
                              // Text(
                              //   "X = -${b.toStringAsPrecision(1)} ± √${delta.toStringAsPrecision(1)} / (2.${a.toStringAsPrecision(1)})",
                              //   style: TextStyle(
                              //     fontSize: 25,
                              //   ),
                              //   textAlign: TextAlign.center,
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: MaterialButton(
                          color: Colors.blue,
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            "Close",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ));
        });
  }

  Widget _montaPrimeiraLinhaDialog(String a, String b, String c) {
    print(a + b + c);
    // _montaCoeficiente(a, b, c);
    return Text(
      "${_montaCoeficiente(a, "a")} ${_montaCoeficiente(b, "b")} ${_montaCoeficiente(c, "c")} = 0 ",
      style: TextStyle(
        color: Colors.black87,
        fontSize: 28.0,
      ),
    );
  }

  String _montaCoeficiente(String variavel, String coeficiente) {
    // trata todos casos do coeficiente a
    if (variavel != "" && coeficiente == "a") {
      if (variavel == "+1") {
        return variavel = "X²";
      }
      if (variavel == "-1") {
        return variavel = "-X²";
      } else {
        return variavel = "${variavel}X²";
      }
    }

    // trata todos casos do coeficiente b
    else if (variavel != "" && coeficiente == "b") {
      if (variavel == "+1") {
        return variavel = "+X";
      }
      if (variavel == "-1") {
        return variavel = "-X";
      } else if (variavel == "+0") {
        return variavel = "";
      } else if (variavel != "+1" && variavel != "+0") {
        return variavel = "${variavel}X";
      }
    }

    // trata todos casos do coeficiente c
    else if (variavel != "" && coeficiente == "c") {
      if (variavel == "+0") {
        return variavel = "";
      } else {
        return variavel = variavel;
      }
    }
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
                      // _showdialog();
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
