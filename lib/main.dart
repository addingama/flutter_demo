import 'package:flutter/material.dart';
import './app_menu.dart';


void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Addin's Flutter Showcase",
        theme: new ThemeData(
            primaryColor: Colors.red,
            accentColor: Colors.redAccent,
            primaryColorDark: Colors.black),
        home: new Scaffold(
            appBar: new AppBar(title: new Text("Addin's Flutter Showcase")),
            body: new AppMenu()));
  }
}
