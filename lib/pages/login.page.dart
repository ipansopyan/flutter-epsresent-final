import 'package:flutter/material.dart';
import 'package:epresent/Bloc/AuthBloc.dart';
import 'package:epresent/widget/first.dart';
import 'package:epresent/widget/textLogin.dart';
import 'package:epresent/widget/verticalText.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthBloc authBloc = null;
  String msgStatus = '';

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  _onPressed() {
    setState(() {

      
            if (_emailController.text.trim().toLowerCase().isEmpty) {
              msgStatus = "email harus di isi";
              _showDialog();
            } else if (_passwordController.text.trim().toLowerCase().isEmpty) {
              msgStatus = "password harus di isi";
              _showDialog();
            }
            if (_emailController.text.trim().toLowerCase().isNotEmpty &&
                _passwordController.text.trim().isNotEmpty) {
              AuthBloc.loginData(_emailController.text.trim().toLowerCase(),
                      _passwordController.text.trim())
                  .then((value) {
                authBloc = value;
                if (authBloc != null) {
                  
                  Navigator.pushReplacementNamed(context, '/dashboard');
                } else {
                  msgStatus = "email / password salah";
                  _showDialog();
                }
              });
            }
          });
        }
      
        @override
        Widget build(BuildContext context) {
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blueGrey, Colors.lightBlueAccent]),
              ),
              child: ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(children: <Widget>[
                        VerticalText(),
                        TextLogin(),
                      ]),
                      Padding(
                        padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
                        child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: new TextField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: Colors.lightBlueAccent,
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
                        child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: new TextField(
                            controller: _passwordController,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, right: 50, left: 200),
                        child: Container(
                          alignment: Alignment.bottomRight,
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue[300],
                                blurRadius:
                                    10.0, // has the effect of softening the shadow
                                spreadRadius:
                                    1.0, // has the effect of extending the shadow
                                offset: Offset(
                                  5.0, // horizontal, move right 10
                                  5.0, // vertical, move down 10
                                ),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: new FlatButton(
                            onPressed: () async {
                              _onPressed();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'OK',
                                  style: TextStyle(
                                    color: Colors.lightBlueAccent,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.lightBlueAccent,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      FirstTime(),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      
        void _showDialog() {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: new Text('Failed'),
                  content: new Text(msgStatus),
                  actions: <Widget>[
                    new RaisedButton(
                      child: new Text(
                        'tutup',
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
        }
      
}
