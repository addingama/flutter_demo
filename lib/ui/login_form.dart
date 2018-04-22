import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String _welcomeString;

    void _showWelcome() {
      setState(() {
        if (_userController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
          _welcomeString = _userController.text;
        } else {
          _welcomeString = "";
        }
      });
    }

  void _erase() {
    setState(() {
      _userController.clear();
      _passwordController.clear();

    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: new AppBar(
        title: new Text("Login Form"),
        // backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(40.0),
              child: new Image.asset(
                'images/secure.png',
                width: 90.0,
                height: 90.0,
              ),
            ),
            // form
            new Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _userController,
                    decoration: new InputDecoration(
                        hintText: 'Username', icon: new Icon(Icons.person)),
                  ),
                  new Padding(padding: new EdgeInsets.all(10.5)),
                  new TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: new InputDecoration(
                        hintText: 'Password',
                        icon: new Icon(Icons.lock)),
                  ),
                  new Padding(padding: new EdgeInsets.all(20.5)),
                  new Center(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        new Container(
                          child: new RaisedButton(
                              color: Colors.redAccent,
                              onPressed: _showWelcome,
                              child: new Text("Login",
                              style: new TextStyle(color: Colors.white, fontSize: 16.9),)),
                        ),
                        new Container(
                          child: new RaisedButton(
                              color: Colors.redAccent,
                              onPressed: _erase,
                              child: new Text("Clear",
                                style: new TextStyle(color: Colors.white, fontSize: 16.9),)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            new Padding(padding: const EdgeInsets.all(14.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("Welcome, $_welcomeString",
                  style: new TextStyle(color: Colors.white,
                      fontSize: 19.9,
                      fontWeight: FontWeight.w500),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
