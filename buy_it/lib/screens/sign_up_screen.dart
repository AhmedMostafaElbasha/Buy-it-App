import 'package:buy_it/constants.dart';
import 'package:buy_it/screens/sign_in_screen.dart';
import 'package:buy_it/widgets/widgets.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static String id = '/sign_up_screen';

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
                hint: 'Enter your name',
                icon: Icons.perm_identity,
              ),
              SizedBox(height: height * .02),
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
              _signUpButton(),
              SizedBox(height: height * .05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Do have an account ?   ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignInScreen.id);
                    },
                    child: Text(
                      'Sign In',
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

  Padding _signUpButton() {
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
          'Sign Up',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
