import 'package:call_away/components/brand_logo.dart';
import 'package:call_away/components/labeled_textfield.dart';
import 'package:call_away/components/signing_button.dart';
import 'package:call_away/screens/sign_up_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          primaryColor: const Color(0xFFCE7A63),
          textTheme:
              const TextTheme(headline6: TextStyle(color: Color(0xFFA1887F)))),
      child: Scaffold(
        body: SafeArea(
            child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: BrandLogo(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: Text(
                    "Sign In",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 48.0),
                    child: LabeledTextField(
                      label: "Email",
                      controller: _emailController,
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: LabeledTextField(
                      label: "Password",
                      isPasswordField: true,
                      controller: _passwordController,
                    )),

                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: SignButton(text: "Sign Up", onPressed: (){
                      
                    }),
                  ),

                   Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                    child: RichText(text: TextSpan(children: [
                      TextSpan(text: "Don't have an account? ", style: GoogleFonts.prompt(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.black
                      )),
                      TextSpan(text: "Sign Up", style: GoogleFonts.prompt(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFFCE7A63)
                      ),
                      recognizer: TapGestureRecognizer()..onTap = (() {
                         Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    // transitionDuration:
                                    //     const Duration(milliseconds: 550),
                                    pageBuilder: (context, animation,
                                            secondaryAnimatio) =>
                                        SignUpScreen(),
                                  ));
                      })
                      ),
                    ]),
                    textAlign: TextAlign.center,
                    ),
                  ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
