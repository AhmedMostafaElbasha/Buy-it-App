import 'package:buy_it/colors.dart';
import 'package:buy_it/provider/admin_mode.dart';
import 'package:buy_it/provider/modal_hud.dart';
import 'package:buy_it/screens/admin/admin_home_page.dart';
import 'package:buy_it/screens/home_page.dart';
import 'package:buy_it/screens/sign_up_screen.dart';
import 'package:buy_it/services/auth.dart';
import 'package:buy_it/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SignInScreen extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static String id = '/sign_in_screen';
  String _email, _password;
  final _auth = Auth();
  var _adminPassword = 'admin1234';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var isAdmin = Provider.of<AdminMode>(context).isAdmin;
    final adminMode = Provider.of<AdminMode>(context, listen: false);

    return Scaffold(
      backgroundColor: AppColors.appMainColor,
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModalHud>(context).isLoading,
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                AppLogo(height),
                SizedBox(height: height * .1),
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
                _signInButton(isAdmin),
                SizedBox(height: height * .03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account ?   ',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignUpScreen.id);
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: height * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        adminMode.changeIsAdmin(true);
                      },
                      child: Text(
                        'I\'m an admin',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color:
                              isAdmin ? AppColors.appMainColor : Colors.white,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        adminMode.changeIsAdmin(false);
                      },
                      child: Text(
                        'I\'m a user',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color:
                              isAdmin ? Colors.white : AppColors.appMainColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _signInButton(bool isAdmin) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: Builder(
        builder: (context) => TextButton(
          onPressed: () {
            _validateUserInput(context, isAdmin);
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
      ),
    );
  }

  void _validateUserInput(BuildContext context, bool isAdmin) async {
    final modalHud = Provider.of<ModalHud>(context, listen: false);
    modalHud.changeIsLoading(true);
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (isAdmin) {
        // Do Something
        if (_password == _adminPassword) {
          try {
            await _auth.signInUser(email: _email, password: _password);
            modalHud.changeIsLoading(false);
            Navigator.pushNamed(context, AdminHomePage.id);
          } catch (exception) {
            modalHud.changeIsLoading(false);
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(exception.message),
              ),
            );
          }
        } else {
          modalHud.changeIsLoading(false);
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("Unauthorized to login as an admin."),
            ),
          );
        }
      } else {
        try {
          await _auth.signInUser(email: _email, password: _password);
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
    }
    modalHud.changeIsLoading(false);
  }
}
