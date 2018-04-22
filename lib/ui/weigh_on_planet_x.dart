import 'package:flutter/material.dart';

class WeighOnPlanetX extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new WeightOnPlanetXState();
  }
}

class WeightOnPlanetXState extends State<WeighOnPlanetX> {
  final TextEditingController _weightController = new TextEditingController();
  int radioValue = 0;
  double _multiplier = 0.0;
  double _finalResult = 0.0;
  String _formattedText = "";

  double calculateWeight(String weight) {
    if (weight.length > 0 && int.parse(weight) > 0) {
      return int.parse(weight) * _multiplier;
    }

    return 0.0;
  }

  void _handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;

      switch (radioValue) {
        case 0:
          _multiplier = 0.06;
          _finalResult = calculateWeight(_weightController.text);
          _formattedText =
              "Your weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1:
          _multiplier = 0.38;
          _finalResult = calculateWeight(_weightController.text);
          _formattedText =
              "Your weight on Mars is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 2:
          _multiplier = 0.91;
          _finalResult = calculateWeight(_weightController.text);
          _formattedText =
              "Your weight on Venus is ${_finalResult.toStringAsFixed(1)}";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight on Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset('images/planet.png', height: 133.0, width: 200.0),
            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                    onChanged: (text) => _handleRadioValueChanged(radioValue),
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Your weight on Earth',
                        hintText: 'In Pounds',
                        icon: new Icon(Icons.person_outline)),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(5.0),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                          activeColor: Colors.brown,
                          value: 0,
                          groupValue: radioValue,
                          onChanged: _handleRadioValueChanged),
                      new Text(
                        "Pluto",
                        style: new TextStyle(color: Colors.white30),
                      ),
                      new Radio<int>(
                          activeColor: Colors.redAccent,
                          value: 1,
                          groupValue: radioValue,
                          onChanged: _handleRadioValueChanged),
                      new Text(
                        "Mars",
                        style: new TextStyle(color: Colors.white30),
                      ),
                      new Radio<int>(
                          activeColor: Colors.orangeAccent,
                          value: 2,
                          groupValue: radioValue,
                          onChanged: _handleRadioValueChanged),
                      new Text(
                        "Venus",
                        style: new TextStyle(color: Colors.white30),
                      ),
                    ],
                  ),
                  new Padding(padding: new EdgeInsets.all(15.6)),
                  new Text(
                    _weightController.text.isEmpty
                        ? "Please enter weight"
                        : "$_formattedText lbs",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        color: Colors.white30,
                        fontSize: 19.4,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
