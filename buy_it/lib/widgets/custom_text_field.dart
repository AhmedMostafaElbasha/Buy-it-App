import 'package:buy_it/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final Function(String) onSaved;

  CustomTextField({
    @required this.hint,
    this.icon,
    @required this.onSaved,
  });

  // ignore: missing_return
  String _errorMessage(String hint) {
    switch (hint) {
      case 'Enter your name':
        return 'Name is required';
      case 'Enter your email':
        return 'Email is required';
      case 'Enter your password':
        return 'Password is required';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        // ignore: missing_return
        validator: (value) {
          if (value.isEmpty) return _errorMessage(hint);
        },
        onSaved: onSaved,
        cursorColor: AppColors.appMainColor,
        obscureText: hint == 'Enter your password' ? true : false,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: AppColors.appMainColor,
          ),
          hintText: hint,
          filled: true,
          fillColor: AppColors.appSecondaryColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
