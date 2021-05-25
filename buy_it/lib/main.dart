import 'package:buy_it/provider/admin_mode.dart';
import 'package:buy_it/provider/modal_hud.dart';
import 'package:buy_it/screens/admin/add_product_page.dart';
import 'package:buy_it/screens/admin/admin_home_page.dart';
import 'package:buy_it/screens/admin/edit_products_page.dart';
import 'package:buy_it/screens/home_page.dart';
import 'package:buy_it/screens/sign_up_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/sign_in_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ModalHud>(
          create: (context) => ModalHud(),
        ),
        ChangeNotifierProvider<AdminMode>(
          create: (context) => AdminMode(),
        ),
      ],
      child: MaterialApp(
        initialRoute: SignInScreen.id,
        routes: {
          SignInScreen.id: (context) => SignInScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          HomePage.id: (context) => HomePage(),
          AdminHomePage.id: (context) => AdminHomePage(),
          AddProductPage.id: (context) => AddProductPage(),
          EditProductsPage.id: (context) => EditProductsPage(),
        },
      ),
    );
  }
}
