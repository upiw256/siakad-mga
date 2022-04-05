import 'package:flutter/material.dart';
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
      body: Center(
        child: Text("sip"),
      ),
    );
  }
}
