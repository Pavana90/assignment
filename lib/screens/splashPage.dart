import 'package:assignment/screens/login.dart';
import 'package:assignment/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,

            //image: AssetImage("assets/images/background.png"),

            /// OR
            image: NetworkImage(
                "https://images.unsplash.com/photo-1491147334573-44cbb4602074?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")),
      ),
foregroundDecoration: BoxDecoration(color: Colors.white.withOpacity(.5)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("The best app for your plants",

                ///style using google fonts
                style: GoogleFonts.cairo(
                  fontSize: 60,
                  color: Colors.white,
                )),
            const SizedBox(
              height: 15,

            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegistrationPage()));


              },
              color: Colors.white,
              minWidth: 300,
              shape: const StadiumBorder(),
              child: const Text("Sign Up"),
            ),
            const SizedBox(
              height: 15,

            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                     MaterialPageRoute(builder: (context) => LoginPage()));

              },
              color: Colors.green,
              minWidth: 300,
              shape: const StadiumBorder(),
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    )


    );
  }
}
