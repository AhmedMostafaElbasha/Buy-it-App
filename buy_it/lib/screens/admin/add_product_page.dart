import 'package:buy_it/data/model/product.dart';
import 'package:buy_it/services/fire_store.dart';
import 'package:buy_it/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddProductPage extends StatelessWidget {
  static String id = '/add_product_page';
  String _productName,
      _productPrice,
      _productDescription,
      _productCategory,
      _productImagePath;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _store = FireStore();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              hint: "Product Name",
              onSaved: (value) {
                _productName = value;
              },
            ),
            SizedBox(
              height: height * 0.01,
            ),
            CustomTextField(
              hint: "Product Price",
              onSaved: (value) {
                _productPrice = value;
              },
            ),
            SizedBox(
              height: height * 0.01,
            ),
            CustomTextField(
              hint: "Product Description",
              onSaved: (value) {
                _productDescription = value;
              },
            ),
            SizedBox(
              height: height * 0.01,
            ),
            CustomTextField(
              hint: "Product Category",
              onSaved: (value) {
                _productCategory = value;
              },
            ),
            SizedBox(
              height: height * 0.01,
            ),
            CustomTextField(
              hint: "Product Image Path",
              onSaved: (value) {
                _productImagePath = value;
              },
            ),
            SizedBox(
              height: height * 0.02,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();

                  final product = Product(
                    productName: _productName,
                    productPrice: _productPrice,
                    productDescription: _productDescription,
                    productCategory: _productCategory,
                    productImagePath: _productImagePath,
                  );

                  _store.addProduct(product);
                }
              },
              child: Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }
}
