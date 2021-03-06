// ignore_for_file: avoid_unnecessary_containers, unnecessary_const, prefer_const_constructors, deprecated_member_use, prefer_void_to_null, avoid_init_to_null, unused_import, unused_field, unnecessary_new, unrelated_type_equality_checks, avoid_print, non_constant_identifier_names, unused_local_variable, unnecessary_import, unused_element, dead_code, unused_label, unnecessary_null_comparison

import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sistem_akademik/UI/dashboard.dart';
import 'package:sistem_akademik/controller/loginController.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userName = new TextEditingController();
  TextEditingController Password = new TextEditingController();
  String msg = "";
  Future<Map<String, dynamic>> _Login() async {
    final response =
        await http.post(Uri.parse("http://192.168.50.2:8000/api/users"), body: {
      "nisn": userName.text,
      "password": Password.text,
    });
    var data = json.decode(response.body);
    final result = data['data'][0];
    if (data['data'][0]['id'] == null) {
      setState(() {
        msg = "Username atau Password salah";
      });
    } else {
      await FlutterSession().set("token", userName.text);
      Navigator.pushReplacementNamed(context, '/dashboard');
    }

    return data;
  }

  User? user_ = null;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3C892),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(
              'assets/images/wave.svg',
              width: double.infinity,
              height: 150,
              fit: BoxFit.fitHeight,
            ),
            Image.asset(
              'assets/images/logo.png',
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Text(
                'SMAN 1 MARGAASIH',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 63, 63, 63),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
              child: FormField(
                autovalidateMode: AutovalidateMode.always,
                builder: (FormFieldState<dynamic> field) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color(0xFFFFF1BD),
                                width: 5,
                              ),
                            ),
                            child: TextFormField(
                              controller: userName,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Username / NISN harus diisi';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Username / NISN',
                                focusColor: Colors.white,
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 63, 63, 63),
                                ),
                                errorText:
                                    field.hasError ? field.errorText : null,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFFFF1BD),
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              style: TextStyle(
                                color: Color.fromARGB(255, 63, 63, 63),
                              ),
                              onTap: () {},
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color(0xFFFFF1BD),
                                width: 5,
                              ),
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password Harus diisi';
                                }
                                return null;
                              },
                              controller: Password,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                focusColor: Colors.white,
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 63, 63, 63),
                                ),
                                errorText:
                                    field.hasError ? field.errorText : null,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFFFF1BD),
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              style: TextStyle(
                                color: Color.fromARGB(255, 63, 63, 63),
                              ),
                              onTap: () {},
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                // Validate returns true if the form is valid, or false otherwise.
                                if (_formKey.currentState!.validate()) {
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Proses")),
                                  );
                                  _Login();
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Dashboard()));
                                }
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 63, 63, 63)),
                              ),
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(0, 60),
                                primary: Color(0xFFFFF1BD),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
