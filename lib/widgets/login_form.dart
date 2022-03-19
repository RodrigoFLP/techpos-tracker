import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  LoginForm(this.loginRequest);

  final void Function(
    String email,
    String password,
    BuildContext ctx,
    Function setProcess,
  ) loginRequest;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailFocusNode = FocusNode();
  final _passFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _errorMessage;
  String _email;
  String _password;
  bool isLoading = false;

  void setProcess() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void _trySubmit() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      widget.loginRequest(_email, _password, context, setProcess);
      print(_email);
      print(_password);
      // Navigator.pushNamed(context, '/homePage');
    } else {
      Scaffold.of(context).removeCurrentSnackBar();
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(_errorMessage)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final _deviceHeight = MediaQuery.of(context).size.height;
    final _deviceWidth = MediaQuery.of(context).size.width;
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Container(
              height: _deviceHeight,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: _deviceHeight * 0.1,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 30),
                    child: Image.asset(
                      'assets/images/samba_logo.png',
                      fit: BoxFit.contain,
                    ),
                    height: _deviceHeight * 0.25,
                  ),
                  SizedBox(
                    height: _deviceHeight * 0.05,
                  ),
                  Container(
                    width: _deviceWidth * 0.8,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: TextFormField(
                              focusNode: _emailFocusNode,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(_passFocusNode);
                              },
                              validator: (value) {
                                Pattern pattern =
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                RegExp regex = new RegExp(pattern);
                                if (value.isEmpty) {
                                  _errorMessage =
                                      'Ingresa tu correo electrónico';
                                  return '';
                                } else if (!regex.hasMatch(value)) {
                                  _errorMessage =
                                      'Ingresa un correo electrónico válido';

                                  return '';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                _email = value;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                errorStyle: TextStyle(
                                  height: 0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent,
                                ),
                                border: InputBorder.none,
                                hintText: 'Ingresa tu correo electrónico',
                                prefixIcon: Icon(
                                  EvaIcons.atOutline,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: TextFormField(
                              focusNode: _passFocusNode,
                              onSaved: (value) {
                                _password = value;
                              },
                              validator: (value) {
                                if (value.isEmpty || value.length < 7) {
                                  _errorMessage = 'Contraseña inválida';
                                  return '';
                                } else {
                                  return null;
                                }
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                errorStyle: TextStyle(
                                  height: 0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent,
                                ),
                                border: InputBorder.none,
                                hintText: 'Ingresa tu contraseña',
                                prefixIcon: Icon(
                                  EvaIcons.lockOutline,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: _deviceHeight * 0.05,
                          ),
                          Container(
                            width: _deviceWidth * 0.8,
                            child: RaisedButton(
                              splashColor: Colors.redAccent.withOpacity(0.8),
                              highlightColor: Colors.red,
                              padding: EdgeInsets.all(18),
                              onPressed: _trySubmit,
                              elevation: 0,
                              focusElevation: 0,
                              highlightElevation: 0,
                              hoverElevation: 0,
                              color: Theme.of(context).primaryColor,
                              child: Text(
                                'INGRESAR',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: _deviceHeight * 0.02,
                          ),
                          Container(
                            child: Text(
                              'Olvidé mi contraseña',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // color: Colors.black12,
                    height: _deviceHeight * 0.40,
                  ),
                  Container(
                    width: _deviceWidth * 0.6,
                    child: RaisedButton(
                      splashColor: Colors.redAccent.withOpacity(0.8),
                      highlightColor: Colors.red,
                      padding: EdgeInsets.all(18),
                      // onPressed: () => Navigator.pushNamed(context, SignUpScreen.routeName),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        showDialog(
                            barrierColor: Colors.black.withOpacity(0.6),
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0)), //this right here
                                child: Container(
                                  height: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        FittedBox(
                                          child: Text(
                                            'INGRESA UN IDENTIFICADOR',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 5,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: TextFormField(
                                            onSaved: (value) {
                                              // _password = value;
                                            },
                                            decoration: InputDecoration(
                                              errorStyle: TextStyle(
                                                height: 0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.redAccent,
                                              ),
                                              border: InputBorder.none,
                                              hintText: 'ID',
                                              prefixIcon: Icon(
                                                EvaIcons.lockOutline,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40,
                                          width: _deviceWidth * 0.8,
                                          child: RaisedButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100)),
                                            ),
                                            hoverElevation: 0,
                                            focusElevation: 0,
                                            highlightElevation: 0,
                                            elevation: 0,
                                            onPressed: () {
                                              Navigator.pop(context, ['hola']);
                                            },
                                            child: Text(
                                              "CONFIRMAR",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).then((value) => print(value));
                      },
                      elevation: 0,
                      focusElevation: 0,
                      highlightElevation: 0,
                      hoverElevation: 0,
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        'REGISTRARSE',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
