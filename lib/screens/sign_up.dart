import 'package:assignment/screens/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:assignment//screens/login_page.dart';
import 'package:assignment/utils/textThemes.dart';

import '../utils/mycolors.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();

///this function will create a mutable state of registrationpage
}

/// mutable state of registrationpage   here we can create and rebuild widget tree using initState() and setState() function
class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController passController = TextEditingController();
  var formkey = GlobalKey<FormState>(); // formkey used to monitor the state of entire form and validate it
  var pwd_visibity = true;

  @override
  void dispose() {
    passController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          //to avoid scrollable action
          //physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formkey,
              // if we do not set key here validation will not occur
              child: Column(
                children: [
                  const SizedBox(height: 50), // Adding space at the top
                  Text("Register", style: MyTextThemes.textHeading),
                  const SizedBox(
                    height: 15,
                  ),
                  Text("Create your new account",
                      style: MyTextThemes.bodyTextStyle),
                  const SizedBox(
                    height: 15,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline_outlined),
                      border: OutlineInputBorder(),
                      labelText: "UserName",
                      hintText: 'Enter your Username here',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (email) {
                      if (email!.isEmpty || !email.contains('@')) {
                        return "email must be a valid email";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                      border: OutlineInputBorder(),
                      labelText: "Email",
                      hintText: 'Enter your email here',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: passController,
                    obscureText: pwd_visibity,
                   // obscuringCharacter: '*',
                    validator: (password) {
                      if (password!.isEmpty || password.length < 6) {
                        return 'Password is empty or / check the length';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (pwd_visibity == true) {
                                pwd_visibity = false;
                              } else {
                                pwd_visibity = true;
                              }
                            });
                          },
                          icon: Icon(pwd_visibity == true
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      border: OutlineInputBorder(),
                      labelText: "Password",
                      hintText: 'Enter your password here',
                      helperText:
                      'Password must contain upper and lowercase letters',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    //obscuringCharacter: '*',
                    obscureText: pwd_visibity,
                    validator: (confirmpassword) {
                      if (confirmpassword!.isEmpty ||
                          confirmpassword != passController.text) {
                        return "password empty/mismatch";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (pwd_visibity == true) {
                                pwd_visibity = false;
                              } else {
                                pwd_visibity = true;
                              }
                            });
                          },
                          icon: Icon(pwd_visibity == true
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      border: OutlineInputBorder(),
                      labelText: "Confirm Password",
                      hintText: 'Confirm your password here',
                    ),
                  ),
                  const SizedBox(height: 20), // Adjusted spacer
                  RichText(
                    text: TextSpan(
                      text: "By signing you agree to our",
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => RegistrationPage()));
                            },
                          text: "Team of use and privacy notice",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,

                            color: Colors.green,

                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    onPressed: () {
                      var valid = formkey.currentState!.validate();
                      if (valid == true) {
                       // Navigator.push(
                           // context,
                           //  MaterialPageRoute(
                           //      builder: (context) => LoginPage()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Registration failed")));
                      }
                    },
                    color: MyColors.basicColor,
                    minWidth: 200,
                    shape: const StadiumBorder(),
                    child: const Text("Sign Up"),
                  ),
                  const SizedBox(height: 20), // Adjusted spacer
                  TextButton(
                      onPressed: () {
                       //  Navigator.push(
                       //      context,
                       //      MaterialPageRoute(
                       //          builder: (context) => LoginPage()));
                        },
                      child: Text("Don't have an account? SignIn Here!!",
                          style: MyTextThemes.bodyTextStyle))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}