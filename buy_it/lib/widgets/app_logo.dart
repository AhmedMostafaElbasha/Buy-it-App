import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double height;

  AppLogo(this.height);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: height * .1),
      child: Container(
        height: height * .15,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: AssetImage('images/icons/buy_icon.png'),
            ),
            Positioned(
              bottom: 0,
              child: Text(
                'Buy it',
                style: TextStyle(
                  fontFamily: "Pacifico",
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
