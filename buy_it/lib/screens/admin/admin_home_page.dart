import 'package:buy_it/colors.dart';
import 'package:buy_it/screens/admin/add_product_page.dart';
import 'package:buy_it/screens/admin/edit_products_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  static String id = '/admin_home_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appMainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AddProductPage.id);
            },
            child: Text('Add Product'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, EditProductsPage.id);
            },
            child: Text('Edit Product'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('View Orders'),
          ),
        ],
      ),
    );
  }
}
