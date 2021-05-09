import 'package:buy_it/screens/sign_up_screen.dart';
import 'package:buy_it/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:buy_it/constants.dart';

// ignore: must_be_immutable
class SignInScreen extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static String id = '/sign_in_screen';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: appMainColor,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              AppLogo(height),
              SizedBox(height: height * .1),
              CustomTextField(
                hint: 'Enter your email',
                icon: Icons.email,
              ),
              SizedBox(height: height * .02),
              CustomTextField(
                hint: 'Enter your password',
                icon: Icons.lock,
              ),
              SizedBox(height: height * .05),
              _signInButton(),
              SizedBox(height: height * .05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account ?   ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpScreen.id);
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _signInButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: TextButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            // Do Something.
          }
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.black,
          ),
        ),
        child: Text(
          'Sign In',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
