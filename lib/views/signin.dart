import 'package:flutter/material.dart';
import 'package:lilivery/providers/userLogin.dart';
import 'package:lilivery/services/auth.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn(this.toggleView);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();

  //AuthService authService = new AuthService();

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  void dispose() {
    this.passwordEditingController.dispose();
    this.emailEditingController.dispose();
    super.dispose();
  }

  signIn(UserLogin provider) async {
//    if (formKey.currentState.validate()) {
//      setState(() {
//        isLoading = true;
//      });
//      await authService
//          .signInWithEmailAndPassword(
//          emailEditingController.text, passwordEditingController.text)
//          .then((result) async {
//        if (result != null) {
//          QuerySnapshot userInfoSnapshot =
//          await DatabaseMethods().getUserInfo(emailEditingController.text);
//
//          HelperFunctions.saveUserLoggedInSharedPreference(true);
//          HelperFunctions.saveUserNameSharedPreference(
//              userInfoSnapshot.documents[0].data["userName"]);
//          HelperFunctions.saveUserEmailSharedPreference(
//              userInfoSnapshot.documents[0].data["userEmail"]);
//          Constants.myName =
//          await HelperFunctions.getUserNameSharedPreference();
//          provider.login();
//          setOnlineStatus(Constants.myName);
//        } else {
//          setState(() {
//            isLoading = false;
//          });
//        }
//      });
//    }
    if(formKey.currentState.validate()){
      provider.login();
    }
  }

  @override
  Widget build(BuildContext context) {
    final userLogin = Provider.of<UserLogin>(context);
    return Scaffold(
      body: isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  Container(
                    child: Text('Logo'),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 50, child: emailInput()),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(height: 50, child: passwordInput()),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          //forgot password page
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Text(
                              "Forgot Password?",
                            )),
                      )
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  RaisedButton(
                    onPressed: () {
                      signIn(userLogin);
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Colors.blueAccent, fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have account? ",
                      ),
                      GestureDetector(
                        onTap: () {
                          widget.toggleView();
                        },
                        child: Text(
                          "Register now",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
    );
  }

  Widget emailInput() {
    return TextFormField(
      controller: emailEditingController,
//      validator: (val) {
//        return RegExp(
//                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                .hasMatch(val)
//            ? null
//            : "Enter correct email";
//      },
      decoration: InputDecoration(
          border:
              OutlineInputBorder(borderRadius: new BorderRadius.circular(10.0)),
          labelText: 'Email'),
    );
  }

  Widget passwordInput() {
    return TextFormField(
//      validator: (val) {
//        return val.length < 6 ? "Enter Password 6+ characters" : null;
//      },
      controller: passwordEditingController,
      decoration: InputDecoration(
          border:
              OutlineInputBorder(borderRadius: new BorderRadius.circular(10.0)),
          labelText: 'Password'),
    );
  }
}
