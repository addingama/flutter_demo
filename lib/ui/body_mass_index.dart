import 'package:flutter/material.dart';

class BodyMassIndex extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BodyMassIndexState();
  }
}

class BodyMassIndexState extends State<BodyMassIndex> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();

  double _bmiResult = 0.0;
  String _bmiStatus = "";

  void _calculateBmi() {
    if (_formKey.currentState.validate()) {
      // BMI Formula -> weight kg / (height_cm^2) * 10.000
      setState(() {
        double height = double.parse(_heightController.text);
        double weight = double.parse(_weightController.text);
        _bmiResult = (weight / (height * height)) * 10000;

        if (_bmiResult < 18.5) {
          _bmiStatus = "Underweight";
        }
        if (_bmiResult >= 18.5 && _bmiResult <= 24.9) {
          _bmiStatus = "Normal";
        }
        if (_bmiResult >= 25.0 && _bmiResult <= 29.9) {
          _bmiStatus = "Overweight";
        }
        if (_bmiResult >= 30) {
          _bmiStatus = "Obese";
        }
      });

      // If the form is valid, we want to show a Snackbar
      _scaffoldKey.currentState
          .showSnackBar(new SnackBar(content: new Text("BMI Calculated.")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
          title: new Text("Body Mass Index"),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent),
      backgroundColor: Colors.white,
      body: new ListView(
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.all(10.0),
          ),
          new Image.asset(
            'images/bmilogo.png',
            width: 75.0,
            height: 85.0,
          ),
          new Padding(
            padding: EdgeInsets.all(10.0),
          ),
          new Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(20.0),
              color: Colors.grey.shade300,
              child: new Form(
                key: _formKey,
                child: new Column(
                  children: <Widget>[
                    new TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your ages';
                        }
                      },
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: 'Age',
                          icon: new Icon(Icons.person_outline)),
                    ),
                    new Padding(
                      padding: EdgeInsets.all(10.0),
                    ),
                    new TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your height';
                        }
                      },
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: 'Height in centimeter',
                          icon: new Icon(Icons.insert_chart)),
                    ),
                    new Padding(
                      padding: EdgeInsets.all(10.0),
                    ),
                    new TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your weight';
                        }
                      },
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: 'Weight in kilogram',
                          icon: new Icon(Icons.line_weight)),
                    ),
                    new Padding(
                      padding: EdgeInsets.all(10.0),
                    ),
                    new Center(
                      child: new MaterialButton(
                        padding: EdgeInsets.all(15.0),
                        onPressed: _calculateBmi,
                        color: Colors.pink,
                        child: new Text("Calculate",
                            style: new TextStyle(color: Colors.white)),
                      ),
                    )
                  ],
                ),
              )),
          new Padding(
            padding: EdgeInsets.all(5.0),
          ),
          new Text("BMI : ${_bmiResult.toStringAsFixed(1)}",
              textAlign: TextAlign.center,
              style: new TextStyle(color: Colors.blue, fontSize: 22.0)),
          new Padding(
            padding: EdgeInsets.all(5.0),
          ),
          new Text(
            "$_bmiStatus",
            textAlign: TextAlign.center,
            style: new TextStyle(color: Colors.pinkAccent, fontSize: 20.0),
          )
        ],
      ),
    );
  }
}
