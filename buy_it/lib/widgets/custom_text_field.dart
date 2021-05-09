import 'package:flutter/material.dart';
import 'package:buy_it/constants.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;

  CustomTextField({
    @required this.hint,
    @required this.icon,
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
        cursorColor: appMainColor,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: appMainColor,
          ),
          hintText: hint,
          filled: true,
          fillColor: appSecondaryColor,
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
