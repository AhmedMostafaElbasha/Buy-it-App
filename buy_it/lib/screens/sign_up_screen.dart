import 'package:buy_it/constants.dart';
import 'package:buy_it/provider/modal_hud.dart';
import 'package:buy_it/screens/home_page.dart';
import 'package:buy_it/screens/sign_in_screen.dart';
import 'package:buy_it/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:buy_it/services/auth.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static String id = '/sign_up_screen';
  String _username, _email, _password;
  final _auth = Auth();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return ModalProgressHUD(
      inAsyncCall: Provider.of<ModalHud>(context).isLoading,
      child: Scaffold(
        backgroundColor: appMainColor,
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                AppLogo(height),
                SizedBox(height: height * .1),
                CustomTextField(
                  onSaved: (value) {
                    _username = value;
                  },
                  hint: 'Enter your name',
                  icon: Icons.perm_identity,
                ),
                SizedBox(height: height * .02),
                CustomTextField(
                  onSaved: (value) {
                    _email = value;
                  },
                  hint: 'Enter your email',
                  icon: Icons.email,
                ),
                SizedBox(height: height * .02),
                CustomTextField(
                  onSaved: (value) {
                    _password = value;
                  },
                  hint: 'Enter your password',
                  icon: Icons.lock,
                ),
                SizedBox(height: height * .05),
                _signUpButton(context),
                SizedBox(height: height * .05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Do have an account ?   ',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignInScreen.id);
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _signUpButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: Builder(
        builder: (context) => TextButton(
          onPressed: () async {
            final modalHud = Provider.of<ModalHud>(context, listen: false);
            modalHud.changeIsLoading(true);
            if (_formKey.currentState.validate()) {
              try {
                _formKey.currentState.save();
                await _auth.signUpUser(email: _email, password: _password);
                modalHud.changeIsLoading(false);
                Navigator.pushNamed(context, HomePage.id);
              } catch (exception) {
                modalHud.changeIsLoading(false);
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(exception.message),
                  ),
                );
              }
            }
            modalHud.changeIsLoading(false);
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
      ),
    );
  }
}
