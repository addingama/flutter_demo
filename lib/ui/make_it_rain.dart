import 'package:flutter/material.dart';

class MakeItRainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MakeItRain();
  }
}

class MakeItRain extends StatefulWidget {
  @override
  createState() => new MakeItRainState();
}

class MakeItRainState extends State<MakeItRain> {
  int _moneyCounter = 0;

  void _rainMoney() {
    //Important - setState is called each time we need to update the UI
    setState(() {
      _moneyCounter = _moneyCounter + 100;
    });
  }

  void _goToMainMenu() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Make it rain"),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: _goToMainMenu,
        ),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[

            new Center(
              child: new Padding(padding: new EdgeInsets.all(30.0), child: new Text(
                "Get Rich!",
                style:
                new TextStyle(fontSize: 29.9, fontWeight: FontWeight.w400),
              ),),
            ),
            new Expanded(
                child: new Center(
              child: new Text(
                '\$$_moneyCounter',
                style: new TextStyle(
                    fontSize: 46.9,
                    fontWeight: FontWeight.w800,
                    color: Colors.lightGreen),
              ),
            )),
            new Expanded(
                child: new Center(
              child: new RaisedButton(
                  padding: EdgeInsets.all(30.0),
                  color: Colors.lightGreen,
                  textColor: Colors.white70,
                  onPressed: _rainMoney,
                  child: new Text(
                    "Let It Rain!",
                    style: new TextStyle(fontSize: 19.9),
                  )),
            ))
          ],
        ),
      ),
    );
  }
}
