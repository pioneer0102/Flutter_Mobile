import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:myflutter/Animation/Fade_Animation.dart';

class FormData {
  String? email;
  String? password;
  FormData({this.email, this.password});
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Color enabled = const Color.fromARGB(255, 63, 56, 89);
  // Color enabledtxt = Colors.white;
  // Color disable = Colors.grey;
  // Color backgroundColor = const Color(0xFF1F1A30);
  // bool ispasswordev = true;
  // FormData selected = FormData();
  late String _errorEmail;
  late String _errorPassword;
  bool passwordVisible = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    _errorEmail = '';
    _errorPassword = '';
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? validateEmail(String value) {
    if (!EmailValidator.validate(value) || value.isEmpty) {
      return "Your email is not valid";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 8) {
      return "Your password is too short";
    }
    return null;
  }

  void handleLogin() {
    // selected.email = emailController.text;
    // selected.password = passwordController.text;
    String? emailError = validateEmail(emailController.text);
    String? passwordError = validatePassword(passwordController.text);
    setState(() {
      _errorEmail = emailError ?? '';
      _errorPassword = passwordError ?? '';
      if (emailError == null && passwordError == null) {
        // print(emailController.text + passwordController.text);
        Navigator.pushNamed(context, '/bloc');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              // gradient: LinearGradient(
              //     begin: Alignment.topLeft,
              //     end: Alignment.bottomRight,
              //     //     stops: const [
              //     //   0.1,
              //     //   0.4,
              //     //   0.7,
              //     //   0.9
              //     // ],
              //     colors: [
              //   Colors.lightGreen,
              //   Colors.blue,
              //   // HexColor("#4b4293").withOpacity(0.8),
              //   // HexColor("#4b4293"),
              //   // HexColor("#08418e"),
              //   // HexColor("#08418e")
              // ])
              ),
          child: Center(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text("Login Page",
                        style: TextStyle(color: Colors.black, fontSize: 20))),
                Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 15.0, right: 15.0),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          labelText: 'Email',
                          hintText: 'Enter valid email as abc@gmail.com',
                          errorText: (_errorEmail != '') ? _errorEmail : null),
                    )),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 20, bottom: 20),
                    child: TextField(
                      controller: passwordController,
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        labelText: 'Password',
                        hintText: 'Enter secure password',
                        errorText:
                            (_errorPassword != '') ? _errorPassword : null,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                          child: Container(
                              margin: const EdgeInsets.all(13),
                              child: Icon(
                                  passwordVisible
                                      ? Icons.remove_red_eye_sharp
                                      : FontAwesomeIcons.eyeSlash,
                                  color: Colors.grey,
                                  size: 25)),
                        ),
                      ),
                    )),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                    onPressed: () {
                      handleLogin();
                      // Navigator.pushNamed(context, '/next');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent, elevation: 0),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Don't have an account? ",
                        style: TextStyle(
                          color: Colors.grey,
                          letterSpacing: 0.5,
                        )),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/next');
                      },
                      child: Text("Sign up",
                          style: TextStyle(
                              color: Colors.grey.withOpacity(0.9),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                              fontSize: 14)),
                    ),
                  ],
                ),
              ],
            ),
          ))),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text(emailController.text),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}
