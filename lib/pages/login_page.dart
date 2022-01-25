import 'package:catalog/pages/ulitities/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset('assets/images/login1.png',fit: BoxFit.cover,),
              Image.asset(
                'assets/images/login.png',
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "WelCome ${name}",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Enter user name', labelText: 'Username'),
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Enter password', labelText: 'Pass word'),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          changeButton = true;
                        });
                        await Future.delayed(Duration(seconds: 1));
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          color: Colors.blue.shade600,
                          borderRadius:
                              BorderRadius.circular(changeButton ? 50 : 8),
                        ),
                        alignment: Alignment.center,
                        width: changeButton ? 50 : 150,
                        height: 50,
                        duration: Duration(seconds: 1),
                        child: changeButton
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                      ),
                    ),

                    //ElevatedButton(
                    //onPressed: () {
                    //Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //},
                    //child: Text('Log-In'),
                    //style: TextButton.styleFrom(minimumSize: Size(150.0, 40)),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
