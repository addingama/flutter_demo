import 'package:flutter/material.dart';
import './random_words/random_words_app.dart';
import './ui/make_it_rain.dart';
import './ui/login_form.dart';
import './ui/weigh_on_planet_x.dart';
import './ui/body_mass_index.dart';

class AppMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new InkWell(
          onTap: () {
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new RandomWordsApp()),
            );
          },
          child: new ListTile(
            title: new Text('Random Words'),
            subtitle: new Text('Flutter.io firs app tutorial'),
            trailing: new Icon(Icons.navigate_next),
          ),
        ),
        new Divider(),
        new InkWell(
          onTap: () {
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new MakeItRainApp()),
            );
          },
          child: new ListTile(
            trailing: new Icon(Icons.navigate_next),
            title: new Text('Make it rain'),
            subtitle: new Text('Udemy course training'),
          ),
        ),
        new Divider(),
        new InkWell(
          onTap: () {
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new LoginForm()),
            );
          },
          child: new ListTile(
            trailing: new Icon(Icons.navigate_next),
            title: new Text('Login Form'),
            subtitle: new Text('Udemy course training'),
          ),
        ),
        new Divider(),
        new InkWell(
          onTap: () {
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new WeighOnPlanetX()),
            );
          },
          child: new ListTile(
            trailing: new Icon(Icons.navigate_next),
            title: new Text('Weight on Planet X'),
            subtitle: new Text('Udemy course training'),
          ),
        ),
        new Divider(),
        new InkWell(
          onTap: () {
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new BodyMassIndex()),
            );
          },
          child: new ListTile(
            trailing: new Icon(Icons.navigate_next),
            title: new Text('Body Mass Index'),
            subtitle: new Text('Udemy course training'),
          ),
        ),
        new Divider(),
      ],
    );
  }
}
