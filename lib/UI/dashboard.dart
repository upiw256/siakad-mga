// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_null_comparison, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:sistem_akademik/UI/login.dart';
import 'package:sistem_akademik/controller/loginController.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key, User? user}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyDasboard(
        title: 'Dashboard',
      ),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new Login(),
      },
    );
  }
}

class MyDasboard extends StatelessWidget {
  final String title;

  const MyDasboard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            FutureBuilder(
                future: FlutterSession().get("token"),
                builder: (context, snapshot) {
                  return Text(snapshot.hasData
                      ? snapshot.data.toString()
                      : 'Loading...');
                }),
            Center(
              child: MaterialButton(
                color: Colors.blueGrey,
                onPressed: () {
                  FlutterSession().set('token', '');
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text("Logout"),
              ),
            ),
          ],
        ));
  }
}
