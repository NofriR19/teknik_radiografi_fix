import 'package:teknikradiografi/api/teknikradiografi_api.dart';
import 'package:teknikradiografi/model/user.dart';
import 'package:teknikradiografi/notifier/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teknikradiografi/constans.dart';


enum AuthMode { Signup, Login }

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = new TextEditingController();
  AuthMode _authMode = AuthMode.Login;

  User _user = User();

  @override
  void initState() {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    initializeCurrentUser(authNotifier);
    super.initState();
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);

    if (_authMode == AuthMode.Login) {
      login(_user, authNotifier);
    } else {
      signup(_user, authNotifier);
    }
  }

  Widget _buildDisplayNameField() {
    Padding(
      padding: EdgeInsets.only(top: 12.0),
    );
    return TextFormField(
      decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorPalette.underlineTextField,
              width: 1.5,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 3.0,
            ),
          ),
        hintText: "Username",
        hintStyle: TextStyle(color: ColorPalette.hintColor),
      ),
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Username is required';
        }

        if (value.length < 5 || value.length > 12) {
          return 'Username must be betweem 5 and 12 characters';
        }

        return null;
      },
      onSaved: (String value) {
        _user.displayName = value;
      },

    );
  }

  Widget _buildEmailField() {
    Padding(
      padding: EdgeInsets.only(top: 12.0),
    );
    return TextFormField(
      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorPalette.underlineTextField,
            width: 1.5,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 3.0,
          ),
        ),
        hintText: "Email",
        hintStyle: TextStyle(color: ColorPalette.hintColor),
      ),
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is required';
        }

        if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email address';
        }

        return null;
      },
      onSaved: (String value) {
        _user.email = value;
      },
    );
  }

  Widget _buildPasswordField() {
    Padding(
      padding: EdgeInsets.only(top: 12.0),
    );
    return TextFormField(
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorPalette.underlineTextField,
            width: 1.5,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 3.0,
          ),
        ),
        hintText: "Password",
        hintStyle: TextStyle(color: ColorPalette.hintColor),
      ),
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      obscureText: true,
      controller: _passwordController,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is required';
        }

        if (value.length < 5 || value.length > 20) {
          return 'Password must be betweem 5 and 20 characters';
        }

        return null;
      },
      onSaved: (String value) {
        _user.password = value;
      },
    );
  }

  Widget _buildConfirmPasswordField() {
    Padding(
      padding: EdgeInsets.only(top: 12.0),
    );
    return TextFormField(
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorPalette.underlineTextField,
            width: 1.5,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 3.0,
          ),
        ),
        hintText: "Confirm Password",
        hintStyle: TextStyle (color: ColorPalette.hintColor),
      ),
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      obscureText: true,
      validator: (String value) {
        if (_passwordController.text != value) {
          return 'Passwords do not match';
        }

        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print("Building login screen");

    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        decoration: BoxDecoration(color: Color(0xff34056D)),
        child: Form(
          autovalidate: true,
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  _iconLogin(),
                  _titleDescription(),

//                  Text(
//                    "Please Sign In",
//                    textAlign: TextAlign.center,
//                    style: TextStyle(fontSize: 36, color: Colors.white),
//                  ),
                  SizedBox(height: 32),
                  _authMode == AuthMode.Signup ? _buildDisplayNameField() : Container(),
                  _buildEmailField(),
                  _buildPasswordField(),
                  _authMode == AuthMode.Signup ? _buildConfirmPasswordField() : Container(),
                  SizedBox(height: 32),
                  _buildButton(context),

//                  ButtonTheme(
//                    minWidth: 200,
//                    child: RaisedButton(
//                      padding: EdgeInsets.all(10.0),
//                      child: Text(
//                        'Switch to ${_authMode == AuthMode.Login ? 'Signup' : 'Login'}',
//                        style: TextStyle(fontSize: 20, color: Colors.white),
//                      ),
//                      onPressed: () {
//                        setState(() {
//                          _authMode =
//                          _authMode == AuthMode.Login ? AuthMode.Signup : AuthMode.Login;
//                        });
//                      },
//                    ),
//                  ),
//                  SizedBox(height: 16),
//                  ButtonTheme(
//                    minWidth: 200,
//                    child: RaisedButton(
//                      padding: EdgeInsets.all(10.0),
//                      onPressed: () => _submitForm(),
//                      child: Text(
//                        _authMode == AuthMode.Login ? 'Login' : 'Signup',
//                        style: TextStyle(fontSize: 20, color: Colors.white),
//                      ),
//                    ),
//                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {

    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              onPressed: () => _submitForm(),
              child: Text(
                _authMode == AuthMode.Login ? 'Login' : 'Signup',
                style: TextStyle(color: ColorPalette.primaryColor),
                textAlign: TextAlign.center,
              ),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                          ),
            ),


        //DIKASIH ON PRESSED BIAR BISA KE HOME PAGE
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        Text(
          'or',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
        FlatButton(
          child: Text(
            'Switch to ${_authMode == AuthMode.Login ? 'Signup' : 'Login'}',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            setState(() {
              _authMode =
              _authMode == AuthMode.Login ? AuthMode.Signup : AuthMode.Login;
            });
          },
        )
      ],
    );
  }

  Widget _titleDescription() {
    return Column (
      children: <Widget>[
        Padding (
          padding: EdgeInsets.only(top: 16.0),
        ),
        Text (
          "Login to Teknik Radiografi App",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        Text (
          "Insert your Email and Password!",
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _iconLogin() {
    return Image.asset(
      "images/icon_login.png",
      width: 150.0,
      height: 150.0,
    );
  }
}


