
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: FirstHome(),
      onGenerateRoute: (settings) {
        switch(settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => FirstHome());
            break;
          case '/second':
            User user = settings.arguments;
            return MaterialPageRoute(builder: (context) => SecondHome(user: user));
            break;
          default:
            return MaterialPageRoute(builder: (context) => FirstHome());
        }
      },
    ),
  );
}
class User {
  final String name;
  final int age;

  User({ this.name, this.age });
}

class FirstHome extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First home'),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            User user = User(name: 'Maina', age: 35);
            Navigator.pushNamed(context, '/second', arguments: user);
          },
          child: Text('Ouuuu home'),
        ),
      ),
    );
  }
}

class SecondHome extends StatelessWidget {

  final User user;
  SecondHome({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.user.name} - ${this.user.age}'),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go Back'),
        ),
      ),
    );
  }
}
