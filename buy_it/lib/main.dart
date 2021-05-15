import 'package:buy_it/screens/home_page.dart';
import 'package:buy_it/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/sign_in_screen.dart';
import 'package:provider/provider.dart';
import 'package:buy_it/provider/modal_hud.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ModalHud>(
      create: (context) => ModalHud(),
      child: MaterialApp(
        initialRoute: SignInScreen.id,
        routes: {
          SignInScreen.id: (context) => SignInScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          HomePage.id: (context) => HomePage(),
        },
      ),
    );
  }
}
