import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:assignment/screens/sign_up.dart';
import 'package:assignment/utils/cont_snackbar.dart';
import 'package:assignment/utils/mycolors.dart';
import 'package:assignment/utils/textThemes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "admin";
  String password = 'abc123';
  bool rememberMe = false;
  var usercontroller = TextEditingController();
  var pwdcontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    usercontroller.dispose();
    pwdcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.elliptical(550, 75),
                bottomLeft: Radius.circular(0),
              ),
              image: DecorationImage(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1491147334573-44cbb4602074?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth,
              ),
            )),
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          //to avoid scrollable action
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const SizedBox(height: 50), // Adding space at the top
                Text("Welcome Back", style: MyTextThemes.textHeading),
                const SizedBox(
                  height: 15,
                ),
                Text("Login to your account",
                    style: MyTextThemes.bodyTextStyle),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: usercontroller,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline_outlined),
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    hintText: 'Enter your email here',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: pwdcontroller,
                  obscureText: true,
                  // obscuringCharacter: '*',
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    hintText: 'Enter your password here',

                  ),
                ),
                Padding(padding:   const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            children: [
                              Checkbox(
                                  checkColor: Colors.white,

                                  fillColor: MaterialStateProperty.all(
                                      MyColors.basicColor),
                                  value: rememberMe,
                                  onChanged: (value) {
                                    setState(() {
                                      rememberMe = value!;
                                    });
                                  },
                                  shape: CircleBorder(), // Set the shape to CircleBorder
                                  activeColor: Colors.black

                              ),
                              Text(
                                'Remember Me',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                ),
                              )
                            ]

                        ),
                        TextButton(onPressed: (){}, style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(
                              Colors.grey),
                        ),
                          child: const Text(
                            'Forgot Password ?',
                          ),)

                      ]
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                MaterialButton(
                  onPressed: () {
                    if (username == usercontroller.text &&
                        password == pwdcontroller.text) {
                      successSnackbar(context);

                      // Navigator.push(context,
                      // MaterialPageRoute(builder: (context) => HomePage1()));
                    } else {
                      errorSnackbar(context);
                    }
                    usercontroller.clear();
                    pwdcontroller.clear();
                  },
                  color: MyColors.basicColor,
                  minWidth: 200,
                  shape: const StadiumBorder(),
                  child: const Text("Login"),
                  textColor: Colors.white,
                ),
                const SizedBox(height: 20), // Adjusted spacer
                RichText(
                  text: TextSpan(
                    text: "Don't have an account?",
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => RegistrationPage()));
                          },
                        text: " Sign Up",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.green,

                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
