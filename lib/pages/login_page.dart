import 'package:catalog/pages/utilities/routes.dart';
import 'package:catalog/pages/utilities/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = " ";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset('assets/images/login1.png',fit: BoxFit.cover,),
              Container(
                padding: EdgeInsets.fromLTRB(0, 35.0, 0.0, 0.0),
                height: 300,
                width: 370,
                child: Image.asset(
                  'assets/images/login2.png',
                  fit: BoxFit.cover,
                ),
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "User name can't be null ";
                        } else if (value.length < 2) {
                          return "no way your name can be this small";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        value = name;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Enter password', labelText: 'Pass word'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password can't be null ";
                        } else if (value.length < 6) {
                          return " Password should be more than 6 digit";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Material(
                      color: context.theme.buttonColor,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 8),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          alignment: Alignment.center,
                          width: changeButton ? 50 : 130,
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
                    ),
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
