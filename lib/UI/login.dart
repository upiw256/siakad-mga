// ignore_for_file: avoid_unnecessary_containers, unnecessary_const, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                                    const SnackBar(
                                        content: Text('Processing Data')),
                                  );
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
